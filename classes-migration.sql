-- ==============================================================
-- CLASSES MIGRATION
-- Run this in Supabase > SQL Editor ONCE.
-- Creates the classes table and adds class_id to students
-- and pending_invites.
-- ==============================================================

-- Create classes table
CREATE TABLE public.classes (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  school_id  uuid REFERENCES public.schools(id) ON DELETE CASCADE NOT NULL,
  name       text NOT NULL,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE public.classes ENABLE ROW LEVEL SECURITY;

-- Teachers can manage classes for their school
CREATE POLICY "Teachers can manage their classes" ON public.classes
  FOR ALL USING (
    school_id IN (SELECT id FROM public.schools WHERE teacher_id = auth.uid())
  );

-- Students can view classes in their school
CREATE POLICY "Students can view their school classes" ON public.classes
  FOR SELECT USING (
    school_id IN (SELECT school_id FROM public.students WHERE id = auth.uid())
  );

-- Add class_id to students
ALTER TABLE public.students
  ADD COLUMN class_id uuid REFERENCES public.classes(id) ON DELETE SET NULL;

-- Add class_id to pending_invites
ALTER TABLE public.pending_invites
  ADD COLUMN class_id uuid REFERENCES public.classes(id) ON DELETE SET NULL;
