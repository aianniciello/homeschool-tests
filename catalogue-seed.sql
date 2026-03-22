-- ==============================================================
-- CATALOGUE SEED: Henle Latin 2 - Lesson 1
-- Paste into Supabase > SQL Editor and run.
--
-- What this creates:
--   - Makes tests.school_id nullable (required for catalogue tests)
--   - Lesson 1 Vocabulary Test (12 questions)
--   - Lesson 1 Grammar Test (5 questions)
--   Both tests have is_catalogue = true
--
-- Run this ONCE. It is NOT safe to run multiple times.
-- ==============================================================

-- Allow catalogue tests to have no school
ALTER TABLE public.tests ALTER COLUMN school_id DROP NOT NULL;

DO $seed$
DECLARE
  vocab_test_id   uuid;
  grammar_test_id uuid;
  series_id       uuid := 'c0000000-0000-0000-0000-000000000001';

  q1  uuid; q2  uuid; q3  uuid; q4  uuid; q5  uuid;
  q6  uuid; q7  uuid; q8  uuid; q9  uuid; q10 uuid;
  q11 uuid; q12 uuid;

BEGIN

  -- ----------------------------------------
  -- LESSON 1 VOCABULARY TEST
  -- ----------------------------------------
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 1 Vocabulary', 'Review of 1st and 2nd declension vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  -- Q1: silva
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does silva mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q1, 'forest',   true),
    (q1, 'gate',     false),
    (q1, 'year',     false),
    (q1, 'son',      false);

  -- Q2: porta
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does porta mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q2, 'gate',     true),
    (q2, 'forest',   false),
    (q2, 'road',     false),
    (q2, 'land',     false);

  -- Q3: annus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does annus mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q3, 'year',     true),
    (q3, 'son',      false),
    (q3, 'sailor',   false),
    (q3, 'lord',     false);

  -- Q4: filius
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does filius mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q4, 'son',      true),
    (q4, 'year',     false),
    (q4, 'lord',     false),
    (q4, 'sailor',   false);

  -- Q5: magnus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does magnus mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q5, 'great / large', true),
    (q5, 'good',          false),
    (q5, 'long',          false),
    (q5, 'small',         false);

  -- Q6: bonus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does bonus mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q6, 'good',          true),
    (q6, 'great / large', false),
    (q6, 'long',          false),
    (q6, 'small',         false);

  -- Q7: longus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does longus mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q7, 'long',          true),
    (q7, 'great / large', false),
    (q7, 'good',          false),
    (q7, 'small',         false);

  -- Q8: parvus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does parvus mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q8, 'small',         true),
    (q8, 'great / large', false),
    (q8, 'good',          false),
    (q8, 'long',          false);

  -- Q9: terra
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does terra mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q9, 'land / earth',  true),
    (q9, 'forest',        false),
    (q9, 'road',          false),
    (q9, 'gate',          false);

  -- Q10: via
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does via mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q10, 'road / way',   true),
    (q10, 'land / earth', false),
    (q10, 'gate',         false),
    (q10, 'forest',       false);

  -- Q11: nauta
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does nauta mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q11, 'sailor',  true),
    (q11, 'lord',    false),
    (q11, 'son',     false),
    (q11, 'year',    false);

  -- Q12: dominus
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (vocab_test_id, 'What does dominus mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q12, 'lord / master', true),
    (q12, 'sailor',        false),
    (q12, 'son',           false),
    (q12, 'year',          false);

  -- ----------------------------------------
  -- LESSON 1 GRAMMAR TEST
  -- ----------------------------------------
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 1 Grammar', 'Review of 1st and 2nd declension noun cases', true, series_id)
  RETURNING id INTO grammar_test_id;

  -- Q1: direct object case
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (grammar_test_id, 'What case is used for direct objects in Latin?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q1, 'Nominative', false),
    (q1, 'Accusative', true),
    (q1, 'Dative',     false),
    (q1, 'Ablative',   false);

  -- Q2: 1st declension nominative singular ending
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (grammar_test_id, 'What ending marks a 1st declension noun in the nominative singular?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q2, '-a',  true),
    (q2, '-us', false),
    (q2, '-is', false),
    (q2, '-um', false);

  -- Q3: possession case
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (grammar_test_id, 'What case indicates possession (meaning "of")?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q3, 'Genitive', true),
    (q3, 'Dative',   false),
    (q3, 'Ablative', false),
    (q3, 'Locative', false);

  -- Q4: 2nd declension masculine nominative singular
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (grammar_test_id, 'What is the 2nd declension nominative singular ending for masculine nouns?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q4, '-us', true),
    (q4, '-a',  false),
    (q4, '-um', false),
    (q4, '-i',  false);

  -- Q5: indirect object case
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (grammar_test_id, 'What case is used for indirect objects?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q5, 'Accusative', false),
    (q5, 'Dative',     true),
    (q5, 'Ablative',   false),
    (q5, 'Genitive',   false);

  RAISE NOTICE 'Catalogue seed complete! vocab_test_id=%, grammar_test_id=%', vocab_test_id, grammar_test_id;

END $seed$;
