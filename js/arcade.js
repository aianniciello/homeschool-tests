// ──────────────────────────────────────────────────────────────
// js/arcade.js — Memory Work Arcade game logic
// ──────────────────────────────────────────────────────────────

import { requireAuth, logout }             from './auth.js'
import { supabase }                         from './supabase.js'
import { getAssignmentsForStudent,
         startSession, completeSession }    from './assignments.js'
import { getCards, getAvailableSets }       from './arcade-data.js'

// ── Auth ──────────────────────────────────────────────────────
export const authPromise = requireAuth('student')

// ── State ─────────────────────────────────────────────────────
let user, profile, studentInfo
let sessionId   = null
let sessionStart = 0

// Current game context
let activeGame       = null  // 'flash' | 'choice' | 'match'
let activeCards      = []
let activeAssignment = null  // full assignment row, or null for free play

// Flash Card state
let fcIndex = 0, fcCorrect = 0, fcFlipped = false

// Multiple Choice state
let mcIndex = 0, mcCorrect = 0, mcAnswered = false

// Matching state
let matchPairs    = []   // [{ id, type:'prompt'|'answer', text, pairId, matched, flipped }]
let matchFlipped  = []   // indices of currently face-up unmatched cards (max 2)
let matchAttempts = 0
let matchMatched  = 0

// ── Boot ──────────────────────────────────────────────────────
export async function boot() {
  const auth = await authPromise
  user    = auth.user
  profile = auth.profile

  document.getElementById('logout-btn').addEventListener('click', logout)

  const { data: si } = await supabase
    .from('students').select('schools(name), classes(name)')
    .eq('id', user.id).maybeSingle()
  studentInfo = si

  const navParts = [
    'Student: ' + (profile.full_name || user.email),
    si?.schools?.name,
    si?.classes?.name,
  ].filter(Boolean)
  document.getElementById('nav-user-info').textContent = navParts.join(' · ')

  await renderLobby()
}

// ─────────────────────────────────────────────────────────────
// LOBBY
// ─────────────────────────────────────────────────────────────
async function renderLobby() {
  showScreen('screen-lobby')

  const { data: assignments } = await getAssignmentsForStudent(user.id)
  const arcadeAssignments = (assignments || []).filter(a => a.content_type === 'arcade_game')

  // ── Assigned games ────────────────────────────────────────
  const assignedEl = document.getElementById('assigned-games')
  if (arcadeAssignments.length === 0) {
    assignedEl.innerHTML = '<p class="empty-note">No arcade games assigned yet.</p>'
  } else {
    assignedEl.innerHTML = arcadeAssignments.map(a => {
      const meta  = a.content_library || {}
      const urgency = dueDateUrgency(a.due_date)
      return `
        <div class="game-card ${urgency.cls}" onclick="window.launchAssigned('${a.id}')">
          <div class="game-card-top">
            <span class="game-badge">${gameLabel(meta.config?.game_type)}</span>
            ${a.due_date ? `<span class="due-chip ${urgency.chip}">${urgency.label}</span>` : ''}
          </div>
          <div class="game-card-title">${meta.title || 'Arcade Game'}</div>
          <div class="game-card-meta">
            ${[meta.subject, meta.cycle ? 'Cycle '+meta.cycle : '', meta.week ? 'Week '+meta.week : ''].filter(Boolean).join(' · ')}
          </div>
          <button class="btn game-play-btn">Play →</button>
        </div>`
    }).join('')
  }

  // ── Free play picker ──────────────────────────────────────
  renderFreePlayPicker()
}

function renderFreePlayPicker() {
  const sets = getAvailableSets()
  const cycles   = [...new Set(sets.map(s => s.cycle))].sort()
  const subjects = [...new Set(sets.map(s => s.subject))].sort()

  const cycleEl   = document.getElementById('fp-cycle')
  const weekEl    = document.getElementById('fp-week')
  const subjectEl = document.getElementById('fp-subject')
  const gameEl    = document.getElementById('fp-game')

  cycleEl.innerHTML   = cycles.map(c => `<option value="${c}">Cycle ${c}</option>`).join('')
  subjectEl.innerHTML = subjects.map(s => `<option value="${s}">${s}</option>`).join('')
  gameEl.innerHTML    = `
    <option value="flash">Flash Card Flip</option>
    <option value="choice">Multiple Choice Race</option>
    <option value="match">Matching Game</option>`

  updateWeekOptions()

  cycleEl.addEventListener('change', updateWeekOptions)
}

