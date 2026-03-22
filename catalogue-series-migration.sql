-- ==============================================================
-- CATALOGUE SERIES MIGRATION
-- Run this AFTER catalogue-seed.sql and catalogue-seed-lessons2-12.sql
-- Creates the series grouping table and assigns all Henle Latin 2 tests.
-- ==============================================================

-- 1. Create the series table
CREATE TABLE public.catalogue_series (
  id          uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title       text NOT NULL,
  description text,
  sort_order  integer DEFAULT 0
);

-- 2. Enable RLS and allow any authenticated user to read series
ALTER TABLE public.catalogue_series ENABLE ROW LEVEL SECURITY;
CREATE POLICY "read catalogue series"
  ON public.catalogue_series FOR SELECT
  USING (true);

-- 3. Add series_id column to tests
ALTER TABLE public.tests ADD COLUMN series_id uuid REFERENCES public.catalogue_series(id);

-- 4. Insert the Henle Latin 2 series with a fixed UUID
INSERT INTO public.catalogue_series (id, title, description, sort_order)
VALUES (
  'c0000000-0000-0000-0000-000000000001',
  'Henle Latin 2',
  'Vocabulary and grammar review tests for all 12 lessons of Henle Latin 2',
  1
);

-- 5. Assign all existing Henle Latin 2 catalogue tests to that series
UPDATE public.tests
SET series_id = 'c0000000-0000-0000-0000-000000000001'
WHERE is_catalogue = true
  AND title LIKE 'Henle Latin 2%';
