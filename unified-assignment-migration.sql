-- ==============================================================
-- UNIFIED ASSIGNMENT & ACTIVITY TRACKING MIGRATION
-- Run once in Supabase > SQL Editor.
-- Safe to re-run (uses IF NOT EXISTS and IF EXISTS guards).
-- Use $seed$ not $$ as dollar-quote delimiter.
-- ==============================================================

-- ────────────────────────────────────────────────────────────
-- 1. Extend assignments table
-- ────────────────────────────────────────────────────────────

-- content_type distinguishes what is being assigned.
-- Defaults to 'test' so all existing rows stay consistent.
ALTER TABLE public.assignments
  ADD COLUMN IF NOT EXISTS content_type  TEXT NOT NULL DEFAULT 'test',
  ADD COLUMN IF NOT EXISTS content_id    UUID,
  ADD COLUMN IF NOT EXISTS assigned_to   TEXT NOT NULL DEFAULT 'student',
  ADD COLUMN IF NOT EXISTS class_id      UUID REFERENCES public.classes(id) ON DELETE SET NULL;

-- test_id becomes nullable so non-test assignments don't require it.
-- Existing rows already have a value so data is unaffected.
ALTER TABLE public.assignments
  ALTER COLUMN test_id DROP NOT NULL;

-- Backfill: existing test assignments get content_id = test_id
-- so both columns are consistent going forward.
UPDATE public.assignments
SET content_id = test_id
WHERE content_type = 'test' AND test_id IS NOT NULL AND content_id IS NULL;

-- ────────────────────────────────────────────────────────────
-- 2. content_sessions table
-- Tracks every engagement with any assigned interactive content.
-- ────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS public.content_sessions (
  id                  UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  assignment_id       UUID        REFERENCES public.assignments(id) ON DELETE SET NULL,
  student_id          UUID        NOT NULL REFERENCES public.profiles(id) ON DELETE CASCADE,
  school_id           UUID        NOT NULL REFERENCES public.schools(id) ON DELETE CASCADE,
  content_type        TEXT        NOT NULL,
  content_id          UUID,
  started_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
  completed_at        TIMESTAMPTZ,
  score               INTEGER,          -- 0–100
  accuracy            NUMERIC,          -- 0.0–1.0
  time_spent_seconds  INTEGER,
  attempts            INTEGER     NOT NULL DEFAULT 1,
  metadata            JSONB
  -- Example metadata shapes:
  -- { "questions_correct": 8, "total_questions": 10 }           arcade multiple choice
  -- { "pairs_matched": 8, "total_pairs": 8 }                    arcade matching
  -- { "overall_score": 4, "dialogue_key": "meno" }              socratic
  -- { "game_type": "flash_card", "cycle": 1, "week": 3 }        flash cards
);

ALTER TABLE public.content_sessions ENABLE ROW LEVEL SECURITY;

-- Students can insert their own sessions
CREATE POLICY "Students can insert their own sessions"
  ON public.content_sessions FOR INSERT TO authenticated
  WITH CHECK (student_id = auth.uid());

-- Students can read their own sessions
CREATE POLICY "Students can read their own sessions"
  ON public.content_sessions FOR SELECT TO authenticated
  USING (student_id = auth.uid());

-- Students can update their own sessions (e.g. to mark completed)
CREATE POLICY "Students can update their own sessions"
  ON public.content_sessions FOR UPDATE TO authenticated
  USING (student_id = auth.uid());

-- Teachers can read all sessions for their school
CREATE POLICY "Teachers can read school sessions"
  ON public.content_sessions FOR SELECT TO authenticated
  USING (
    school_id IN (SELECT id FROM public.schools WHERE teacher_id = auth.uid())
  );

-- ────────────────────────────────────────────────────────────
-- 3. content_library table
-- Registry of assignable interactive content beyond tests.
-- ────────────────────────────────────────────────────────────

CREATE TABLE IF NOT EXISTS public.content_library (
  id           UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  school_id    UUID        REFERENCES public.schools(id) ON DELETE CASCADE,
  content_type TEXT        NOT NULL,  -- 'arcade_game' | 'socratic'
  title        TEXT        NOT NULL,
  description  TEXT,
  cycle        INTEGER,    -- 1, 2, or 3
  week         INTEGER,    -- 1–24
  subject      TEXT,       -- 'Grammar' | 'History' | 'Timeline' | 'Latin' | 'Math' | 'Science' | 'Geography'
  config       JSONB,
  -- Example config shapes:
  -- { "game_type": "matching", "subject": "Latin", "cycle": 1, "week": 1 }
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now()
);

ALTER TABLE public.content_library ENABLE ROW LEVEL SECURITY;

-- Teachers can read global content (school_id IS NULL) and their own school's content
CREATE POLICY "Teachers can read content library"
  ON public.content_library FOR SELECT TO authenticated
  USING (
    school_id IS NULL OR
    school_id IN (SELECT id FROM public.schools WHERE teacher_id = auth.uid())
  );

-- Teachers can add content for their own school
CREATE POLICY "Teachers can insert content library"
  ON public.content_library FOR INSERT TO authenticated
  WITH CHECK (
    school_id IN (SELECT id FROM public.schools WHERE teacher_id = auth.uid())
  );

-- Teachers can update their own school's content
CREATE POLICY "Teachers can update content library"
  ON public.content_library FOR UPDATE TO authenticated
  USING (
    school_id IN (SELECT id FROM public.schools WHERE teacher_id = auth.uid())
  );