function updateWeekOptions() {
  const cycle = parseInt(document.getElementById('fp-cycle').value)
  const sets  = getAvailableSets().filter(s => s.cycle === cycle)
  const weeks = [...new Set(sets.map(s => s.week))].sort((a,b)=>a-b)
  document.getElementById('fp-week').innerHTML = weeks.map(w => `<option value="${w}">Week ${w}</option>`).join('')
}

// ─────────────────────────────────────────────────────────────
// LAUNCH HELPERS
// ─────────────────────────────────────────────────────────────
window.launchAssigned = async function(assignmentId) {
  const { data: assignments } = await getAssignmentsForStudent(user.id)
  const assignment = (assignments || []).find(a => a.id === assignmentId)
  if (!assignment) return

  const meta = assignment.content_library || {}
  const gameType = meta.config?.game_type || 'flash'
  const cards = getCards({ cycle: meta.cycle, week: meta.week, subject: meta.subject })
  if (cards.length === 0) return alert('No question data for this game yet.')

  activeAssignment = assignment
  await launchGame(gameType, cards, assignmentId, meta)
}

window.launchFreePlay = async function() {
  const cycle   = parseInt(document.getElementById('fp-cycle').value)
  const week    = parseInt(document.getElementById('fp-week').value)
  const subject = document.getElementById('fp-subject').value
  const gameType = document.getElementById('fp-game').value

  const cards = getCards({ cycle, week, subject })
  if (cards.length === 0) return alert('No question data for this combination yet.')

  activeAssignment = null
  await launchGame(gameType, cards, null, { cycle, week, subject, game_type: gameType })
}

async function launchGame(gameType, cards, assignmentId, meta) {
  // Shuffle and cap to session size
  const shuffled  = shuffle([...cards])
  const sessionCards = shuffled.slice(0, gameType === 'match' ? 8 : 10)

  activeGame  = gameType
  activeCards = sessionCards
  sessionStart = Date.now()

  const { sessionId: sid, error } = await startSession({
    assignmentId: assignmentId || null,
    studentId:    user.id,
    schoolId:     studentInfo?.schools?.id || null,
    contentType:  'arcade_game',
    contentId:    activeAssignment?.content_id || null,
  })
  sessionId = sid

  if      (gameType === 'flash')  initFlashCards()
  else if (gameType === 'choice') initMultipleChoice()
  else if (gameType === 'match')  initMatching()
}

// ─────────────────────────────────────────────────────────────
// FLASH CARD FLIP
// ─────────────────────────────────────────────────────────────
function initFlashCards() {
  fcIndex = 0; fcCorrect = 0; fcFlipped = false
  showScreen('screen-flash')
  renderFlashCard()
}

function renderFlashCard() {
  const card = activeCards[fcIndex]
  const total = activeCards.length

  document.getElementById('fc-progress').textContent = `${fcIndex + 1} / ${total}`
  document.getElementById('fc-score').textContent    = `${fcCorrect} correct`
  document.getElementById('fc-prog-fill').style.width = Math.round((fcIndex / total) * 100) + '%'

  const inner = document.getElementById('fc-inner')
  inner.style.transform = 'rotateY(0deg)'
  fcFlipped = false

  document.getElementById('fc-front-text').textContent = card.prompt
  document.getElementById('fc-back-text').textContent  = card.answer
  document.getElementById('fc-subject-tag').textContent = `${card.subject} · Cycle ${card.cycle} Wk ${card.week}`

  // Hide mark buttons until flipped
  document.getElementById('fc-mark-row').classList.add('hidden')
  document.getElementById('fc-flip-btn').classList.remove('hidden')
}

window.flipCard = function() {
  const inner = document.getElementById('fc-inner')
  inner.style.transform = 'rotateY(180deg)'
  fcFlipped = true
  document.getElementById('fc-mark-row').classList.remove('hidden')
  document.getElementById('fc-flip-btn').classList.add('hidden')
}

