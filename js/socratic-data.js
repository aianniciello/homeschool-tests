// ──────────────────────────────────────────────────────────────
// SOCRATIC DIALOGUE TRAINER — Data
// ──────────────────────────────────────────────────────────────

export const SOCRATIC_MOVES = [
  'Definition request',
  'Counterexample',
  'Reductio ad absurdum',
  'Hidden assumption trap',
  'Analogy',
  'Elenchus',
  'Clarification request',
  'Concession + pivot',
]

export const MOVES_GLOSSARY = {
  'Definition request':     'Socrates asks for a precise definition of the concept under discussion — not examples, but the single thing all instances share.',
  'Counterexample':         'Socrates offers a case that the proposed definition fails to cover, showing the definition is too narrow or too broad.',
  'Reductio ad absurdum':   'Socrates accepts a premise and follows it to its logical conclusion — revealing that the conclusion is absurd, and so the premise must be wrong.',
  'Hidden assumption trap': 'Socrates reveals an unstated premise buried in the interlocutor\'s argument, often one the speaker would not consciously endorse.',
  'Analogy':                'Socrates uses a parallel case (craftsman, doctor, trainer) to illuminate the problem by comparison.',
  'Elenchus':               'The full cross-examination cycle: elicit a definition → test it → show a contradiction → invite the speaker to revise.',
  'Clarification request':  'Socrates asks the interlocutor to be more precise about a term or claim before proceeding.',
  'Concession + pivot':     'Socrates acknowledges a point or grants a difficulty, then redirects the inquiry toward a deeper or more productive question.',
}

