-- ==============================================================
-- SOCRATIC SESSIONS MIGRATION
-- Run ONCE in Supabase > SQL Editor.
-- Creates tables to persist student Socratic Trainer sessions.
-- Safe: uses CREATE TABLE IF NOT EXISTS.
-- ==============================================================

-- ── Sessions (one row per completed dialogue) ─────────────────
CREATE TABLE IF NOT EXISTS public.socratic_sessions (
  id             uuid        PRIMARY KEY DEFAULT gen_random_uuid(),
  student_id     uuid        NOT NULL REFERENCES auth.users(id)    ON DELETE CASCADE,
  school_id      uuid        NOT NULL REFERENCES public.schools(id) ON DELETE CASCADE,
  dialogue_key   text        NOT NULL,  -- 'meno' or 'crito'
  dialogue_title text        NOT NULL,
  mc_score       integer     NOT NULL,  -- 0-100
  label_score    integer     NOT NULL,
  write_score    integer     NOT NULL,
  overall_score  integer     NOT NULL,
  completed_at   timestamptz NOT NULL DEFAULT now()
);

-- ── Responses (one row per exchange within a session) ─────────
CREATE TABLE IF NOT EXISTS public.socratic_responses (
  id               uuid         PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id       uuid         NOT NULL REFERENCES public.socratic_sessions(id) ON DELETE CASCADE,
  exchange_index   integer      NOT NULL,  -- 0-based
  mc_correct       boolean      NOT NULL,
  label_score      numeric(5,4) NOT NULL,  -- 0.0000 - 1.0000
  student_question text,
  ai_feedback      text,
  write_rating     text         -- 'Excellent' | 'Good' | 'Needs work'
);

-- ── RLS ───────────────────────────────────────────────────────
ALTER TABLE public.socratic_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.socratic_responses ENABLE ROW LEVEL SECURITY;

-- Students: insert + read own sessions
CREATE POLICY "students_insert_own_socratic_sessions"
  ON public.socratic_sessions FOR INSERT
  WITH CHECK (student_id = auth.uid());

CREATE POLICY "students_read_own_socratic_sessions"
  ON public.socratic_sessions FOR SELECT
  USING (student_id = auth.uid());

-- Teachers: read sessions for their school
CREATE POLICY "teachers_read_school_socratic_sessions"
  ON public.socratic_sessions FOR SELECT
  USING (
    school_id IN (
      SELECT id FROM public.schools WHERE teacher_id = auth.uid()
    )
  );

-- Students: insert + read own responses
CREATE POLICY "students_insert_own_socratic_responses"
  ON public.socratic_responses FOR INSERT
  WITH CHECK (
    session_id IN (
      SELECT id FROM public.socratic_sessions WHERE student_id = auth.uid()
    )
  );

CREATE POLICY "students_read_own_socratic_responses"
  ON public.socratic_responses FOR SELECT
  USING (
    session_id IN (
      SELECT id FROM public.socratic_sessions WHERE student_id = auth.uid()
    )
  );

-- Teachers: read responses for their school's students
CREATE POLICY "teachers_read_school_socratic_responses"
  ON public.socratic_responses FOR SELECT
  USING (
    session_id IN (
      SELECT ss.id
      FROM public.socratic_sessions ss
      JOIN public.schools sc ON ss.school_id = sc.id
      WHERE sc.teacher_id = auth.uid()
    )
  );
