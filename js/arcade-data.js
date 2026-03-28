// ──────────────────────────────────────────────────────────────
// ARCADE DATA — CC Memory Work Question Sets
// Cycle 1, Weeks 1–3 · Latin and History to start
//
// Each card: { cycle, week, subject, prompt, answer, wrongChoices }
// wrongChoices: exactly 3 strings (used for Multiple Choice Race)
// ──────────────────────────────────────────────────────────────

export const ARCADE_CARDS = [

  // ── Cycle 1 · Week 1 · Latin ─────────────────────────────
  { cycle:1, week:1, subject:'Latin', prompt:'sum', answer:'I am', wrongChoices:['I go','I have','I do'] },
  { cycle:1, week:1, subject:'Latin', prompt:'es', answer:'you are', wrongChoices:['he is','we are','they are'] },
  { cycle:1, week:1, subject:'Latin', prompt:'est', answer:'he / she / it is', wrongChoices:['I am','you are','we are'] },
  { cycle:1, week:1, subject:'Latin', prompt:'sumus', answer:'we are', wrongChoices:['you are','they are','I am'] },
  { cycle:1, week:1, subject:'Latin', prompt:'estis', answer:'you (pl.) are', wrongChoices:['we are','they are','he is'] },
  { cycle:1, week:1, subject:'Latin', prompt:'sunt', answer:'they are', wrongChoices:['we are','you are','he is'] },
  { cycle:1, week:1, subject:'Latin', prompt:'amo', answer:'I love', wrongChoices:['I call','I carry','I praise'] },
  { cycle:1, week:1, subject:'Latin', prompt:'amas', answer:'you love', wrongChoices:['you call','you carry','you praise'] },
  { cycle:1, week:1, subject:'Latin', prompt:'amat', answer:'he / she loves', wrongChoices:['he calls','he carries','he praises'] },
  { cycle:1, week:1, subject:'Latin', prompt:'amamus', answer:'we love', wrongChoices:['we call','we carry','we praise'] },

  // ── Cycle 1 · Week 1 · History ───────────────────────────
  { cycle:1, week:1, subject:'History', prompt:'What is the first history sentence of Cycle 1?', answer:'Creation — God created the world and everything in it.', wrongChoices:['The Fall — Adam and Eve disobeyed God.','The Flood — God sent a flood to cleanse the earth.','Babel — People built a tower to reach heaven.'] },
  { cycle:1, week:1, subject:'History', prompt:'When did God create the world according to CC Cycle 1?', answer:'In the beginning', wrongChoices:['5,000 BC','3,000 BC','At the time of Moses'] },
  { cycle:1, week:1, subject:'History', prompt:'What event follows Creation in CC Cycle 1 history?', answer:'The Fall', wrongChoices:['The Flood','The Exodus','Babel'] },
  { cycle:1, week:1, subject:'History', prompt:'In the CC timeline, what comes after the Fall?', answer:'The Flood', wrongChoices:['The Tower of Babel','The Call of Abraham','The Exodus'] },
  { cycle:1, week:1, subject:'History', prompt:'Who built the ark in CC Cycle 1?', answer:'Noah', wrongChoices:['Abraham','Moses','David'] },
  { cycle:1, week:1, subject:'History', prompt:'What happened at the Tower of Babel?', answer:'Languages were confused and people scattered.', wrongChoices:['God sent a flood.','Moses received the law.','Abraham left Ur.'] },
  { cycle:1, week:1, subject:'History', prompt:'Who was called out of Ur to found a great nation?', answer:'Abraham', wrongChoices:['Moses','Noah','Isaac'] },
  { cycle:1, week:1, subject:'History', prompt:'What nation descended from Abraham?', answer:'Israel', wrongChoices:['Egypt','Babylon','Persia'] },
  { cycle:1, week:1, subject:'History', prompt:'Who led the Israelites out of Egypt?', answer:'Moses', wrongChoices:['Abraham','Joshua','David'] },
  { cycle:1, week:1, subject:'History', prompt:'What event is associated with the parting of the Red Sea?', answer:'The Exodus', wrongChoices:['The Conquest of Canaan','The Flood','The Babylonian Captivity'] },

  // ── Cycle 1 · Week 2 · Latin ─────────────────────────────
  { cycle:1, week:2, subject:'Latin', prompt:'porto', answer:'I carry', wrongChoices:['I love','I call','I praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'portas', answer:'you carry', wrongChoices:['you love','you call','you praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'portat', answer:'he / she carries', wrongChoices:['he loves','he calls','he praises'] },
  { cycle:1, week:2, subject:'Latin', prompt:'portamus', answer:'we carry', wrongChoices:['we love','we call','we praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'portatis', answer:'you (pl.) carry', wrongChoices:['you love','you call','you praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'portant', answer:'they carry', wrongChoices:['they love','they call','they praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'voco', answer:'I call', wrongChoices:['I love','I carry','I praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'vocas', answer:'you call', wrongChoices:['you love','you carry','you praise'] },
  { cycle:1, week:2, subject:'Latin', prompt:'vocat', answer:'he / she calls', wrongChoices:['he loves','he carries','he praises'] },
  { cycle:1, week:2, subject:'Latin', prompt:'vocamus', answer:'we call', wrongChoices:['we love','we carry','we praise'] },

  // ── Cycle 1 · Week 2 · History ───────────────────────────
  { cycle:1, week:2, subject:'History', prompt:'Who was the first king of Israel?', answer:'Saul', wrongChoices:['David','Solomon','Rehoboam'] },
  { cycle:1, week:2, subject:'History', prompt:'Who defeated Goliath?', answer:'David', wrongChoices:['Saul','Solomon','Jonathan'] },
  { cycle:1, week:2, subject:'History', prompt:'Who built the first Temple in Jerusalem?', answer:'Solomon', wrongChoices:['David','Saul','Josiah'] },
  { cycle:1, week:2, subject:'History', prompt:'What happened to Israel after Solomon died?', answer:'The kingdom split into Israel and Judah.', wrongChoices:['It was conquered by Egypt.','It was destroyed by Babylon.','It united under a new king.'] },
  { cycle:1, week:2, subject:'History', prompt:'What empire conquered the Northern Kingdom of Israel?', answer:'Assyria', wrongChoices:['Babylon','Egypt','Persia'] },
  { cycle:1, week:2, subject:'History', prompt:'What empire conquered the Southern Kingdom of Judah?', answer:'Babylon', wrongChoices:['Assyria','Egypt','Persia'] },
  { cycle:1, week:2, subject:'History', prompt:'Who allowed the Jews to return from Babylon?', answer:'Cyrus of Persia', wrongChoices:['Nebuchadnezzar','Alexander the Great','Darius'] },
  { cycle:1, week:2, subject:'History', prompt:'What empire came after the Persian Empire?', answer:'Greek Empire under Alexander the Great', wrongChoices:['Roman Empire','Assyrian Empire','Babylonian Empire'] },
  { cycle:1, week:2, subject:'History', prompt:'Who conquered Persia and spread Greek culture?', answer:'Alexander the Great', wrongChoices:['Julius Caesar','Cyrus','Darius'] },
  { cycle:1, week:2, subject:'History', prompt:'What culture spread across the world after Alexander?', answer:'Hellenistic (Greek) culture', wrongChoices:['Roman culture','Persian culture','Egyptian culture'] },

  // ── Cycle 1 · Week 3 · Latin ─────────────────────────────
  { cycle:1, week:3, subject:'Latin', prompt:'laudo', answer:'I praise', wrongChoices:['I love','I carry','I call'] },
  { cycle:1, week:3, subject:'Latin', prompt:'laudas', answer:'you praise', wrongChoices:['you love','you carry','you call'] },
  { cycle:1, week:3, subject:'Latin', prompt:'laudat', answer:'he / she praises', wrongChoices:['he loves','he carries','he calls'] },
  { cycle:1, week:3, subject:'Latin', prompt:'laudamus', answer:'we praise', wrongChoices:['we love','we carry','we call'] },
  { cycle:1, week:3, subject:'Latin', prompt:'laudatis', answer:'you (pl.) praise', wrongChoices:['you love','you carry','you call'] },
  { cycle:1, week:3, subject:'Latin', prompt:'laudant', answer:'they praise', wrongChoices:['they love','they carry','they call'] },
  { cycle:1, week:3, subject:'Latin', prompt:'What is the Latin verb ending for "I" (1st person singular)?', answer:'-o', wrongChoices:['-s','-t','-mus'] },
  { cycle:1, week:3, subject:'Latin', prompt:'What is the Latin verb ending for "you" (2nd person singular)?', answer:'-s', wrongChoices:['-o','-t','-tis'] },
  { cycle:1, week:3, subject:'Latin', prompt:'What is the Latin verb ending for "he/she/it" (3rd person singular)?', answer:'-t', wrongChoices:['-o','-s','-nt'] },
  { cycle:1, week:3, subject:'Latin', prompt:'What is the Latin verb ending for "we" (1st person plural)?', answer:'-mus', wrongChoices:['-tis','-nt','-t'] },

  // ── Cycle 1 · Week 3 · History ───────────────────────────
  { cycle:1, week:3, subject:'History', prompt:'What republic dominated the Mediterranean by 200 BC?', answer:'Rome', wrongChoices:['Greece','Carthage','Egypt'] },
  { cycle:1, week:3, subject:'History', prompt:'Who crossed the Alps to attack Rome?', answer:'Hannibal of Carthage', wrongChoices:['Julius Caesar','Alexander the Great','Scipio'] },
  { cycle:1, week:3, subject:'History', prompt:'What wars did Rome fight against Carthage?', answer:'The Punic Wars', wrongChoices:['The Gallic Wars','The Persian Wars','The Peloponnesian Wars'] },
  { cycle:1, week:3, subject:'History', prompt:'Who ended the Roman Republic and became dictator?', answer:'Julius Caesar', wrongChoices:['Augustus','Nero','Cicero'] },
  { cycle:1, week:3, subject:'History', prompt:'Who was the first Roman Emperor?', answer:'Augustus (Octavian)', wrongChoices:['Julius Caesar','Nero','Tiberius'] },
  { cycle:1, week:3, subject:'History', prompt:'What period of peace followed Augustus becoming emperor?', answer:'The Pax Romana', wrongChoices:['The Pax Britannica','The Golden Age of Greece','The Renaissance'] },
  { cycle:1, week:3, subject:'History', prompt:'In what year was Jesus born?', answer:'Around 4–6 BC', wrongChoices:['0 AD','33 AD','1 AD'] },
  { cycle:1, week:3, subject:'History', prompt:'What religion spread through the Roman Empire after Christ?', answer:'Christianity', wrongChoices:['Islam','Judaism','Mithraism'] },
  { cycle:1, week:3, subject:'History', prompt:'What emperor made Christianity legal in Rome?', answer:'Constantine', wrongChoices:['Nero','Augustus','Diocletian'] },
  { cycle:1, week:3, subject:'History', prompt:'When did the Western Roman Empire fall?', answer:'476 AD', wrongChoices:['410 AD','380 AD','550 AD'] },

]

// ── Helpers ───────────────────────────────────────────────────

// Return cards filtered by cycle, week, subject (all optional)
export function getCards({ cycle, week, subject } = {}) {
  return ARCADE_CARDS.filter(c =>
    (cycle   === undefined || c.cycle   === cycle) &&
    (week    === undefined || c.week    === week) &&
    (subject === undefined || c.subject === subject)
  )
}

// All distinct { cycle, week, subject } combos available
export function getAvailableSets() {
  const seen = new Set()
  const sets = []
  for (const c of ARCADE_CARDS) {
    const key = `${c.cycle}-${c.week}-${c.subject}`
    if (!seen.has(key)) {
      seen.add(key)
      sets.push({ cycle: c.cycle, week: c.week, subject: c.subject })
    }
  }
  return sets.sort((a, b) =>
    a.cycle - b.cycle || a.week - b.week || a.subject.localeCompare(b.subject)
  )
}