window.markFlash = async function(correct) {
  if (correct) fcCorrect++
  fcIndex++
  if (fcIndex >= activeCards.length) {
    await finishGame({
      score:    Math.round((fcCorrect / activeCards.length) * 100),
      accuracy: fcCorrect / activeCards.length,
      metadata: { game_type: 'flash_card', questions_correct: fcCorrect, total_questions: activeCards.length },
    })
  } else {
    renderFlashCard()
  }
}

// ─────────────────────────────────────────────────────────────
// MULTIPLE CHOICE RACE
// ─────────────────────────────────────────────────────────────
function initMultipleChoice() {
  mcIndex = 0; mcCorrect = 0; mcAnswered = false
  showScreen('screen-choice')
  renderChoiceQuestion()
}

function renderChoiceQuestion() {
  const q     = activeCards[mcIndex]
  const total = activeCards.length

  document.getElementById('mc-progress').textContent = `${mcIndex + 1} / ${total}`
  document.getElementById('mc-score').textContent    = `${mcCorrect} correct`
  document.getElementById('mc-prog-fill').style.width = Math.round((mcIndex / total) * 100) + '%'
  document.getElementById('mc-question').textContent = q.prompt

  const choices = shuffle([q.answer, ...q.wrongChoices])
  const grid = document.getElementById('mc-choices')
  grid.innerHTML = choices.map(c => `
    <button class="choice-btn" onclick="window.answerChoice(this, '${esc(c)}', '${esc(q.answer)}')">${c}</button>
  `).join('')

  mcAnswered = false
}

window.answerChoice = function(btn, chosen, correct) {
  if (mcAnswered) return
  mcAnswered = true

  const isCorrect = chosen === correct
  if (isCorrect) mcCorrect++

  // Highlight all buttons
  document.querySelectorAll('.choice-btn').forEach(b => {
    const text = b.textContent.trim()
    if (text === correct) b.classList.add('choice-correct')
    else if (b === btn && !isCorrect) b.classList.add('choice-wrong')
    b.disabled = true
  })

  setTimeout(() => {
    mcIndex++
    if (mcIndex >= activeCards.length) {
      const elapsed = Math.round((Date.now() - sessionStart) / 1000)
      finishGame({
        score:    Math.round((mcCorrect / activeCards.length) * 100),
        accuracy: mcCorrect / activeCards.length,
        timeSpentSeconds: elapsed,
        metadata: { game_type: 'multiple_choice', questions_correct: mcCorrect, total_questions: activeCards.length },
      })
    } else {
      renderChoiceQuestion()
    }
  }, 900)
}

// ─────────────────────────────────────────────────────────────
// MATCHING GAME
// ─────────────────────────────────────────────────────────────
function initMatching() {
  matchAttempts = 0; matchMatched = 0; matchFlipped = []

  // Build 16 cards (8 pairs)
  let pid = 0
  matchPairs = []
  for (const card of activeCards) {
    matchPairs.push({ id: pid*2,   type:'prompt', text: card.prompt, pairId: pid, matched:false, flipped:false })
    matchPairs.push({ id: pid*2+1, type:'answer', text: card.answer, pairId: pid, matched:false, flipped:false })
    pid++
  }
  matchPairs = shuffle(matchPairs)

  showScreen('screen-match')
  renderMatchGrid()
}

function renderMatchGrid() {
  const grid = document.getElementById('match-grid')
  document.getElementById('match-attempts').textContent = `Attempts: ${matchAttempts}`
  document.getElementById('match-matched').textContent  = `${matchMatched} / ${activeCards.length} matched`

  grid.innerHTML = matchPairs.map((c, i) => {
    let cls = 'match-card'
    if (c.matched) cls += ' match-matched'
    else if (c.flipped) cls += ' match-flipped'
    return `
      <div class="${cls}" id="mc-tile-${i}" onclick="window.flipMatchCard(${i})">
        <div class="match-inner">
          <div class="match-front">?</div>
          <div class="match-back">${c.text}</div>
        </div>
      </div>`
  }).join('')
}

