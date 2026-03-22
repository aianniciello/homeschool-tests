-- ==============================================================
-- CATALOGUE SEED: Henle Latin 2 - Lessons 2 through 12
-- Run AFTER catalogue-seed.sql (which handles the ALTER TABLE).
-- Paste into Supabase > SQL Editor and run.
-- Run this ONCE.
-- ==============================================================

DO $seed$
DECLARE
  vocab_test_id    uuid;
  grammar_test_id  uuid;
  series_id        uuid := 'c0000000-0000-0000-0000-000000000001';
  q1  uuid; q2  uuid; q3  uuid; q4  uuid; q5  uuid;
  q6  uuid; q7  uuid; q8  uuid; q9  uuid; q10 uuid;
  q11 uuid; q12 uuid;

BEGIN

-- ============================================================
-- LESSON 2: 3rd Declension Nouns
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 2 Vocabulary', '3rd declension noun vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does miles mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'soldier',true),(q1,'king',false),(q1,'law',false),(q1,'head',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does rex mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'king',true),(q2,'soldier',false),(q2,'father',false),(q2,'mother',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does lex mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'law',true),(q3,'king',false),(q3,'name',false),(q3,'body',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does caput mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'head',true),(q4,'law',false),(q4,'name',false),(q4,'time',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does nomen mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'name',true),(q5,'head',false),(q5,'body',false),(q5,'courage',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does pater mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'father',true),(q6,'mother',false),(q6,'soldier',false),(q6,'king',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does mater mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'mother',true),(q7,'father',false),(q7,'name',false),(q7,'body',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does iter mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'march / journey',true),(q8,'head',false),(q8,'time',false),(q8,'courage',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does homo mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'man / human being',true),(q9,'body',false),(q9,'time',false),(q9,'soldier',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does corpus mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'body',true),(q10,'head',false),(q10,'name',false),(q10,'courage',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does tempus mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'time',true),(q11,'body',false),(q11,'march',false),(q11,'name',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does virtus mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'courage / virtue',true),(q12,'time',false),(q12,'body',false),(q12,'head',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 2 Grammar', '3rd declension noun endings and patterns', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the genitive singular ending for most 3rd declension nouns?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'-is',true),(q1,'-ae',false),(q1,'-i',false),(q1,'-us',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the accusative singular ending for most 3rd declension nouns?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'-em',true),(q2,'-am',false),(q2,'-um',false),(q2,'-im',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, '3rd declension neuter nominative and accusative forms are always what?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Identical',true),(q3,'Different',false),(q3,'Add -em',false),(q3,'Add -a',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the 3rd declension nominative plural ending?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'-es',true),(q4,'-ae',false),(q4,'-i',false),(q4,'-a',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Which declension does iter, itineris belong to?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'3rd declension',true),(q5,'1st declension',false),(q5,'2nd declension',false),(q5,'4th declension',false);


-- ============================================================
-- LESSON 3: Verb Conjugations (All Four)
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 3 Vocabulary', 'Review of all four conjugations', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does paro mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'to prepare',true),(q1,'to warn',false),(q1,'to lead',false),(q1,'to hear',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does moneo mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'to warn / advise',true),(q2,'to prepare',false),(q2,'to take',false),(q2,'to be',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does duco mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'to lead',true),(q3,'to prepare',false),(q3,'to hear',false),(q3,'to go',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does capio mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'to take / capture',true),(q4,'to warn',false),(q4,'to lead',false),(q4,'to say',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does audio mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'to hear',true),(q5,'to lead',false),(q5,'to go',false),(q5,'to hold',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does sum mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to be',true),(q6,'to be able',false),(q6,'to go',false),(q6,'to make',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does possum mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to be able / can',true),(q7,'to be',false),(q7,'to go',false),(q7,'to say',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does eo mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to go',true),(q8,'to be',false),(q8,'to make',false),(q8,'to call',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does facio mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to make / do',true),(q9,'to go',false),(q9,'to say',false),(q9,'to hold',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does dico mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to say / tell',true),(q10,'to make',false),(q10,'to call',false),(q10,'to hold',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does voco mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'to call',true),(q11,'to say',false),(q11,'to make',false),(q11,'to hold',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does teneo mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'to hold',true),(q12,'to call',false),(q12,'to say',false),(q12,'to make',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 3 Grammar', 'Verb conjugation patterns and principal parts', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the 1st person singular present active of amo?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'amo',true),(q1,'amat',false),(q1,'amamus',false),(q1,'amatis',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Which conjugation has infinitives ending in -ere (short e)?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'3rd conjugation',true),(q2,'1st conjugation',false),(q2,'2nd conjugation',false),(q2,'4th conjugation',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the present active infinitive of duco?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'ducere',true),(q3,'ducire',false),(q3,'ducare',false),(q3,'ducesse',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Possum is a compound of what two elements?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'pot- + sum',true),(q4,'post + esse',false),(q4,'pos + sum',false),(q4,'pot + esse',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What are the principal parts of a Latin verb?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'Present, infinitive, perfect, perfect passive participle',true),(q5,'Present, imperfect, future, perfect',false),(q5,'Nominative, genitive, dative, accusative',false),(q5,'Present, subjunctive, imperative, infinitive',false);


-- ============================================================
-- LESSON 4: Indirect Statement (Accusative + Infinitive)
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 4 Vocabulary', 'Verbs of saying, thinking, and perceiving', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does puto mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'to think',true),(q1,'to say',false),(q1,'to believe',false),(q1,'to hope',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does credo mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'to believe',true),(q2,'to think',false),(q2,'to know',false),(q2,'to deny',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does scio mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'to know',true),(q3,'to believe',false),(q3,'to see',false),(q3,'to understand',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does video mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'to see',true),(q4,'to know',false),(q4,'to announce',false),(q4,'to feel',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does nuntio mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'to announce / report',true),(q5,'to see',false),(q5,'to hope',false),(q5,'to deny',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does verus mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'true',true),(q6,'rumor',false),(q6,'to hope',false),(q6,'to feel',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does fama mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'rumor / report',true),(q7,'true',false),(q7,'to hope',false),(q7,'to understand',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does spero mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to hope',true),(q8,'to feel',false),(q8,'to understand',false),(q8,'to deny',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does sentio mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to feel / perceive',true),(q9,'to hope',false),(q9,'to understand',false),(q9,'to deny',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does intellego mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to understand',true),(q10,'to feel',false),(q10,'to deny',false),(q10,'to know',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does nego mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'to deny',true),(q11,'to understand',false),(q11,'to hope',false),(q11,'to say',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does dico mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'to say / tell',true),(q12,'to think',false),(q12,'to believe',false),(q12,'to announce',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 4 Grammar', 'Indirect statement: accusative + infinitive', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'In indirect statement, the subject of the infinitive is in what case?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Accusative',true),(q1,'Nominative',false),(q1,'Dative',false),(q1,'Ablative',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What tense infinitive shows action happening at the SAME time as the main verb?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Present infinitive',true),(q2,'Perfect infinitive',false),(q2,'Future infinitive',false),(q2,'Imperfect infinitive',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'In Caesar dicit milites vincere, what function does milites serve?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Subject of the infinitive (accusative)',true),(q3,'Direct object of Caesar',false),(q3,'Indirect object',false),(q3,'Predicate nominative',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What construction follows verbs of saying, thinking, knowing, and perceiving?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Indirect statement (accusative + infinitive)',true),(q4,'Indirect question (subjunctive)',false),(q4,'Indirect command (ut + subjunctive)',false),(q4,'Purpose clause',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'How do you express that the soldiers conquered (past) in indirect statement after Caesar says?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'Caesar dicit milites vicisse.',true),(q5,'Caesar dicit milites vincere.',false),(q5,'Caesar dicit milites vincturos esse.',false),(q5,'Caesar dicit milites victos.',false);


