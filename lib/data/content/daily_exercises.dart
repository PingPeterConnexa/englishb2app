import '../models/exercise_model.dart';

class DailyExercises {
  DailyExercises._();

  static const List<ExerciseModel> tasks = [
    // Day 1
    ExerciseModel(
      id: 'daily_01',
      question: 'By the time we arrived, they _____ the entire house.',
      answers: ['painted', 'had painted', 'have painted', 'were painting'],
      correctAnswerIndex: 1,
      explanation:
          'Past perfect "had painted" is needed because the painting was completed before the arrival (an earlier past event).',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 2
    ExerciseModel(
      id: 'daily_02',
      question: 'What is the main idea of the passage?',
      passage:
          'Microplastics have been discovered in the most remote corners of the planet, from the depths '
          'of the Mariana Trench to the peaks of the Himalayas. Scientists warn that these tiny particles, '
          'often invisible to the naked eye, are now entering human bloodstreams through food and water. '
          'While the long-term health effects remain unclear, researchers agree that reducing plastic '
          'production is the most effective way to address the crisis.',
      answers: [
        'Microplastics are only found in oceans',
        'Microplastics are a widespread and growing health concern',
        'Scientists have already solved the microplastics problem',
        'Plastic production should increase to meet demand',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage describes how widespread microplastics are and the potential health risks, making B the best summary.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 3
    ExerciseModel(
      id: 'daily_03',
      question: 'She wouldn\'t have missed the flight if she _____ earlier.',
      answers: ['leaves', 'left', 'had left', 'would leave'],
      correctAnswerIndex: 2,
      explanation:
          'Third conditional: "If + past perfect, would have + past participle." The if-clause requires "had left."',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 4
    ExerciseModel(
      id: 'daily_04',
      question: 'She accused him _____ lying about his qualifications.',
      answers: ['for', 'of', 'to', 'about'],
      correctAnswerIndex: 1,
      explanation:
          '"Accuse someone of + gerund" is the correct collocation. "She accused him of lying."',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 5
    ExerciseModel(
      id: 'daily_05',
      question: 'The report needs to be handed _____ by Friday at the latest.',
      answers: ['in', 'on', 'up', 'out'],
      correctAnswerIndex: 0,
      explanation:
          '"Hand in" means to submit. It is the correct phrasal verb for submitting work or reports.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 6
    ExerciseModel(
      id: 'daily_06',
      question: 'What can be inferred from the passage about electric vehicles?',
      passage:
          'Sales of electric vehicles have surged by 40% globally in the past year. Governments are '
          'offering generous subsidies, and charging infrastructure is expanding rapidly. However, '
          'critics point out that battery production relies on mining rare minerals, which carries its '
          'own environmental cost. The full lifecycle analysis of EVs suggests they are greener than '
          'petrol cars, but not as clean as many consumers assume.',
      answers: [
        'Electric vehicles have no environmental impact',
        'Electric vehicles are better but not perfect for the environment',
        'Nobody is buying electric vehicles',
        'Governments oppose electric vehicles',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage states EVs are "greener than petrol cars, but not as clean as many consumers assume."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 7
    ExerciseModel(
      id: 'daily_07',
      question: 'I\'d rather you _____ anyone about this until the announcement.',
      answers: ['don\'t tell', 'didn\'t tell', 'won\'t tell', 'haven\'t told'],
      correctAnswerIndex: 1,
      explanation:
          'After "I\'d rather + someone," the past simple is used to express a preference about another person\'s actions.',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 8
    ExerciseModel(
      id: 'daily_08',
      question: 'What does the passage suggest about sleep and technology?',
      passage:
          'A growing body of research suggests that the blue light emitted by smartphones and tablets '
          'suppresses the production of melatonin, the hormone responsible for regulating sleep. Even '
          'brief exposure within an hour of bedtime can delay sleep onset by up to thirty minutes. '
          'Sleep experts recommend switching to "night mode" on devices or, ideally, avoiding screens '
          'entirely in the hour before bed. Despite this advice, surveys show that over 70% of adults '
          'still use their phones in bed.',
      answers: [
        'Technology has no effect on sleep quality',
        'Blue light from screens can disrupt sleep by suppressing melatonin',
        'Only children are affected by screen use before bed',
        'Night mode completely eliminates the problem',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage explains that blue light "suppresses the production of melatonin" and can "delay sleep onset."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 9
    ExerciseModel(
      id: 'daily_09',
      question: 'Not until the manager arrived _____ the meeting begin.',
      answers: ['did', 'does', 'was', 'had'],
      correctAnswerIndex: 0,
      explanation:
          '"Not until" at the start of a sentence triggers subject-auxiliary inversion. Past simple requires "did."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 10
    ExerciseModel(
      id: 'daily_10',
      question: 'What does the author think about social media in education?',
      passage:
          'Some educators have embraced social media as a teaching tool, arguing that platforms like '
          'YouTube and TikTok can make complex topics accessible to younger audiences. Others remain '
          'sceptical, concerned about shortened attention spans and the spread of misinformation. '
          'A balanced approach—using curated content under teacher supervision—appears to offer the '
          'most promise while minimising risks.',
      answers: [
        'It should be completely banned in schools',
        'It is always beneficial for learning',
        'A supervised, balanced approach is best',
        'Only YouTube should be used in education',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage concludes that "a balanced approach—using curated content under teacher supervision—appears to offer the most promise."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 11
    ExerciseModel(
      id: 'daily_11',
      question: 'He admitted _____ the window, but said it was an accident.',
      answers: ['to break', 'breaking', 'to breaking', 'break'],
      correctAnswerIndex: 1,
      explanation:
          '"Admit" is followed by a gerund (-ing form). "He admitted breaking" is the correct pattern.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 12
    ExerciseModel(
      id: 'daily_12',
      question: 'Were it not _____ the scholarship, she could never have afforded university.',
      answers: ['about', 'for', 'with', 'from'],
      correctAnswerIndex: 1,
      explanation:
          '"Were it not for" is a formal inverted conditional meaning "if it had not been for."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 13
    ExerciseModel(
      id: 'daily_13',
      question: 'Rewrite: "People say the castle is haunted."\nThe castle _____',
      answers: [
        'is said to be haunted',
        'is said being haunted',
        'said to be haunted',
        'says to be haunted',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Passive reporting structure: subject + "is said to" + infinitive. "The castle is said to be haunted."',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 14
    ExerciseModel(
      id: 'daily_14',
      question: 'What does the passage suggest about the four-day work week?',
      passage:
          'Several companies that trialled a four-day work week reported surprising results: productivity '
          'either remained stable or increased, while employee satisfaction rose dramatically. Absenteeism '
          'dropped by nearly 40%, and recruitment became easier as talented workers sought better work-life '
          'balance. Despite these findings, most large corporations remain hesitant to adopt the model, '
          'citing concerns about client expectations and operational complexity.',
      answers: [
        'It always reduces productivity',
        'It has shown positive results but faces corporate resistance',
        'All companies have already adopted it',
        'Employees dislike having an extra day off',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage shows positive trial results but notes "most large corporations remain hesitant."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 15
    ExerciseModel(
      id: 'daily_15',
      question: 'The children were made _____ their homework before watching TV.',
      answers: ['do', 'to do', 'doing', 'done'],
      correctAnswerIndex: 1,
      explanation:
          'In passive form, "make" requires "to + infinitive": "were made to do." Active form uses bare infinitive.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 16
    ExerciseModel(
      id: 'daily_16',
      question: 'What does the passage imply about the future of printed newspapers?',
      passage:
          'Printed newspaper circulation has fallen by over 50% in the last decade, and advertising '
          'revenue has shifted overwhelmingly to digital platforms. Many iconic publications have ceased '
          'their print editions entirely, moving to online-only models. However, a small but loyal '
          'readership continues to value the tactile experience of holding a newspaper. Some analysts '
          'predict that print will survive as a premium niche product, much like vinyl records did in '
          'the age of streaming.',
      answers: [
        'Printed newspapers have already completely disappeared',
        'Print may survive as a niche product for dedicated readers',
        'Advertising revenue for print is increasing',
        'Everyone prefers reading news on paper',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage suggests "print will survive as a premium niche product" similar to vinyl records.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 17
    ExerciseModel(
      id: 'daily_17',
      question: 'We\'re not used to _____ such cold weather in this part of the country.',
      answers: ['have', 'having', 'had', 'has'],
      correctAnswerIndex: 1,
      explanation:
          '"Be used to" is followed by a gerund (-ing form). "Not used to having" is the correct form.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 18
    ExerciseModel(
      id: 'daily_18',
      question: 'According to the passage, why are libraries still relevant?',
      passage:
          'Despite predictions that the internet would make libraries obsolete, public libraries have '
          'reinvented themselves as community hubs. They now offer free internet access, job-seeking '
          'workshops, and spaces for local events. In many underprivileged areas, the library remains '
          'the only place where residents can access computers and printers for free, making it an '
          'essential service rather than a relic of the past.',
      answers: [
        'They sell books more cheaply than online shops',
        'They serve as vital community resources beyond lending books',
        'People prefer reading physical books',
        'The internet is unreliable in most areas',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage describes libraries as "community hubs" offering internet, workshops, and events beyond just books.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 19
    ExerciseModel(
      id: 'daily_19',
      question: 'Hardly _____ the door when the phone started ringing.',
      answers: ['I had closed', 'had I closed', 'I closed', 'did I close'],
      correctAnswerIndex: 1,
      explanation:
          '"Hardly" at the start of a sentence triggers inversion: "Hardly had I closed..." (past perfect inverted).',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 20
    ExerciseModel(
      id: 'daily_20',
      question: 'He would rather _____ the bus than drive in rush-hour traffic.',
      answers: ['take', 'to take', 'taking', 'took'],
      correctAnswerIndex: 0,
      explanation:
          '"Would rather + bare infinitive" is used to express a preference. "He would rather take the bus."',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 21
    ExerciseModel(
      id: 'daily_21',
      question: 'She suggested that he _____ a doctor as soon as possible.',
      answers: ['sees', 'saw', 'see', 'would see'],
      correctAnswerIndex: 2,
      explanation:
          'After "suggest that," the subjunctive base form is used in formal English: "suggested that he see."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 22
    ExerciseModel(
      id: 'daily_22',
      question: 'What does the passage reveal about coffee consumption?',
      passage:
          'Recent studies have challenged the long-held belief that coffee is harmful. Moderate consumption '
          '—roughly three to four cups a day—has been linked to a lower risk of type 2 diabetes, '
          'Parkinson\'s disease, and certain liver conditions. However, excessive intake can lead to '
          'anxiety, insomnia, and increased heart rate. As with most things, moderation appears to be key.',
      answers: [
        'All coffee consumption is dangerous',
        'Moderate coffee drinking may have health benefits',
        'Coffee cures all diseases',
        'Doctors recommend avoiding coffee entirely',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage links moderate consumption to health benefits while noting that excess is harmful.',
      difficulty: Difficulty.easy,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 23
    ExerciseModel(
      id: 'daily_23',
      question: 'The film was _____ boring that half the audience left before the end.',
      answers: ['such', 'so', 'too', 'very'],
      correctAnswerIndex: 1,
      explanation:
          '"So + adjective + that" expresses result. "So boring that half the audience left."',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 24
    ExerciseModel(
      id: 'daily_24',
      question: 'What is the main argument of this passage about working from home?',
      passage:
          'While remote work offers undeniable flexibility, a growing number of companies are calling '
          'employees back to the office. Executives argue that spontaneous face-to-face interactions '
          'drive innovation in ways that virtual meetings simply cannot replicate. However, employee '
          'surveys consistently show that most workers prefer a hybrid model — splitting their week '
          'between home and office. The challenge for organisations is finding a balance that satisfies '
          'both productivity goals and employee well-being.',
      answers: [
        'Remote work should be permanently abolished',
        'Everyone prefers working from home full-time',
        'Finding a balance between remote and office work is the key challenge',
        'Virtual meetings are superior to face-to-face interactions',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage concludes that "finding a balance that satisfies both productivity goals and employee well-being" is the challenge.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 25
    ExerciseModel(
      id: 'daily_25',
      question: 'He denied _____ involved in the incident.',
      answers: ['to be', 'being', 'be', 'was'],
      correctAnswerIndex: 1,
      explanation:
          '"Deny" is followed by a gerund (-ing form). "Denied being involved" is the correct pattern.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 26
    ExerciseModel(
      id: 'daily_26',
      question: 'What point does the author make about fast fashion?',
      passage:
          'The fast fashion industry produces roughly 100 billion garments per year, yet an estimated '
          '73% of these end up in landfill or are incinerated. The environmental toll is staggering: '
          'textile production accounts for 10% of global carbon emissions, more than international '
          'flights and maritime shipping combined. Consumer awareness is growing, but meaningful change '
          'requires systemic reform, not just individual shopping choices.',
      answers: [
        'Fast fashion is sustainable and eco-friendly',
        'Individual choices alone can solve the fast fashion problem',
        'Fast fashion has a massive environmental impact requiring systemic change',
        'The fashion industry produces too few garments',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage highlights the enormous environmental impact and argues that "systemic reform" is needed.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 27
    ExerciseModel(
      id: 'daily_27',
      question: 'It\'s high time we _____ something about climate change.',
      answers: ['do', 'did', 'have done', 'will do'],
      correctAnswerIndex: 1,
      explanation:
          '"It\'s high time" is followed by the past simple to express that something should have happened already.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 28
    ExerciseModel(
      id: 'daily_28',
      question: 'Rewrite: "The last time I went abroad was in 2019."\nI _____ abroad since 2019.',
      answers: [
        'didn\'t go',
        'haven\'t been',
        'wasn\'t going',
        'don\'t go',
      ],
      correctAnswerIndex: 1,
      explanation:
          '"Haven\'t been ... since" is the present perfect structure for duration from a past point to now.',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 29
    ExerciseModel(
      id: 'daily_29',
      question: 'Rewrite: "I regret not learning a musical instrument."\nI wish I _____',
      answers: [
        'had learned a musical instrument',
        'learned a musical instrument',
        'would learn a musical instrument',
        'have learned a musical instrument',
      ],
      correctAnswerIndex: 0,
      explanation:
          '"Wish + past perfect" expresses regret about the past: "I wish I had learned."',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    // Day 30
    ExerciseModel(
      id: 'daily_30',
      question: 'What does the passage suggest about bilingualism?',
      passage:
          'Research consistently shows that bilingual individuals enjoy cognitive advantages that extend '
          'well beyond language skills. They tend to be better at multitasking, problem-solving, and '
          'filtering irrelevant information. Perhaps most remarkably, studies indicate that bilingualism '
          'can delay the onset of dementia by up to five years. These findings have prompted many countries '
          'to introduce second-language instruction at primary school level.',
      answers: [
        'Bilingualism has no proven benefits',
        'Bilingualism offers significant cognitive advantages',
        'Learning two languages causes confusion',
        'Only adults benefit from knowing two languages',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage details multiple cognitive advantages of bilingualism including delayed dementia onset.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    // Day 31
    ExerciseModel(
      id: 'daily_31',
      question: 'Only after reading the contract carefully _____ the hidden clause.',
      answers: ['she noticed', 'did she notice', 'she did notice', 'noticed she'],
      correctAnswerIndex: 1,
      explanation:
          '"Only after" at the start triggers subject-auxiliary inversion in the main clause: "did she notice."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
  ];

  static ExerciseModel getForDay(int dayOfYear) {
    return tasks[dayOfYear % 31];
  }
}
