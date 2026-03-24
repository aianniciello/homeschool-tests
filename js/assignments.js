// ──────────────────────────────────────────────────────────────
// js/assignments.js
// Shared module for the unified assignment + activity tracking system.
//
// Core loop: Teacher assigns → Student completes → App tracks → Teacher reviews
//
// Content types: 'test' | 'arcade_game' | 'socratic'
// Note: 'supplement' is NOT a content type — supplements are external links
// and are never assigned or tracked through this system.
// ──────────────────────────────────────────────────────────────

import { supabase } from './supabase.js'

const VALID_CONTENT_TYPES = ['test', 'arcade_game', 'socratic']

// ── Assign content to a student or a whole class ─────────────
// Options:
//   schoolId     (required)
//   contentType  (required) — 'test' | 'arcade_game' | 'socratic'
//   contentId    (required) — UUID of the content item
//   studentId    (provide this OR classId)
//   classId      (provide this OR studentId) — assigns to every student in the class
//   dueDate      (optional) — ISO date string or null
//
// For contentType === 'test', contentId is also written to test_id for
// backwards compatibility with existing queries.
//
// Returns { data, error }
export async function assignContent({ schoolId, contentType, contentId, studentId, classId, dueDate = null }) {
  if (!VALID_CONTENT_TYPES.includes(contentType)) {
    return { data: null, error: new Error(`Invalid content_type: ${contentType}. Must be one of: ${VALID_CONTENT_TYPES.join(', ')}`) }
  }

  // Resolve the list of student IDs to assign to
  let studentIds = []
  if (classId) {
    const { data: students, error: studentsErr } = await supabase
      .from('students')
      .select('id')
      .eq('class_id', classId)
      .eq('school_id', schoolId)
    if (studentsErr) return { data: null, error: studentsErr }
    studentIds = (students || []).map(s => s.id)
  } else if (studentId) {
    studentIds = [studentId]
  } else {
    return { data: null, error: new Error('Either studentId or classId is required') }
  }

  if (studentIds.length === 0) {
    return { data: [], error: null }
  }

  const rows = studentIds.map(sid => ({
    school_id:    schoolId,
    student_id:   sid,
    content_type: contentType,
    content_id:   contentId || null,
    // Keep test_id populated for backwards compat when type is 'test'
    test_id:      contentType === 'test' ? contentId : null,
    assigned_to:  classId ? 'class' : 'student',
    class_id:     classId || null,
    due_date:     dueDate || null,
  }))

  const { data, error } = await supabase
    .from('assignments')
    .insert(rows)
    .select()

  return { data, error }
}

// ── Get all assignments for a student ────────────────────────
// Returns assignments ordered by due_date ASC (nulls last),
// with joined content_library data where available.
export async function getAssignmentsForStudent(studentId) {
  const { data, error } = await supabase
    .from('assignments')
    .select(`
      id,
      content_type,
      content_id,
      test_id,
      due_date,
      current_attempt,
      assigned_to,
      tests(id, title, description),
      content_library(id, title, description, cycle, week, subject, config)
    `)
    .eq('student_id', studentId)
    .order('due_date', { ascending: true, nullsFirst: false })

  return { data, error }
}

// ── Get all assignments for a teacher's school ───────────────
// Returns assignments grouped by content_type, with student names.
export async function getAssignmentsForTeacher(schoolId) {
  const { data, error } = await supabase
    .from('assignments')
    .select(`
      id,
      content_type,
      content_id,
      test_id,
      due_date,
      student_id,
      assigned_to,
      class_id,
      tests(id, title),
      profiles(full_name),
      content_library(id, title, cycle, week, subject)
    `)
    .eq('school_id', schoolId)
    .order('content_type')
    .order('due_date', { ascending: true, nullsFirst: false })

  return { data, error }
}

// ── Start a content session ───────────────────────────────────
// Call when a student begins any interactive content.
// assignmentId may be null for free-play (unassigned) sessions.
// Returns { sessionId, error }
export async function startSession({ assignmentId, studentId, schoolId, contentType, contentId }) {
  const { data, error } = await supabase
    .from('content_sessions')
    .insert({
      assignment_id: assignmentId || null,
      student_id:    studentId,
      school_id:     schoolId,
      content_type:  contentType,
      content_id:    contentId || null,
      started_at:    new Date().toISOString(),
    })
    .select('id')
    .single()

  return { sessionId: data?.id ?? null, error }
}

// ── Complete a content session ────────────────────────────────
// Call when the student finishes (or the session is otherwise closed).
// All outcome fields are optional — pass only what you have.
//
// score              0–100 integer percentage
// accuracy           0.0–1.0 (correct / total)
// timeSpentSeconds   wall time in seconds since start
// attempts           how many tries were used (default 1)
// metadata           freeform JSONB for content-specific outcomes
//
// Returns { data, error }
export async function completeSession({ sessionId, score, accuracy, timeSpentSeconds, attempts, metadata }) {
  const update = {
    completed_at: new Date().toISOString(),
  }
  if (score           !== undefined) update.score                = score
  if (accuracy        !== undefined) update.accuracy             = accuracy
  if (timeSpentSeconds !== undefined) update.time_spent_seconds  = timeSpentSeconds
  if (attempts        !== undefined) update.attempts             = attempts
  if (metadata        !== undefined) update.metadata             = metadata

  const { data, error } = await supabase
    .from('content_sessions')
    .update(update)
    .eq('id', sessionId)
    .select()
    .single()

  return { data, error }
}

// ── Get sessions for teacher review ──────────────────────────
// Optional filters: { contentType, studentId, cycle, week, subject }
// cycle / week / subject match against the metadata JSONB column.
// Returns sessions ordered by completed_at DESC, with student name.
export async function getSessionsForTeacher(schoolId, filters = {}) {
  let query = supabase
    .from('content_sessions')
    .select(`
      id,
      content_type,
      content_id,
      assignment_id,
      student_id,
      started_at,
      completed_at,
      score,
      accuracy,
      time_spent_seconds,
      attempts,
      metadata,
      profiles(full_name)
    `)
    .eq('school_id', schoolId)
    .order('completed_at', { ascending: false, nullsFirst: false })

  if (filters.contentType) query = query.eq('content_type', filters.contentType)
  if (filters.studentId)   query = query.eq('student_id',   filters.studentId)

  // JSONB filters for content metadata fields
  if (filters.cycle   !== undefined) query = query.eq('metadata->>cycle',   String(filters.cycle))
  if (filters.week    !== undefined) query = query.eq('metadata->>week',    String(filters.week))
  if (filters.subject !== undefined) query = query.eq('metadata->>subject', filters.subject)

  const { data, error } = await query
  return { data, error }
}