-- ============================================================
-- LESSON 5: Purpose Clauses
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 5 Vocabulary', 'Subjunctive mood and purpose clause vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does finis mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'end / boundary',true),(q1,'cause',false),(q1,'peace',false),(q1,'envoy',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does causa mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'cause / reason',true),(q2,'end',false),(q2,'peace',false),(q2,'battle',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does pax mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'peace',true),(q3,'war',false),(q3,'end',false),(q3,'cause',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does bellum mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'war',true),(q4,'peace',false),(q4,'end',false),(q4,'envoy',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does vinco mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'to conquer',true),(q5,'to send',false),(q5,'to flee',false),(q5,'to seek',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does mitto mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to send',true),(q6,'to conquer',false),(q6,'to flee',false),(q6,'to seek',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does fugio mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to flee',true),(q7,'to conquer',false),(q7,'to send',false),(q7,'to read',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does peto mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to seek / attack',true),(q8,'to flee',false),(q8,'to choose',false),(q8,'to send',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does lego mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to choose / read',true),(q9,'to seek',false),(q9,'to flee',false),(q9,'to conquer',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does legatus mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'envoy / lieutenant',true),(q10,'end',false),(q10,'cause',false),(q10,'peace',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ut (+ subjunctive) mean in a purpose clause?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'so that / in order that',true),(q11,'so that not',false),(q11,'although',false),(q11,'when',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ne (+ subjunctive) mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'so that not / lest',true),(q12,'so that',false),(q12,'unless',false),(q12,'when',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 5 Grammar', 'Purpose clauses with ut and ne', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'A purpose clause uses what mood?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Subjunctive',true),(q1,'Indicative',false),(q1,'Infinitive',false),(q1,'Imperative',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Ut + subjunctive introduces what type of clause?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Purpose clause',true),(q2,'Result clause',false),(q2,'Indirect question',false),(q2,'Conditional clause',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What conjunction introduces a NEGATIVE purpose clause?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'ne',true),(q3,'non ut',false),(q3,'nisi',false),(q3,'sine',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'With a primary (present/future) main verb, which subjunctive tense appears in a purpose clause?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Present subjunctive',true),(q4,'Imperfect subjunctive',false),(q4,'Perfect subjunctive',false),(q4,'Pluperfect subjunctive',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate: Caesar milites misit ut hostes vincerent.', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'Caesar sent soldiers in order that they might conquer the enemy.',true),(q5,'Caesar sends soldiers who conquer the enemy.',false),(q5,'Caesar sent soldiers although the enemy conquered.',false),(q5,'Caesar sent soldiers because the enemy conquered.',false);


-- ============================================================
-- LESSON 6: Result Clauses
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 6 Vocabulary', 'Result clause correlative words and vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ita mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'so / in such a way',true),(q1,'so great',false),(q1,'such',false),(q1,'so many',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does tam mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'so (with adjectives/adverbs)',true),(q2,'to such a degree',false),(q2,'so great',false),(q2,'so many',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does tantus mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'so great',true),(q3,'so',false),(q3,'such',false),(q3,'so many',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does talis mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'such / of such a kind',true),(q4,'so great',false),(q4,'so many',false),(q4,'to such a degree',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does tot mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'so many',true),(q5,'such',false),(q5,'so great',false),(q5,'so',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does adeo mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to such a degree',true),(q6,'so',false),(q6,'so great',false),(q6,'so many',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does efficio mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to bring about / accomplish',true),(q7,'it happens',false),(q7,'thing',false),(q7,'battle',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does accidit mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'it happens',true),(q8,'to bring about',false),(q8,'supplies',false),(q8,'hindrance',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does res mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'thing / matter / affair',true),(q9,'battle',false),(q9,'supplies',false),(q9,'hindrance',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does proelium mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'battle',true),(q10,'thing',false),(q10,'supplies',false),(q10,'hindrance',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does copia mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'supply / troops',true),(q11,'battle',false),(q11,'thing',false),(q11,'hindrance',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does impedimentum mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'hindrance / baggage',true),(q12,'supplies',false),(q12,'battle',false),(q12,'thing',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 6 Grammar', 'Result clauses: structure and sequence', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What word in the main clause signals a result clause is coming?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'A correlative word (ita, tam, tantus, talis, tot, adeo)',true),(q1,'The word ut alone',false),(q1,'A negative ne',false),(q1,'A relative pronoun',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'How does a result clause differ from a purpose clause in negation?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Result uses ut non; purpose uses ne',true),(q2,'Result uses ne; purpose uses ut non',false),(q2,'Result uses the indicative; purpose uses the subjunctive',false),(q2,'There is no difference',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Identify the clause type: Tam fortis erat ut omnes eum laudarent.', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Result clause',true),(q3,'Purpose clause',false),(q3,'Indirect question',false),(q3,'Causal clause',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'In result clauses, what tense sequence applies?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Same sequence of tenses as purpose clauses',true),(q4,'Always present subjunctive',false),(q4,'Always imperfect subjunctive',false),(q4,'Always perfect subjunctive',false);


-- ============================================================
-- LESSON 7: Cum Clauses
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 7 Vocabulary', 'Cum clauses and temporal conjunctions', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does cum (+ subjunctive) mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'when / since / although',true),(q1,'although (with indicative)',false),(q1,'nevertheless',false),(q1,'after',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does cum (+ indicative) mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'when (at the time that)',true),(q2,'when/since/although',false),(q2,'after',false),(q2,'as soon as',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quamquam mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'although',true),(q3,'nevertheless',false),(q3,'after',false),(q3,'when',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does tamen mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'nevertheless / yet',true),(q4,'although',false),(q4,'after',false),(q4,'as soon as',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does postquam mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'after',true),(q5,'when',false),(q5,'nevertheless',false),(q5,'as soon as',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ubi mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'when / where',true),(q6,'after',false),(q6,'nevertheless',false),(q6,'although',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does simul atque mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'as soon as',true),(q7,'after',false),(q7,'when',false),(q7,'although',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does proficiscor mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to set out / depart',true),(q8,'to decide',false),(q8,'to learn',false),(q8,'to arrive',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does constituo mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to decide / establish',true),(q9,'to set out',false),(q9,'to learn',false),(q9,'to hinder',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does cognosco mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to learn / recognize',true),(q10,'to decide',false),(q10,'to arrive',false),(q10,'to hinder',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does pervenio mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'to arrive',true),(q11,'to learn',false),(q11,'to set out',false),(q11,'to decide',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does impedio mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'to hinder / prevent',true),(q12,'to arrive',false),(q12,'to learn',false),(q12,'to set out',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 7 Grammar', 'Cum clauses: temporal, causal, and concessive', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Cum + subjunctive can express which three clause types?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Temporal (when), causal (since), concessive (although)',true),(q1,'Purpose, result, indirect statement',false),(q1,'Conditional, relative, indirect question',false),(q1,'Only temporal and causal',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'How do you identify a concessive cum clause?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'By tamen (nevertheless) in the main clause',true),(q2,'By a negative verb in the cum clause',false),(q2,'By a future main verb',false),(q2,'By quamquam instead of cum',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Cum + INDICATIVE usually expresses what?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'A specific point in time (at the time when)',true),(q3,'A causal relationship',false),(q3,'A concessive relationship',false),(q3,'A purpose',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Postquam and ubi take what mood?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Indicative',true),(q4,'Subjunctive',false),(q4,'Infinitive',false),(q4,'Either, depending on context',false);