window.flipMatchCard = function(i) {
  const card = matchPairs[i]
  if (card.matched || card.flipped || matchFlipped.length === 2) return

  card.flipped = true
  matchFlipped.push(i)
  renderMatchGrid()

  if (matchFlipped.length === 2) {
    matchAttempts++
    const [a, b] = matchFlipped.map(idx => matchPairs[idx])
    if (a.pairId === b.pairId) {
      // Match!
      a.matched = true; b.matched = true
      matchMatched++
      matchFlipped = []
      renderMatchGrid()
      if (matchMatched === activeCards.length) {
        const elapsed = Math.round((Date.now() - sessionStart) / 1000)
        setTimeout(() => finishGame({
          score:    100,
          accuracy: 1.0,
          timeSpentSeconds: elapsed,
          attempts: matchAttempts,
          metadata: { game_type: 'matching', pairs_matched: matchMatched, total_pairs: activeCards.length, attempts: matchAttempts },
        }), 600)
      }
    } else {
      setTimeout(() => {
        a.flipped = false; b.flipped = false
        matchFlipped = []
        renderMatchGrid()
      }, 1100)
    }
  }
}

// ─────────────────────────────────────────────────────────────
// RESULTS
// ─────────────────────────────────────────────────────────────
async function finishGame({ score, accuracy, timeSpentSeconds, attempts = 1, metadata }) {
  await completeSession({ sessionId, score, accuracy, timeSpentSeconds, attempts, metadata })

  const msg =
    score >= 90 ? "Outstanding! You've got this week locked in." :
    score >= 70 ? "Great work! A little more practice and you'll nail it." :
    score >= 50 ? "Good effort — try again to sharpen it up." :
                  "Keep going! Repetition is how it sticks."

  document.getElementById('res-score').textContent   = score + '%'
  document.getElementById('res-accuracy').textContent = Math.round((accuracy || 0) * 100) + '%'
  document.getElementById('res-time').textContent =
    timeSpentSeconds != null ? formatTime(timeSpentSeconds) : '—'
  document.getElementById('res-attempts-row').classList.toggle('hidden', attempts === 1 && activeGame !== 'match')
  document.getElementById('res-attempts').textContent = attempts
  document.getElementById('res-message').textContent  = msg

  const color =
    score >= 90 ? 'var(--on-secondary-container)' :
    score >= 70 ? 'var(--tertiary)' :
    score >= 50 ? 'var(--on-surface-variant)' : 'var(--error)'
  document.getElementById('res-score').style.color = color

  showScreen('screen-results')
}

window.playAgain = function() {
  if (!activeGame) { renderLobby(); return }
  if      (activeGame === 'flash')  initFlashCards()
  else if (activeGame === 'choice') initMultipleChoice()
  else if (activeGame === 'match')  initMatching()
}

window.backToArcade = function() {
  activeGame = null; activeAssignment = null; sessionId = null
  renderLobby()
}

// ─────────────────────────────────────────────────────────────
// UTILITIES
// ─────────────────────────────────────────────────────────────
function showScreen(id) {
  document.querySelectorAll('.game-screen').forEach(s => {
    s.classList.add('hidden')
    s.style.display = 'none'
  })
  const el = document.getElementById(id)
  el.classList.remove('hidden')
  el.style.display = 'block'
}

function shuffle(arr) {
  for (let i = arr.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [arr[i], arr[j]] = [arr[j], arr[i]]
  }
  return arr
}

function formatTime(secs) {
  const m = Math.floor(secs / 60), s = secs % 60
  return m > 0 ? `${m}m ${s}s` : `${s}s`
}

function esc(str) {
  return str.replace(/'/g, '&#39;').replace(/"/g, '&quot;')
}

function gameLabel(type) {
  if (type === 'matching')        return 'Matching Game'
  if (type === 'multiple_choice') return 'Multiple Choice Race'
  return 'Flash Card Flip'
}

function dueDateUrgency(due) {
  if (!due) return { cls: '', chip: '', label: '' }
  const days = Math.ceil((new Date(due) - new Date()) / 86400000)
  if (days < 0)  return { cls: 'card-overdue',   chip: 'chip-overdue',  label: 'Overdue' }
  if (days <= 3) return { cls: 'card-due-soon',  chip: 'chip-due-soon', label: `${days}d left` }
  return             { cls: 'card-on-track',  chip: 'chip-on-track', label: `${days}d left` }
}
