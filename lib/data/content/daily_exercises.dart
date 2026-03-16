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
      question: 'You hear a conversation at a train station. What problem does the woman have?',
      passage:
          '[Audio Transcript]\nWoman: Excuse me, I bought a return ticket online, but the app only '
          'shows a single journey. I definitely paid for both.\n'
          'Man: Let me check. Yes, I can see the return was charged. It looks like a display error. '
          'I\'ll print a confirmation for you.\nWoman: That\'s a relief, thank you.',
      answers: [
        'She lost her ticket',
        'Her return ticket is not showing in the app',
        'She missed her train',
        'She was charged twice',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The woman says "the app only shows a single journey" even though she paid for a return ticket.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You hear a podcast about sleep. What does the expert recommend?',
      passage:
          '[Audio Transcript]\nHost: So what\'s your top tip for better sleep?\n'
          'Expert: Consistency. Go to bed and wake up at the same time every day, even on weekends. '
          'Your body clock needs regularity. Screen time before bed is harmful, but the single most '
          'impactful change is a fixed schedule.',
      answers: [
        'Avoiding all screens permanently',
        'Sleeping at least ten hours a night',
        'Maintaining a consistent sleep schedule',
        'Taking sleeping pills regularly',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The expert says "the single most impactful change is a fixed schedule" and emphasises consistency.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You overhear two friends. Why is Tom upset?',
      passage:
          '[Audio Transcript]\nAnna: What\'s wrong with Tom today?\n'
          'Ben: He applied for that promotion he\'s been wanting for months, and they gave it to '
          'someone who\'s only been with the company for six months.\n'
          'Anna: Oh no. I can understand why he\'d feel overlooked.',
      answers: [
        'He was fired from his job',
        'He didn\'t get the promotion he wanted',
        'He has too much work to do',
        'He doesn\'t like his new colleague',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Ben explains Tom applied for a promotion but "they gave it to someone" else.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You hear a tour guide. What is special about the building?',
      passage:
          '[Audio Transcript]\nGuide: This library was designed by a local architect in 1897 and is one '
          'of the few buildings in the city that survived the great fire of 1923. Notice the original '
          'stained-glass windows—they\'re over 125 years old and have never been replaced.',
      answers: [
        'It was built after the great fire',
        'It survived a major fire and retains original features',
        'It was recently renovated',
        'It is the newest building in the city',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The guide says it "survived the great fire of 1923" and still has the original stained-glass windows.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You hear a weather report. What should listeners prepare for?',
      passage:
          '[Audio Transcript]\nForecaster: A major storm system is moving in from the west and is '
          'expected to hit the region by Thursday evening. We\'re looking at heavy rainfall, strong '
          'winds of up to 80 kilometres per hour, and possible flooding in low-lying areas. Residents '
          'are advised to secure outdoor furniture and avoid unnecessary travel.',
      answers: [
        'A heat wave lasting several days',
        'Light rain and mild temperatures',
        'A severe storm with heavy rain and strong winds',
        'Snow and freezing temperatures',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The report warns of "heavy rainfall, strong winds of up to 80 km/h, and possible flooding."',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You hear a student talking to a librarian. What does the student need?',
      passage:
          '[Audio Transcript]\nStudent: Hi, I\'m working on my dissertation and I need access to the '
          'journal archives from before 2005. The online database only goes back to 2010.\n'
          'Librarian: Those older issues are stored in the basement. I can get you a visitor pass for '
          'the archive room.\nStudent: That would be perfect, thank you.',
      answers: [
        'A new library card',
        'Access to older journal archives',
        'Help with writing her dissertation',
        'A computer to browse the internet',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The student needs "journal archives from before 2005" that are not available online.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
      question: 'You hear a manager speaking to new employees. What is the key company rule?',
      passage:
          '[Audio Transcript]\nManager: Welcome aboard, everyone. There are a few things to cover, but '
          'the most important rule here is transparency. If you make a mistake, own it immediately. '
          'We\'d much rather fix a small problem early than discover a big one later. No one will be '
          'punished for honest errors—only for hiding them.',
      answers: [
        'Never make mistakes',
        'Always report mistakes immediately and honestly',
        'Work overtime every Friday',
        'Avoid speaking to senior management',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The manager says "If you make a mistake, own it immediately" and "No one will be punished for honest errors."',
      difficulty: Difficulty.medium,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
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