-- ============================================================
-- LESSON 8: Indirect Questions
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 8 Vocabulary', 'Interrogative words and verbs of asking', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quaero mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'to ask / inquire / seek',true),(q1,'to ask (rogo)',false),(q1,'to not know',false),(q1,'to be ignorant',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does rogo mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'to ask',true),(q2,'to inquire',false),(q2,'to not know',false),(q2,'to doubt',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does nescio mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'to not know',true),(q3,'to ask',false),(q3,'to be ignorant',false),(q3,'to doubt',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ignoro mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'to be ignorant of',true),(q4,'to not know',false),(q4,'to doubt',false),(q4,'to ask',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does dubito mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'to doubt / hesitate',true),(q5,'to not know',false),(q5,'to be ignorant',false),(q5,'to ask',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quis / quid mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'who / what',true),(q6,'what kind',false),(q6,'how great',false),(q6,'how',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does qualis mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'what kind of',true),(q7,'who / what',false),(q7,'how great',false),(q7,'how many',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quantus mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'how great',true),(q8,'what kind',false),(q8,'how',false),(q8,'when',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quomodo mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'how / in what way',true),(q9,'how great',false),(q9,'when',false),(q9,'why',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quando mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'when',true),(q10,'how',false),(q10,'why',false),(q10,'where to',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does quo mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'where to / to what place',true),(q11,'when',false),(q11,'how',false),(q11,'why',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does cur mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'why',true),(q12,'where to',false),(q12,'when',false),(q12,'how',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 8 Grammar', 'Indirect questions with subjunctive', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Indirect questions use what mood?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Subjunctive',true),(q1,'Indicative',false),(q1,'Infinitive',false),(q1,'Imperative',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What introduces an indirect question in Latin?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'An interrogative word (quis, quid, cur, quomodo, etc.)',true),(q2,'The word ut',false),(q2,'The accusative + infinitive',false),(q2,'The word ne',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate: Caesar rogavit quis esset.', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Caesar asked who he was.',true),(q3,'Caesar asked who is he.',false),(q3,'Caesar, who was asking, was there.',false),(q3,'Caesar asked that he should be who he was.',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Which verbs commonly introduce indirect questions?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Verbs of asking, knowing, and doubting',true),(q4,'Verbs of saying and thinking (ACI verbs)',false),(q4,'Verbs of motion',false),(q4,'Impersonal verbs only',false);


