# Backlog

## Dashboard Redesign

### Teacher Dashboard

- [x] **Activity Feed** — Live feed of recent student submissions ("Emma submitted Latin Vocab Test · 87% · 2 hours ago"). Query `submissions` with timestamps + join student names. No schema changes needed. *(high impact)*
- [ ] **Score Distribution Visualization** — Replace plain assignment count with a bar chart bucketed as 90–100, 70–89, 50–69, <50. Pure frontend.
- [ ] **"At Risk" Students Panel** — Students who scored below 60% on their last test or haven't submitted in 7+ days. Red-tinted chip cards with direct links to their results.
- [ ] **Upcoming Due Dates Timeline** — Horizontal strip showing assignment due dates in the next 14 days with test name + assigned student count.
- [ ] **Stat Cards with Context** — Add sparkline or secondary line to stat cards, e.g. "12 Students · 3 submitted this week".

### Student Dashboard

- [x] **Due Date Urgency System** — Replace plain "Due: March 25" with urgency chips (green "5 days left", yellow "2 days left", red "Tomorrow") + colored left-border accent on the card. *(pure UI, high impact)*
- [ ] **Score History Sparkline** — Tiny SVG sparkline next to each completed test showing score trend. Pure JS/SVG.
- [ ] **Streak + Gamification Bar** — "You've completed 3 tests this week!" with a streak counter. localStorage or new `student_activity` table.
- [ ] **Personal Bests + Milestones** — "Best score: 94% on Roman History · First perfect score badge". Badges stored as JSON in a `student_achievements` table.
- [ ] **Subject Progress Rings** — Mini progress ring per subject showing % of assigned tests completed.

### Both Dashboards

- [x] **Hero Greeting Block** — Replace plain `<h2>Welcome, Name</h2>` with a full-width hero row: large greeting, today's date, school name, contextual one-liner. *(pure UI, high impact)*
- [x] **Dark Mode Toggle** — CSS `[data-theme="dark"]` block + toggle button.

## Bugs

- [x] **Reset assignment doesn't work** — "Reset" on teacher results page should delete the student's submissions so they can retake the test. Each attempt should be recorded separately and all attempt scores should be visible to the teacher (attempt history, not just latest).

## Features

- [ ] **Passkey authentication for teachers** — Add passkey (WebAuthn) enrollment on the teacher profile page and a "Sign in with passkey" option on the login page. Teachers only (students use magic link OTP). No phone numbers or third-party services needed — Supabase supports WebAuthn natively.

- [ ] **Post-catalogue-copy link** — After a teacher copies a catalogue test to their own tests, show a link/button to navigate directly to the new copy.
- [ ] **Admin page** — Dedicated admin area to manage who can add tests to the catalogue. Needs a new role/permission model.
- [ ] **Practice test mode** — Students can take a test in practice mode: no score recorded, answers revealed after each question or at the end, can retake freely.
- [x] **Add favicon** — Add a favicon to all pages.

## Features

- [x] **Memory Work Supplements page** — Browsable, filterable resource library for CC-aligned flashcards, worksheets, and digital games. Filters by cycle, week, subject, type, and free/paid. TPT deep-link banner updates dynamically based on active filters. Added to teacher sidebar.

## UX / Polish

- [ ] **Supabase email templates** — Redesign the auth email templates (magic link, invite, password reset, email change confirmation) in the Supabase dashboard to match the Boring Boxes brand. On-brand typography, colours, and copy.

- [x] **Scroll to new question** — After clicking "Add Question" in the test editor, the page should scroll down to the newly added question.
- [x] **Socratic dialogue chat UI** — Redesign the Socratic dialogue as a conversation with chat bubbles. Socrates and Meno should have cartoon character avatars shown next to their messages. Each speaker's bubbles should be visually distinct (alignment, colour). Applies to both the student Socratic page and the teacher Socratic trainer.