export const DIALOGUES = {

  // ════════════════════════════════════════════════════════════
  // MENO
  // ════════════════════════════════════════════════════════════
  meno: {
    title: 'Meno',
    subtitle: 'What is virtue?',
    description: 'Socrates dismantles five of Meno\'s attempts to define virtue, demonstrating irony, counterexample, and reductio.',
    exchanges: [

      // Exchange 1
      {
        context: 'Meno has just told Socrates he\'s heard many speeches about virtue and considers himself knowledgeable.',
        bubbles: [
          { speaker: 'Socrates', text: 'Can you tell me, Meno — what is virtue?' },
          { speaker: 'Meno',    text: 'That\'s not difficult, Socrates. First, the virtue of a man is to manage public affairs capably. The virtue of a woman is to order her house well and to obey her husband. Children have their own virtue, and old men theirs.' },
          { speaker: 'Socrates', text: 'I seem to be very fortunate, Meno. I was looking for one virtue, and I find that you have a whole swarm of virtues to offer me.' },
        ],
        highlighted: 'I seem to be very fortunate, Meno. I was looking for one virtue, and I find that you have a whole swarm of virtues to offer me.',
        correctMoves: ['Definition request', 'Counterexample'],
        mc: {
          question: 'Why does Socrates say he is "very fortunate" when he finds Meno\'s answer unhelpful?',
          options: [
            { text: 'He genuinely thinks Meno has answered well and is satisfied.',                                                           correct: false },
            { text: 'He is using irony to highlight that Meno gave examples, not a definition of the single thing called virtue.',           correct: true  },
            { text: 'He wants to compliment Meno before asking a harder question.',                                                          correct: false },
            { text: 'He believes virtue really does come in many separate forms.',                                                           correct: false },
          ],
          explanation: 'Socratic irony: Socrates praises where criticism is intended. The point is that a list of instances does not tell us what virtue IS — its essential nature.',
        },
        writeContext: 'Meno has just given a list of different virtues for different people. Socrates needs to push Meno toward defining the ONE thing all virtues share.',
        idealMove: 'Definition request — ask Meno what ONE quality is common to all the virtues he listed.',
      },

      // Exchange 2
      {
        context: 'Meno tries again with a single definition.',
        bubbles: [
          { speaker: 'Meno',    text: 'Very well, Socrates. Virtue is the ability to govern men.' },
          { speaker: 'Socrates', text: 'But is virtue the same for a child or a slave? Can a slave \'govern men\'? And if governing is the essence, what do we make of a woman who manages her household — she governs, but not in the public sense you mean. Does your definition cover all cases?' },
          { speaker: 'Meno',    text: 'I... perhaps you are right that my definition is too narrow.' },
        ],
        highlighted: 'But is virtue the same for a child or a slave? Can a slave \'govern men\'?',
        correctMoves: ['Counterexample', 'Hidden assumption trap'],
        mc: {
          question: 'What flaw in Meno\'s definition does Socrates expose here?',
          options: [
            { text: 'That governing requires courage, and not everyone is courageous.',                                                                         correct: false },
            { text: 'That the definition works only for adult free men — it excludes children, slaves, and women, so it cannot be the essence of virtue.',      correct: true  },
            { text: 'That governing is a skill, not a virtue.',                                                                                                correct: false },
            { text: 'That Meno is thinking of politics, not ethics.',                                                                                          correct: false },
          ],
          explanation: 'Socrates uses counterexamples (the child, the slave) to show the definition is not universal — a good definition must cover all cases.',
        },
        writeContext: 'Meno has admitted his definition is too narrow. Socrates should now guide him toward what property ALL virtuous people and actions share.',
        idealMove: 'Definition request + analogy — ask Meno to think of another domain where one essence underlies many instances.',
      },

      // Exchange 3
      {
        context: 'Meno proposes that virtue is "desiring beautiful things and having the power to acquire them."',
        bubbles: [
          { speaker: 'Meno',    text: 'Then perhaps virtue is desiring beautiful things and having the power to acquire them.' },
          { speaker: 'Socrates', text: 'Do you say that there are people who desire evil things?' },
          { speaker: 'Meno',    text: 'Yes, I think some do.' },
          { speaker: 'Socrates', text: 'Do you think they know those things are evil, or do they mistake evil for good?' },
          { speaker: 'Meno',    text: 'Some know they are evil, I believe.' },
          { speaker: 'Socrates', text: 'Then in your view, some people knowingly desire what is evil — they wish to be harmed? Is that what you mean?' },
        ],
        highlighted: 'Then in your view, some people knowingly desire what is evil — they wish to be harmed? Is that what you mean?',
        correctMoves: ['Reductio ad absurdum', 'Hidden assumption trap'],
        mc: {
          question: 'What technique is Socrates using when he asks "they wish to be harmed?"',
          options: [
            { text: 'He is agreeing with Meno and extending the point.',                                                          correct: false },
            { text: 'He is changing the subject to distract Meno.',                                                               correct: false },
            { text: 'He is pushing Meno\'s claim to its logical conclusion to show it produces an absurd result.',                 correct: true  },
            { text: 'He is giving a counterexample from his own experience.',                                                     correct: false },
          ],
          explanation: 'Reductio: Socrates accepts the premise "some desire evil knowingly" and traces it forward — if so, they must wish to be harmed, which seems absurd. This forces Meno to revise his claim.',
        },
        writeContext: 'Meno is stuck: he either must say no one truly desires evil, or that some people want to harm themselves. Socrates should now press toward the implications for the definition of virtue.',
        idealMove: 'Clarification request or reductio — force Meno to choose one horn of the dilemma.',
      },

      // Exchange 4
      {
        context: 'Meno tries: "virtue is the power to rule over others."',
        bubbles: [
          { speaker: 'Meno',    text: 'Then let us say virtue is the power to rule over others.' },
          { speaker: 'Socrates', text: 'Is it virtuous for a child to rule over his father? Or for a slave to rule his master?' },
          { speaker: 'Meno',    text: 'Of course not.' },
          { speaker: 'Socrates', text: 'Then you must add \'justly\' — the power to rule JUSTLY. But if justice is already part of the definition, have you not simply hidden one virtue inside another without explaining either?' },
        ],
        highlighted: 'But if justice is already part of the definition, have you not simply hidden one virtue inside another without explaining either?',
        correctMoves: ['Hidden assumption trap', 'Elenchus'],
        mc: {
          question: 'What logical problem does Socrates identify in Meno\'s revised definition?',
          options: [
            { text: 'That ruling requires wisdom, which Meno hasn\'t defined.',                                               correct: false },
            { text: 'That the definition is circular — it uses "justice" (itself a virtue) to define virtue.',                correct: true  },
            { text: 'That power is not a virtue at all.',                                                                     correct: false },
            { text: 'That children should be allowed to rule.',                                                               correct: false },
          ],
          explanation: 'Circular definition: if virtue = ruling justly, and justice is itself a virtue, the definition explains nothing — it just restates the problem inside itself.',
        },
        writeContext: 'Meno\'s definition has collapsed into circularity. Socrates must now either offer a fresh angle or demonstrate that Meno truly does not know what virtue is.',
        idealMove: 'Concession + pivot — acknowledge the difficulty and suggest starting over with a simpler case, perhaps using an analogy to shape or color.',
      },

      // Exchange 5
      {
        context: 'Meno, frustrated, compares Socrates to a torpedo fish that numbs whatever it touches.',
        bubbles: [
          { speaker: 'Meno',    text: 'Socrates, before I met you I was told you were a man who always doubts and makes others doubt. You are like the torpedo fish — you numb me, and I cannot answer you.' },
          { speaker: 'Socrates', text: 'I am not certain that this comparison is quite just. If the torpedo fish is itself numb, and so causes others to be numb, then I am like it. But if it is otherwise — if I am merely in the same perplexity as those I question — then your metaphor flatters me. For I do not know what virtue is. Do you think I would ask if I knew?' },
        ],
        highlighted: 'For I do not know what virtue is. Do you think I would ask if I knew?',
        correctMoves: ['Hidden assumption trap', 'Concession + pivot'],
        mc: {
          question: 'What does Socrates reveal about himself in this final exchange, and why does it matter?',
          options: [
            { text: 'That he is simply being humble in a polite way.',                                                                                               correct: false },
            { text: 'That he genuinely claims not to know — demonstrating that the value of the dialogue was to expose the question, not answer it.',                correct: true  },
            { text: 'That he is bored with the conversation.',                                                                                                       correct: false },
            { text: 'That he agrees virtue cannot be defined.',                                                                                                      correct: false },
          ],
          explanation: 'The profession of ignorance (aporia) is central to Socratic method: the goal is often not a final answer but to show a question is harder than it appeared — that is itself intellectual progress.',
        },
        writeContext: 'The dialogue has reached aporia. Socrates might now redirect Meno toward a new approach: perhaps investigating whether virtue can be taught will illuminate what it is.',
        idealMove: 'Concession + pivot or analogy — acknowledge the impasse and propose a new angle of inquiry.',
      },

    ],
  },

  // ════════════════════════════════════════════════════════════
  // CRITO
  // ════════════════════════════════════════════════════════════
  crito: {
    title: 'Crito',
    subtitle: 'Should Socrates escape?',
    description: 'Socrates refutes Crito\'s plea for escape using the social contract, analogy, and reductio to defend submitting to the law.',
    exchanges: [

      // Exchange 1
      {
        context: 'Crito arrives in prison before dawn; execution is imminent; he has arranged an escape.',
        bubbles: [
          { speaker: 'Crito',   text: 'Socrates, you must escape. I have money and friends ready. The people who would help you do it are not expensive. Do not refuse on my account.' },
          { speaker: 'Socrates', text: 'Dear Crito, your eagerness is valuable if it is rightly directed. But if not, the greater the eagerness, the greater the harm. We must consider whether I ought to do this or not. Shall we — as I have always done — follow only the argument that seems best on reflection?' },
        ],
        highlighted: 'We must consider whether I ought to do this or not. Shall we follow only the argument that seems best on reflection?',
        correctMoves: ['Definition request', 'Clarification request'],
        mc: {
          question: 'What is Socrates insisting upon before he considers Crito\'s plan?',
          options: [
            { text: 'That they act quickly before the opportunity closes.',                                       correct: false },
            { text: 'That they must reason carefully from principle, not from urgency or emotion.',               correct: true  },
            { text: 'That Crito\'s friends are not to be trusted.',                                               correct: false },
            { text: 'That Socrates has already decided to stay.',                                                 correct: false },
          ],
          explanation: 'Socrates models the Socratic commitment: no argument from fear, convenience, or friendship — only the argument that survives scrutiny. This is the meta-principle behind the elenchus.',
        },
        writeContext: 'Crito has given a practical argument (escape is possible, friends are willing). Socrates needs to shift to the right question: not "can we?" but "ought we?"',
        idealMove: 'Definition request or clarification — establish the correct question before evaluating the practical argument.',
      },

      // Exchange 2
      {
        context: 'Crito argues that public opinion will judge Socrates\' friends harshly if they let him die.',
        bubbles: [
          { speaker: 'Crito',   text: 'Besides, Socrates, I think you are also betraying your sons — you could bring them up and educate them. And the opinion of the multitude will be that your friends did nothing for you.' },
          { speaker: 'Socrates', text: 'Why should we care about the opinion of the many? The good men, who are more worth considering, will think the matter was done as it was done. Should we value the opinion of many over the judgment of one person who understands justice?' },
        ],
        highlighted: 'Should we value the opinion of many over the judgment of one person who understands justice?',
        correctMoves: ['Hidden assumption trap', 'Analogy'],
        mc: {
          question: 'Crito appeals to "what people will think." How does Socrates undermine this argument?',
          options: [
            { text: 'He says that people do not actually care what happens to philosophers.',                                                                               correct: false },
            { text: 'He exposes the hidden assumption that majority opinion is the correct standard — and replaces it with the standard of the expert in justice.',         correct: true  },
            { text: 'He argues that his sons will be fine without him.',                                                                                                    correct: false },
            { text: 'He claims the multitude cannot even see the situation clearly.',                                                                                       correct: false },
          ],
          explanation: 'Socrates attacks the assumption buried in Crito\'s appeal to public opinion: why should the MANY be the standard? He uses an analogy to the trainer/doctor — we follow the expert, not the crowd.',
        },
        writeContext: 'Socrates has rejected public opinion as a standard. He should now push Crito to articulate what the correct standard is — to get Crito to agree to reason from justice alone.',
        idealMove: 'Analogy — extend the expert-vs-crowd analogy to make Crito commit to the principle.',
      },

      // Exchange 3
      {
        context: 'Crito insists that staying is unjust to his friends, family, and children.',
        bubbles: [
          { speaker: 'Crito',   text: 'But it does seem unjust to me, Socrates, that you abandon your children and your friends when you could save yourself.' },
          { speaker: 'Socrates', text: 'Let us examine that. Is it ever right to commit injustice — even in return for an injustice done to you?' },
          { speaker: 'Crito',   text: 'No, I suppose not — though many would disagree.' },
          { speaker: 'Socrates', text: 'Then we must proceed from this: that we are never to do wrong, even in return for wrong. Does Crito agree with this as a starting principle?' },
        ],
        highlighted: 'Then we must proceed from this: that we are never to do wrong, even in return for wrong.',
        correctMoves: ['Definition request', 'Elenchus'],
        mc: {
          question: 'Why does Socrates spend so much time establishing this single principle before proceeding?',
          options: [
            { text: 'To delay the conversation so Crito gives up.',                                                                                      correct: false },
            { text: 'Because establishing an agreed-upon premise locks in a foundation — any argument Crito makes later must be consistent with it.',     correct: true  },
            { text: 'Because he is not sure Crito is intelligent enough to follow the argument.',                                                        correct: false },
            { text: 'He wants to show off his knowledge of ethics.',                                                                                     correct: false },
          ],
          explanation: 'This is Socratic method at its structural core: establish a bedrock principle both parties agree to. Then any later argument that contradicts it is already refuted.',
        },
        writeContext: 'Crito has agreed that wrong cannot justify wrong. Socrates should now connect this principle directly to whether escaping constitutes an injustice against the Laws.',
        idealMove: 'Hidden assumption trap — ask Crito whether escaping would constitute doing wrong to the Laws, which they have agreed is impermissible.',
      },

      // Exchange 4
      {
        context: 'Socrates personifies the Laws of Athens and imagines them speaking to him.',
        bubbles: [
          { speaker: 'Socrates', text: 'Suppose the Laws of Athens came to me here and said: "Socrates, what are you proposing to do? By escaping, are you not attempting to destroy us — the Laws — and the whole city, insofar as you can?"' },
          { speaker: 'Crito',   text: 'I see what you mean — but what would you answer them?' },
          { speaker: 'Socrates', text: 'What answer could I give? That the city wronged me first? But then the Laws might say: "Was that the agreement? Did you not live here seventy years, raise children here, accept the city\'s benefits — all the while free to leave at any time if you disagreed with us?"' },
        ],
        highlighted: 'Did you not live here seventy years, raise children here, accept the city\'s benefits — all the while free to leave at any time if you disagreed with us?',
        correctMoves: ['Hidden assumption trap', 'Reductio ad absurdum'],
        mc: {
          question: 'What hidden assumption do the Laws expose in Socrates\' potential complaint "the city wronged me first"?',
          options: [
            { text: 'That Socrates is a citizen and therefore has no rights against the city.',                                                                             correct: false },
            { text: 'That by remaining in Athens for 70 years and accepting its benefits, Socrates implicitly agreed to abide by its decisions — even unjust ones.',        correct: true  },
            { text: 'That Socrates is not smart enough to have left earlier.',                                                                                              correct: false },
            { text: 'That the Laws of Athens are perfectly just and never wrong.',                                                                                         correct: false },
          ],
          explanation: 'The Laws expose an implicit social contract: staying = consenting. You cannot accept a state\'s benefits and then reject its authority only when it inconveniences you.',
        },
        writeContext: 'The implied-consent argument has been made. Socrates (as the Laws) should now push to its conclusion: if everyone did what Socrates proposes, what would happen to law and order?',
        idealMove: 'Reductio ad absurdum — what if every condemned person escaped whenever they disagreed? What does that do to the rule of law?',
      },

      // Exchange 5
      {
        context: 'The Laws reach their final argument.',
        bubbles: [
          { speaker: 'Socrates', text: 'If you go away now, you will depart as one who has done wrong to us — not to escape death, but to escape justice. You will confirm your accusers in the charge that you corrupt the young by showing that you place your life above the law.' },
          { speaker: 'Crito',   text: 'I cannot argue against it, Socrates.' },
          { speaker: 'Socrates', text: 'Then let it be, Crito. Let us act in this way, since this is the direction in which the god leads.' },
        ],
        highlighted: 'You will confirm your accusers in the charge that you corrupt the young by showing that you place your life above the law.',
        correctMoves: ['Reductio ad absurdum', 'Elenchus'],
        mc: {
          question: 'The Laws argue escaping would "confirm the accusers\' charge." What kind of argument is this?',
          options: [
            { text: 'An appeal to consequences — the action would produce an outcome that contradicts Socrates\' own stated values.',  correct: true  },
            { text: 'A legal argument that Socrates is bound by the verdict.',                                                        correct: false },
            { text: 'A reductio showing that escape is physically impossible.',                                                      correct: false },
            { text: 'A claim that the accusers were actually right.',                                                                correct: false },
          ],
          explanation: 'The Laws use Socrates\' own values against him: he claims to pursue virtue and integrity, yet escaping would publicly demonstrate the opposite — that he prioritizes survival over principle.',
        },
        writeContext: 'The dialogue has reached its conclusion. Crito has no counter-argument. If you were Socrates, what one final question might you pose to Crito to ensure he has genuinely understood — not merely been silenced?',
        idealMove: 'Clarification request or definition request — confirm Crito understands the difference between being defeated in argument and being genuinely persuaded.',
      },

    ],
  },
}
