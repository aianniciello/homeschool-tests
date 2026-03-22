-- ==============================================================
-- SEED TEST DATA
-- Paste this entire script into Supabase > SQL Editor and run it.
-- Safe to run multiple times (uses ON CONFLICT DO NOTHING).
--
-- Test accounts created:
--   Teacher:  teacher@test.com  / Test1234!
--   Student:  alice@test.com    / Test1234!
--   Student:  bob@test.com      / Test1234!
--   Student:  carol@test.com    / Test1234!
--
-- What gets created:
--   - 1 school (Johnson Homeschool)
--   - 1 test (Henle Latin 2 Ch.1 Vocab, 5 questions)
--   - Test assigned to all 3 students
--   - Alice has completed the test (5/5)
--   - Bob has completed the test (3/5)
--   - Carol has NOT taken the test yet
-- ==============================================================

DO $$
DECLARE
  -- Fixed UUIDs so re-running is safe
  teacher_id  uuid := 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa';
  s1_id       uuid := 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbb01';  -- Alice
  s2_id       uuid := 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbb02';  -- Bob
  s3_id       uuid := 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbb03';  -- Carol

  school_id   uuid;
  test_id     uuid;

  q1 uuid; q2 uuid; q3 uuid; q4 uuid; q5 uuid;
  a1 uuid; a2 uuid; a3 uuid;

  -- Correct choice IDs
  c1 uuid; c2 uuid; c3 uuid; c4 uuid; c5 uuid;

  -- Wrong choice IDs (for Bob's incorrect answers)
  w4 uuid; w5 uuid;

BEGIN

  -- ----------------------------------------
  -- 1. Auth users (creates login accounts)
  -- ----------------------------------------
  INSERT INTO auth.users (
    id, instance_id, aud, role, email, encrypted_password,
    email_confirmed_at, created_at, updated_at,
    raw_app_meta_data, raw_user_meta_data, is_super_admin
  ) VALUES
    (teacher_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'teacher@test.com', crypt('Test1234!', gen_salt('bf')),
     now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false),

    (s1_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'alice@test.com', crypt('Test1234!', gen_salt('bf')),
     now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false),

    (s2_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'bob@test.com', crypt('Test1234!', gen_salt('bf')),
     now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false),

    (s3_id, '00000000-0000-0000-0000-000000000000', 'authenticated', 'authenticated',
     'carol@test.com', crypt('Test1234!', gen_salt('bf')),
     now(), now(), now(), '{"provider":"email","providers":["email"]}', '{}', false)
  ON CONFLICT (id) DO NOTHING;

  -- Auth identities (required so password login actually works)
  INSERT INTO auth.identities (
    id, provider_id, user_id, identity_data, provider,
    last_sign_in_at, created_at, updated_at
  ) VALUES
    (gen_random_uuid(), teacher_id::text, teacher_id,
     jsonb_build_object('sub', teacher_id::text, 'email', 'teacher@test.com'),
     'email', now(), now(), now()),

    (gen_random_uuid(), s1_id::text, s1_id,
     jsonb_build_object('sub', s1_id::text, 'email', 'alice@test.com'),
     'email', now(), now(), now()),

    (gen_random_uuid(), s2_id::text, s2_id,
     jsonb_build_object('sub', s2_id::text, 'email', 'bob@test.com'),
     'email', now(), now(), now()),

    (gen_random_uuid(), s3_id::text, s3_id,
     jsonb_build_object('sub', s3_id::text, 'email', 'carol@test.com'),
     'email', now(), now(), now())
  ON CONFLICT DO NOTHING;

  -- ----------------------------------------
  -- 2. App data: profiles, school, students
  -- ----------------------------------------
  INSERT INTO public.profiles (id, role, full_name, email) VALUES
    (teacher_id, 'teacher', 'Ms. Johnson',  'teacher@test.com'),
    (s1_id,      'student', 'Alice Smith',  'alice@test.com'),
    (s2_id,      'student', 'Bob Martinez', 'bob@test.com'),
    (s3_id,      'student', 'Carol Lee',    'carol@test.com')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO public.schools (teacher_id, name)
  VALUES (teacher_id, 'Johnson Homeschool')
  RETURNING id INTO school_id;

  INSERT INTO public.students (id, school_id, grade) VALUES
    (s1_id, school_id, '7th'),
    (s2_id, school_id, '7th'),
    (s3_id, school_id, '8th')
  ON CONFLICT (id) DO NOTHING;

  -- ----------------------------------------
  -- 3. Test with 5 questions
  -- ----------------------------------------
  INSERT INTO public.tests (school_id, title, description, is_catalogue)
  VALUES (school_id, 'Henle Latin 2 - Ch.1 Vocabulary', 'Basic vocabulary from Chapter 1', false)
  RETURNING id INTO test_id;

  -- Q1: porta
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (test_id, 'What does "porta" mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q1, 'gate / door', true),
    (q1, 'road',        false),
    (q1, 'water',       false),
    (q1, 'field',       false);
  SELECT id INTO c1 FROM public.choices WHERE question_id = q1 AND is_correct = true;

  -- Q2: via
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (test_id, 'What does "via" mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q2, 'gate / door', false),
    (q2, 'road / way',  true),
    (q2, 'water',       false),
    (q2, 'town',        false);
  SELECT id INTO c2 FROM public.choices WHERE question_id = q2 AND is_correct = true;

  -- Q3: aqua
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (test_id, 'What does "aqua" mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q3, 'fire',  false),
    (q3, 'earth', false),
    (q3, 'water', true),
    (q3, 'sky',   false);
  SELECT id INTO c3 FROM public.choices WHERE question_id = q3 AND is_correct = true;

  -- Q4: terra
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (test_id, 'What does "terra" mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q4, 'sky',          false),
    (q4, 'sea',          false),
    (q4, 'fire',         false),
    (q4, 'earth / land', true);
  SELECT id INTO c4 FROM public.choices WHERE question_id = q4 AND is_correct = true;
  SELECT id INTO w4  FROM public.choices WHERE question_id = q4 AND is_correct = false LIMIT 1;

  -- Q5: patria
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (test_id, 'What does "patria" mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (q5, 'father',               false),
    (q5, 'fatherland / country', true),
    (q5, 'brother',              false),
    (q5, 'family',               false);
  SELECT id INTO c5 FROM public.choices WHERE question_id = q5 AND is_correct = true;
  SELECT id INTO w5  FROM public.choices WHERE question_id = q5 AND is_correct = false LIMIT 1;

  -- ----------------------------------------
  -- 4. Assign test to all 3 students
  -- ----------------------------------------
  INSERT INTO public.assignments (test_id, student_id, school_id)
  VALUES (test_id, s1_id, school_id) RETURNING id INTO a1;

  INSERT INTO public.assignments (test_id, student_id, school_id)
  VALUES (test_id, s2_id, school_id) RETURNING id INTO a2;

  INSERT INTO public.assignments (test_id, student_id, school_id)
  VALUES (test_id, s3_id, school_id) RETURNING id INTO a3;

  -- ----------------------------------------
  -- 5. Submissions
  -- Alice: 5/5 (all correct)
  -- Bob:   3/5 (wrong on Q4 and Q5)
  -- Carol: not submitted yet
  -- ----------------------------------------
  INSERT INTO public.submissions (assignment_id, question_id, choice_id) VALUES
    (a1, q1, c1),
    (a1, q2, c2),
    (a1, q3, c3),
    (a1, q4, c4),
    (a1, q5, c5);

  INSERT INTO public.submissions (assignment_id, question_id, choice_id) VALUES
    (a2, q1, c1),
    (a2, q2, c2),
    (a2, q3, c3),
    (a2, q4, w4),  -- Bob gets this wrong
    (a2, q5, w5);  -- Bob gets this wrong

  RAISE NOTICE 'Seed complete! school_id=%, test_id=%', school_id, test_id;

END $$;