-- ============================================================
-- LESSON 9: Participles
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 9 Vocabulary', 'Participles and ablative absolute vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does portans / portantis mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'carrying (present active participle)',true),(q1,'having been carried',false),(q1,'about to carry',false),(q1,'leading',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does portatus / -a / -um mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'having been carried (perfect passive participle)',true),(q2,'carrying',false),(q2,'about to carry',false),(q2,'having been led',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does portaturus / -a / -um mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'about to carry (future active participle)',true),(q3,'carrying',false),(q3,'having been carried',false),(q3,'leading',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ducens / ducentis mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'leading (present active participle)',true),(q4,'carrying',false),(q4,'having been led',false),(q4,'about to carry',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does ductus / -a / -um mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'having been led (perfect passive participle)',true),(q5,'leading',false),(q5,'about to carry',false),(q5,'to kill',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does occido mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to kill',true),(q6,'to leave behind',false),(q6,'to wound',false),(q6,'to besiege',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does relinquo mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to leave behind / abandon',true),(q7,'to kill',false),(q7,'to choose',false),(q7,'to wound',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does interficio mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to kill',true),(q8,'to leave behind',false),(q8,'to choose',false),(q8,'to wound',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does deligo mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to choose / select',true),(q9,'to kill',false),(q9,'to wound',false),(q9,'to besiege',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does vulnero mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to wound',true),(q10,'to choose',false),(q10,'to kill',false),(q10,'to besiege',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does obsideo mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'to besiege',true),(q11,'to wound',false),(q11,'to choose',false),(q11,'to leave behind',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What is the ablative absolute construction?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'A noun + participle in the ablative expressing time, cause, or circumstance',true),(q12,'A gerund in the ablative expressing means',false),(q12,'An ablative of agent with a passive verb',false),(q12,'A noun in the ablative as indirect object',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 9 Grammar', 'Latin participles and the ablative absolute', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Latin has how many participles, and what are they?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Four: present active, perfect passive, future active, future passive (gerundive)',true),(q1,'Two: present and past',false),(q1,'Three: present active, perfect passive, future active',false),(q1,'Six: one for each tense',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What does a perfect passive participle express?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'An action completed BEFORE the main verb (passive meaning)',true),(q2,'An action happening at the same time (active meaning)',false),(q2,'An action that will happen after the main verb',false),(q2,'Purpose or intention',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the ablative absolute construction?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'A noun (or pronoun) + participle in the ablative, expressing time, cause, or circumstance',true),(q3,'A gerund in the ablative expressing means',false),(q3,'An ablative of agent with a passive verb',false),(q3,'A noun in the ablative used as an indirect object',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate the ablative absolute: His rebus cognitis, Caesar profectus est.', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'When these things had been learned, Caesar set out.',true),(q4,'Caesar, having learned these things, set out.',false),(q4,'These things having been known, Caesar set out.',false),(q4,'Caesar learned these things and set out.',false);


