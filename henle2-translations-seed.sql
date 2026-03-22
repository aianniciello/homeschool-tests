-- ==============================================================
-- CATALOGUE SEED: Henle Latin 2 — Translation Sentences (Lessons 1–12)
-- Paste into Supabase > SQL Editor and run.
--
-- What this creates:
--   12 catalogue tests (one per lesson), each with 4 translation
--   questions and 4 answer choices (1 correct, 3 distractors).
--
-- NOT safe to re-run. Run this ONCE.
-- ==============================================================

DO $seed$
DECLARE
  v_series_id uuid;
  v_test_id   uuid;
  v_q_id      uuid;

BEGIN

  -- Resolve series
  SELECT id INTO v_series_id
  FROM public.catalogue_series
  WHERE title ILIKE '%Henle%' AND title ILIKE '%2%'
  LIMIT 1;

  IF v_series_id IS NULL THEN
    RAISE EXCEPTION 'Henle 2 series not found in public.catalogue_series — seed aborted.';
  END IF;

  -- ============================================================
  -- LESSON 1
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 1 — Translation Sentences', 'Translate Caesar/exercise sentences: 1st & 2nd Declension Nouns & Adjectives.', true, v_series_id, 1, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Silvae magnae erant."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The forests were large.',                          true),
    (v_q_id, 'The soldiers were in the forest.',                 false),
    (v_q_id, 'The son saw the gate.',                            false),
    (v_q_id, 'The road was long and difficult.',                 false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Filius portam vidit."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The son saw the gate.',                            true),
    (v_q_id, 'The forests were large.',                          false),
    (v_q_id, 'The father warned his son.',                       false),
    (v_q_id, 'The king gave the law.',                           false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Milites in silva erant."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The soldiers were in the forest.',                 true),
    (v_q_id, 'The forests were large.',                          false),
    (v_q_id, 'The enemy attempted to capture the camp.',         false),
    (v_q_id, 'The wounded soldiers were carried into the camp.', false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Via longa et difficilis erat."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The road was long and difficult.',                 true),
    (v_q_id, 'The son saw the gate.',                            false),
    (v_q_id, 'The soldier made a long march.',                   false),
    (v_q_id, 'If there is peace, the soldiers will return home.', false);

  -- ============================================================
  -- LESSON 2
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 2 — Translation Sentences', 'Translate Caesar/exercise sentences: 3rd Declension Nouns.', true, v_series_id, 2, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Miles iter longum fecit."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The soldier made a long march.',                   true),
    (v_q_id, 'The road was long and difficult.',                 false),
    (v_q_id, 'The leader leads the soldiers.',                   false),
    (v_q_id, 'The soldiers were in the forest.',                 false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Rex legem dedit."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The king gave the law.',                           true),
    (v_q_id, 'The father warned his son.',                       false),
    (v_q_id, 'Caesar says that the Gauls are brave.',            false),
    (v_q_id, 'The son saw the gate.',                            false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Nomen patris erat Marcus."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The name of the father was Marcus.',               true),
    (v_q_id, 'The courage of the soldiers was great.',           false),
    (v_q_id, 'The king gave the law.',                           false),
    (v_q_id, 'The forests were large.',                          false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Virtus militum magna erat."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The courage of the soldiers was great.',           true),
    (v_q_id, 'The name of the father was Marcus.',               false),
    (v_q_id, 'The wounded soldiers were carried into the camp.', false),
    (v_q_id, 'He was so brave that the enemy fled.',             false);

  -- ============================================================
  -- LESSON 3
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 3 — Translation Sentences', 'Translate Caesar/exercise sentences: Verb Conjugations (All Four).', true, v_series_id, 3, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Dux milites ducit."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The leader leads the soldiers.',                   true),
    (v_q_id, 'The soldier made a long march.',                   false),
    (v_q_id, 'The soldiers follow the enemy.',                   false),
    (v_q_id, 'The enemy attempted to capture the camp.',         false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Romani bellum parare possunt."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The Romans are able to prepare for war.',          true),
    (v_q_id, 'The leader leads the soldiers.',                   false),
    (v_q_id, 'Peace must be sought.',                            false),
    (v_q_id, 'We must cross the Rhine.',                         false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Pater filium monuit."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The father warned his son.',                       true),
    (v_q_id, 'The son saw the gate.',                            false),
    (v_q_id, 'The king gave the law.',                           false),
    (v_q_id, 'Caesar urged them to fight bravely.',              false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Hostes castra capere temptaverunt."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The enemy attempted to capture the camp.',                  true),
    (v_q_id, 'The enemy, having caught sight of our men, began to flee.', false),
    (v_q_id, 'The soldiers were in the forest.',                          false),
    (v_q_id, 'After the town had been captured, Caesar placed a garrison there.', false);

  -- ============================================================
  -- LESSON 4
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 4 — Translation Sentences', 'Translate Caesar/exercise sentences: Indirect Statement (Accusative + Infinitive).', true, v_series_id, 4, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar dicit Gallos fortes esse."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar says that the Gauls are brave.',            true),
    (v_q_id, 'Caesar asked what they were doing.',               false),
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.', false),
    (v_q_id, 'I know that you are speaking the truth.',          false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Milites credunt se vincere."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The soldiers believe that they are winning.',      true),
    (v_q_id, 'Caesar says that the Gauls are brave.',            false),
    (v_q_id, 'The soldiers follow the enemy.',                   false),
    (v_q_id, 'The soldiers were prepared for fighting.',         false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Scio te verum dicere."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'I know that you are speaking the truth.',          true),
    (v_q_id, 'The soldiers believe that they are winning.',      false),
    (v_q_id, 'I do not know why the enemy fled.',                false),
    (v_q_id, 'I doubt what plan I should adopt.',                false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Nuntiaverunt hostes castra reliquisse."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'They reported that the enemy had abandoned the camp.', true),
    (v_q_id, 'I know that you are speaking the truth.',              false),
    (v_q_id, 'The enemy attempted to capture the camp.',             false),
    (v_q_id, 'After the town had been captured, Caesar placed a garrison there.', false);

  -- ============================================================
  -- LESSON 5
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 5 — Translation Sentences', 'Translate Caesar/exercise sentences: Subjunctive Mood — Purpose Clauses.', true, v_series_id, 5, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar milites misit ut hostes vincerent."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.', true),
    (v_q_id, 'Caesar asked what they were doing.',               false),
    (v_q_id, 'He sends envoys in order to seek peace.',          false),
    (v_q_id, 'Caesar says that the Gauls are brave.',            false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Fugiunt ne capiantur."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'They flee so that they may not be captured.',                        true),
    (v_q_id, 'They set out at night so that they might not be seen by the enemy.', false),
    (v_q_id, 'The enemy, having caught sight of our men, began to flee.',          false),
    (v_q_id, 'The soldiers follow the enemy.',                                     false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Legatos mittit ut pacem petat."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'He sends envoys in order to seek peace.',                           true),
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.',  false),
    (v_q_id, 'They flee so that they may not be captured.',                       false),
    (v_q_id, 'Peace must be sought.',                                             false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Noctu profecti sunt ne ab hostibus viderentur."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'They set out at night so that they might not be seen by the enemy.', true),
    (v_q_id, 'They set out at first light.',                                        false),
    (v_q_id, 'They flee so that they may not be captured.',                         false),
    (v_q_id, 'When Caesar had learned these things, he set out.',                   false);

  -- ============================================================
  -- LESSON 6
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 6 — Translation Sentences', 'Translate Caesar/exercise sentences: Subjunctive — Result Clauses.', true, v_series_id, 6, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Tam fortis erat ut hostes fugerent."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'He was so brave that the enemy fled.',                             true),
    (v_q_id, 'The forces were so great that all places were filled.',            false),
    (v_q_id, 'The courage of the soldiers was great.',                           false),
    (v_q_id, 'It happened that no one resisted.',                                false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Tantae erant copiae ut omnia loca complerentur."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The forces were so great that all places were filled.',            true),
    (v_q_id, 'He was so brave that the enemy fled.',                             false),
    (v_q_id, 'Caesar joined battle in such a way that no one escaped.',          false),
    (v_q_id, 'The courage of the soldiers was great.',                           false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Accidit ut nemo resisteret."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'It happened that no one resisted.',                                true),
    (v_q_id, 'I doubt what plan I should adopt.',                                false),
    (v_q_id, 'Caesar joined battle in such a way that no one escaped.',          false),
    (v_q_id, 'He was so brave that the enemy fled.',                             false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar ita proelium commisit ut nemo effugeret."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar joined battle in such a way that no one escaped.',          true),
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.', false),
    (v_q_id, 'It happened that no one resisted.',                                false),
    (v_q_id, 'Caesar says that the Gauls are brave.',                            false);

  -- ============================================================
  -- LESSON 7
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 7 — Translation Sentences', 'Translate Caesar/exercise sentences: Cum Clauses (Temporal, Causal, Concessive).', true, v_series_id, 7, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Cum Caesar haec cognovisset, profectus est."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'When Caesar had learned these things, he set out.',                          true),
    (v_q_id, 'When he had decided this, he set out at the third watch.',                   false),
    (v_q_id, 'They set out at first light.',                                               false),
    (v_q_id, 'They set out at night so that they might not be seen by the enemy.',         false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Cum hostes approinquarent, tamen milites non fugerunt."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Although the enemy was approaching, nevertheless the soldiers did not flee.', true),
    (v_q_id, 'When Caesar had learned these things, he set out.',                           false),
    (v_q_id, 'He was so brave that the enemy fled.',                                        false),
    (v_q_id, 'The enemy, having caught sight of our men, began to flee.',                   false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Ubi ad flumen pervenit, castra posuit."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'When he arrived at the river, he pitched camp.',                   true),
    (v_q_id, 'When Caesar had learned these things, he set out.',                false),
    (v_q_id, 'He asked where the camp had been pitched.',                        false),
    (v_q_id, 'After the town had been captured, Caesar placed a garrison there.', false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Cum id constituisset, tertia vigilia profectus est."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'When he had decided this, he set out at the third watch.',         true),
    (v_q_id, 'When Caesar had learned these things, he set out.',                false),
    (v_q_id, 'They set out at first light.',                                     false),
    (v_q_id, 'When he arrived at the river, he pitched camp.',                   false);

  -- ============================================================
  -- LESSON 8
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 8 — Translation Sentences', 'Translate Caesar/exercise sentences: Indirect Questions.', true, v_series_id, 8, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar rogavit quid facerent."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar asked what they were doing.',               true),
    (v_q_id, 'Caesar says that the Gauls are brave.',            false),
    (v_q_id, 'He asked where the camp had been pitched.',        false),
    (v_q_id, 'I do not know why the enemy fled.',                false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Nescio cur hostes fugerint."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'I do not know why the enemy fled.',                true),
    (v_q_id, 'I doubt what plan I should adopt.',                false),
    (v_q_id, 'Caesar asked what they were doing.',               false),
    (v_q_id, 'I know that you are speaking the truth.',          false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Quaesivit ubi castra posita essent."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'He asked where the camp had been pitched.',        true),
    (v_q_id, 'Caesar asked what they were doing.',               false),
    (v_q_id, 'When he arrived at the river, he pitched camp.',   false),
    (v_q_id, 'I do not know why the enemy fled.',                false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Dubito quid consilii capiam."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'I doubt what plan I should adopt.',                true),
    (v_q_id, 'I do not know why the enemy fled.',                false),
    (v_q_id, 'I know that you are speaking the truth.',          false),
    (v_q_id, 'He asked where the camp had been pitched.',        false);

  -- ============================================================
  -- LESSON 9
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 9 — Translation Sentences', 'Translate Caesar/exercise sentences: Participles (All Forms).', true, v_series_id, 9, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Milites vulnerati in castra portati sunt."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The wounded soldiers were carried into the camp.', true),
    (v_q_id, 'The soldiers were in the forest.',                 false),
    (v_q_id, 'The soldiers were prepared for fighting.',         false),
    (v_q_id, 'The soldiers believe that they are winning.',      false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesare duce, Romani vicerunt."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'With Caesar as leader, the Romans conquered.',                     true),
    (v_q_id, 'The Romans are able to prepare for war.',                          false),
    (v_q_id, 'Caesar joined battle in such a way that no one escaped.',          false),
    (v_q_id, 'When Caesar had learned these things, he set out.',                false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Oppido capto, Caesar praesidium imposuit."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'After the town had been captured, Caesar placed a garrison there.', true),
    (v_q_id, 'When he arrived at the river, he pitched camp.',                    false),
    (v_q_id, 'Having gained possession of the camp, they acquired much booty.',   false),
    (v_q_id, 'The enemy attempted to capture the camp.',                          false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Hostes, nostros conspicati, fugere coeperunt."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The enemy, having caught sight of our men, began to flee.',                   true),
    (v_q_id, 'They flee so that they may not be captured.',                                 false),
    (v_q_id, 'Although the enemy was approaching, nevertheless the soldiers did not flee.', false),
    (v_q_id, 'The enemy attempted to capture the camp.',                                    false);

  -- ============================================================
  -- LESSON 10
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 10 — Translation Sentences', 'Translate Caesar/exercise sentences: Gerunds and Gerundives.', true, v_series_id, 10, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar Galliam expugnandae causae profectus est."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar set out for the sake of storming Gaul.',                    true),
    (v_q_id, 'When Caesar had learned these things, he set out.',                false),
    (v_q_id, 'With Caesar as leader, the Romans conquered.',                     false),
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.', false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Pax petenda est."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Peace must be sought.',                                            true),
    (v_q_id, 'We must cross the Rhine.',                                         false),
    (v_q_id, 'He sends envoys in order to seek peace.',                          false),
    (v_q_id, 'If there is peace, the soldiers will return home.',                false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Milites ad pugnandum parati erant."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The soldiers were prepared for fighting.',                         true),
    (v_q_id, 'The wounded soldiers were carried into the camp.',                 false),
    (v_q_id, 'The soldiers believe that they are winning.',                      false),
    (v_q_id, 'The soldiers follow the enemy.',                                   false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Nobis Rhenum transeundum est."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'We must cross the Rhine.',                                         true),
    (v_q_id, 'Peace must be sought.',                                            false),
    (v_q_id, 'If there is peace, the soldiers will return home.',                false),
    (v_q_id, 'Caesar set out for the sake of storming Gaul.',                    false);

  -- ============================================================
  -- LESSON 11
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 11 — Translation Sentences', 'Translate Caesar/exercise sentences: Conditions (All Types).', true, v_series_id, 11, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Si hoc fecisset, vicissemus."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'If he had done this, we would have conquered.',                    true),
    (v_q_id, 'If Caesar had not been present, all would have perished.',         false),
    (v_q_id, 'If you are doing this, you are making a mistake.',                 false),
    (v_q_id, 'If there is peace, the soldiers will return home.',                false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Nisi Caesar adfuisset, omnes perissent."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'If Caesar had not been present, all would have perished.',                    true),
    (v_q_id, 'If he had done this, we would have conquered.',                               false),
    (v_q_id, 'Although the enemy was approaching, nevertheless the soldiers did not flee.', false),
    (v_q_id, 'When Caesar had learned these things, he set out.',                           false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Si pax erit, milites domum redibunt."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'If there is peace, the soldiers will return home.',                true),
    (v_q_id, 'If you are doing this, you are making a mistake.',                 false),
    (v_q_id, 'Peace must be sought.',                                            false),
    (v_q_id, 'We must cross the Rhine.',                                         false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Si hoc facis, erras."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'If you are doing this, you are making a mistake.',                 true),
    (v_q_id, 'If he had done this, we would have conquered.',                    false),
    (v_q_id, 'If there is peace, the soldiers will return home.',                false),
    (v_q_id, 'I know that you are speaking the truth.',                          false);

  -- ============================================================
  -- LESSON 12
  -- ============================================================
  INSERT INTO public.tests (title, description, is_catalogue, series_id, sort_order, is_archived)
  VALUES ('Lesson 12 — Translation Sentences', 'Translate Caesar/exercise sentences: Deponent and Semi-Deponent Verbs.', true, v_series_id, 12, false)
  RETURNING id INTO v_test_id;

  -- Q1
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Milites hostes sequuntur."', 1)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'The soldiers follow the enemy.',                   true),
    (v_q_id, 'The soldiers were prepared for fighting.',         false),
    (v_q_id, 'The enemy attempted to capture the camp.',         false),
    (v_q_id, 'The leader leads the soldiers.',                   false);

  -- Q2
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Caesar eos hortatus est ut fortiter pugnarent."', 2)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Caesar urged them to fight bravely.',                              true),
    (v_q_id, 'Caesar sent soldiers in order that they might conquer the enemy.', false),
    (v_q_id, 'Caesar says that the Gauls are brave.',                            false),
    (v_q_id, 'The father warned his son.',                                       false);

  -- Q3
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Profecti sunt prima luce."', 3)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'They set out at first light.',                                               true),
    (v_q_id, 'They set out at night so that they might not be seen by the enemy.',         false),
    (v_q_id, 'When Caesar had learned these things, he set out.',                          false),
    (v_q_id, 'When he had decided this, he set out at the third watch.',                   false);

  -- Q4
  INSERT INTO public.questions (test_id, question_text, position)
  VALUES (v_test_id, 'Translate: "Castris potiti, multa praeda potiti sunt."', 4)
  RETURNING id INTO v_q_id;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES
    (v_q_id, 'Having gained possession of the camp, they acquired much booty.',   true),
    (v_q_id, 'After the town had been captured, Caesar placed a garrison there.', false),
    (v_q_id, 'The enemy attempted to capture the camp.',                          false),
    (v_q_id, 'With Caesar as leader, the Romans conquered.',                      false);

  RAISE NOTICE 'Henle 2 translation seed complete. 12 tests inserted for series_id=%', v_series_id;

END $seed$;
