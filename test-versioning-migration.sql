-- ==============================================================
-- TEST VERSIONING MIGRATION
-- Run ONCE in Supabase > SQL Editor.
-- Adds version lineage tracking to the tests table.
-- Safe: uses IF NOT EXISTS / ADD COLUMN IF NOT EXISTS.
-- ==============================================================

ALTER TABLE public.tests
  ADD COLUMN IF NOT EXISTS parent_test_id uuid REFERENCES public.tests(id) ON DELETE SET NULL;