-- ============================================================
-- LESSON 10: Gerunds and Gerundives
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 10 Vocabulary', 'Gerunds, gerundives, and obligation vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What is a gerund (-ndum)?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'A verbal noun expressing the act of doing something',true),(q1,'A verbal adjective meaning needing to be done',false),(q1,'A purpose expression with a gerundive',false),(q1,'An ablative absolute',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What is a gerundive (-ndus/-a/-um)?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'A verbal adjective meaning needing to be done',true),(q2,'A verbal noun expressing the act of doing something',false),(q2,'A form of the infinitive',false),(q2,'A participle in the ablative',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does debeo mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'to owe / ought / must',true),(q3,'it is necessary',false),(q3,'it is proper',false),(q3,'to free',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does necesse (est) mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'it is necessary',true),(q4,'to owe',false),(q4,'it is proper',false),(q4,'to free',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does oportet mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'it is proper / one ought',true),(q5,'it is necessary',false),(q5,'to owe',false),(q5,'to storm',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does libero mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to free / liberate',true),(q6,'to storm',false),(q6,'to attack',false),(q6,'to cross',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does expugno mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to storm / take by assault',true),(q7,'to free',false),(q7,'to attack',false),(q7,'to cross',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does oppugno mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to attack',true),(q8,'to storm',false),(q8,'to free',false),(q8,'to cross',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does deduco mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to lead down / bring',true),(q9,'to attack',false),(q9,'to storm',false),(q9,'to cross',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does transeo mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to cross / go across',true),(q10,'to lead down',false),(q10,'to attack',false),(q10,'to free',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does causa (+ genitive) express?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'for the sake of (purpose)',true),(q11,'because of (cause)',false),(q11,'by means of',false),(q11,'in place of',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does gratia (+ genitive) express?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'for the sake of / to gain',true),(q12,'for the sake of (causa)',false),(q12,'by means of',false),(q12,'in place of',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 10 Grammar', 'Gerunds, gerundives, and necessity expressions', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What is the difference between a gerund and a gerundive?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Gerund is a verbal noun (active); gerundive is a verbal adjective (passive)',true),(q1,'They are the same thing used in different cases',false),(q1,'Gerund is passive; gerundive is active',false),(q1,'The gerund takes an object; the gerundive does not',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What does the gerundive express when used with a form of esse?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Necessity or obligation (must be done)',true),(q2,'Possibility (can be done)',false),(q2,'Permission (may be done)',false),(q2,'Purpose (in order to be done)',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'In Caesar Galliam vincendae causae profectus est, what does the gerundive phrase express?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Purpose: for the sake of conquering Gaul',true),(q3,'Obligation: Gaul must be conquered',false),(q3,'Means: by conquering Gaul',false),(q3,'Time: when Gaul was conquered',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate: Nobis eundum est.', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'We must go.',true),(q4,'We are going.',false),(q4,'We went.',false),(q4,'We ought to have gone.',false);


-- ============================================================
-- LESSON 11: Conditions
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 11 Vocabulary', 'Conditional conjunctions and related vocabulary', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does si mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'if',true),(q1,'if not',false),(q1,'but if',false),(q1,'if only',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does nisi mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'if not / unless',true),(q2,'if',false),(q2,'but if',false),(q2,'provided that',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does sin mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'but if',true),(q3,'if',false),(q3,'if not',false),(q3,'if only',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does modo (+ subjunctive) mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'if only / provided that',true),(q4,'but if',false),(q4,'if not',false),(q4,'even if',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does dum (+ subjunctive) mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'provided that',true),(q5,'if only',false),(q5,'but if',false),(q5,'if not',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does certe mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'certainly / at least',true),(q6,'perhaps',false),(q6,'doubtful',false),(q6,'sure',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does forte mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'perhaps / by chance',true),(q7,'certainly',false),(q7,'doubtful',false),(q7,'certain',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does timeo mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to fear',true),(q8,'to be afraid (vereor)',false),(q8,'doubtful',false),(q8,'certain',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does vereor mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to fear / be afraid',true),(q9,'to fear (timeo)',false),(q9,'doubtful',false),(q9,'certain',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does dubius mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'doubtful / uncertain',true),(q10,'certain',false),(q10,'perhaps',false),(q10,'to fear',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does certus mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'certain / sure',true),(q11,'doubtful',false),(q11,'to fear',false),(q11,'certainly',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does si...tamen express?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'even if...yet',true),(q12,'if not...unless',false),(q12,'provided that...yet',false),(q12,'certainly...if',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 11 Grammar', 'All three types of Latin conditions', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What are the three main types of conditions in Latin?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Simple (indicative), future more vivid (future indicative), contrary to fact (subjunctive)',true),(q1,'Present, past, and future conditions',false),(q1,'Real, unreal, and possible conditions',false),(q1,'Si, nisi, and dum conditions',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'A present contrary-to-fact condition uses what tenses?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Imperfect subjunctive in both clauses',true),(q2,'Present subjunctive in both clauses',false),(q2,'Pluperfect subjunctive in both clauses',false),(q2,'Perfect subjunctive in the if-clause, imperfect in the result',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'A past contrary-to-fact condition uses what tenses?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'Pluperfect subjunctive in both clauses',true),(q3,'Perfect subjunctive in both clauses',false),(q3,'Imperfect subjunctive in both clauses',false),(q3,'Pluperfect in if-clause, perfect in result',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate: Si hoc fecisses, vicissemus.', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'If you had done this, we would have conquered.',true),(q4,'If you do this, we will conquer.',false),(q4,'If you were doing this, we would be conquering.',false),(q4,'If you should do this, we would conquer.',false);


-- ============================================================
-- LESSON 12: Deponent and Semi-Deponent Verbs
-- ============================================================

  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 12 Vocabulary', 'Deponent verbs and their special cases', true, series_id)
  RETURNING id INTO vocab_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does loquor mean?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'to speak / talk',true),(q1,'to follow',false),(q1,'to set out',false),(q1,'to die',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does sequor mean?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'to follow',true),(q2,'to speak',false),(q2,'to suffer',false),(q2,'to urge',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does proficiscor mean?', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'to set out / depart',true),(q3,'to follow',false),(q3,'to die',false),(q3,'to fear',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does morior mean?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'to die',true),(q4,'to set out',false),(q4,'to suffer',false),(q4,'to try',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does patior mean?', 5) RETURNING id INTO q5;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q5,'to suffer / endure',true),(q5,'to die',false),(q5,'to urge',false),(q5,'to fear',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does hortor mean?', 6) RETURNING id INTO q6;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q6,'to urge / encourage',true),(q6,'to suffer',false),(q6,'to fear',false),(q6,'to try',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does vereor mean?', 7) RETURNING id INTO q7;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q7,'to fear / respect',true),(q7,'to urge',false),(q7,'to try',false),(q7,'to use',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does conor mean?', 8) RETURNING id INTO q8;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q8,'to try / attempt',true),(q8,'to fear',false),(q8,'to use',false),(q8,'to enjoy',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does utor mean?', 9) RETURNING id INTO q9;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q9,'to use (+ ablative)',true),(q9,'to try',false),(q9,'to enjoy',false),(q9,'to get possession of',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does fruor mean?', 10) RETURNING id INTO q10;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q10,'to enjoy (+ ablative)',true),(q10,'to use',false),(q10,'to get possession of',false),(q10,'to perform',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does potior mean?', 11) RETURNING id INTO q11;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q11,'to get possession of (+ ablative)',true),(q11,'to enjoy',false),(q11,'to use',false),(q11,'to perform',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (vocab_test_id, 'What does fungor mean?', 12) RETURNING id INTO q12;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q12,'to perform / discharge (+ ablative)',true),(q12,'to get possession of',false),(q12,'to enjoy',false),(q12,'to use',false);

  -- Grammar
  INSERT INTO public.tests (school_id, title, description, is_catalogue, series_id)
  VALUES (null, 'Henle Latin 2 - Lesson 12 Grammar', 'Deponent and semi-deponent verbs', true, series_id)
  RETURNING id INTO grammar_test_id;

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What are deponent verbs?', 1) RETURNING id INTO q1;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q1,'Verbs passive in form but active in meaning',true),(q1,'Verbs that have no passive forms',false),(q1,'Verbs that are always reflexive',false),(q1,'Verbs borrowed from Greek',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'What case does utor (to use) take?', 2) RETURNING id INTO q2;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q2,'Ablative',true),(q2,'Accusative',false),(q2,'Dative',false),(q2,'Genitive',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Translate: Milites arma sua usi sunt.', 3) RETURNING id INTO q3;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q3,'The soldiers used their weapons.',true),(q3,'The soldiers were used by their weapons.',false),(q3,'The soldiers weapons were used.',false),(q3,'The soldiers and their weapons were there.',false);

  INSERT INTO public.questions (test_id, question_text, position) VALUES (grammar_test_id, 'Semi-deponent verbs are passive in form in which tenses only?', 4) RETURNING id INTO q4;
  INSERT INTO public.choices (question_id, choice_text, is_correct) VALUES (q4,'Perfect system only (perfect, pluperfect, future perfect)',true),(q4,'Present system only',false),(q4,'All tenses',false),(q4,'Only the present tense',false);


  RAISE NOTICE 'Catalogue seed (Lessons 2-12) complete!';

END $seed$;
