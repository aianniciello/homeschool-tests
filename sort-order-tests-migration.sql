-- ==============================================================
-- SORT ORDER FOR TESTS MIGRATION
-- Run ONCE in Supabase > SQL Editor.
-- Adds lesson/unit ordering to catalogue tests.
-- Safe: uses ADD COLUMN IF NOT EXISTS.
-- ==============================================================

ALTER TABLE public.tests
  ADD COLUMN IF NOT EXISTS sort_order integer;

-- After running, set sort_order on your catalogue tests, e.g.:
--   UPDATE public.tests SET sort_order = 1 WHERE title = 'Chapter 1' AND is_catalogue = true;
--   UPDATE public.tests SET sort_order = 2 WHERE title = 'Chapter 2' AND is_catalogue = true;
