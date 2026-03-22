-- ==============================================================
-- ARCHIVE TESTS MIGRATION
-- Run ONCE in Supabase > SQL Editor.
-- Adds soft-archive support to the tests table.
-- Safe: uses ADD COLUMN IF NOT EXISTS.
-- ==============================================================

ALTER TABLE public.tests
  ADD COLUMN IF NOT EXISTS is_archived boolean NOT NULL DEFAULT false;
