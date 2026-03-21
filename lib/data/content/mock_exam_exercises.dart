import '../models/exercise_model.dart';

class MockExamExercises {
  MockExamExercises._();

  static const List<ExerciseModel> readingExercises = [
    ExerciseModel(
      id: 'exam_r1',
      question: 'What is the author\'s attitude towards space tourism in the passage?',
      passage:
          'Space tourism, once confined to science fiction, is rapidly becoming a commercial reality. '
          'Companies like SpaceX and Blue Origin have already sent private citizens beyond the '
          'atmosphere, and tickets for sub-orbital flights are being sold for the price of a luxury '
          'house. Critics argue that this is an extravagant waste of resources while the planet faces '
          'climate change, poverty, and inequality. However, supporters counter that the technology '
          'developed for space tourism often finds applications in everyday life, and that pushing '
          'the boundaries of human exploration has always driven innovation.',
      answers: [
        'Entirely supportive without reservations',
        'Completely opposed to the idea',
        'Balanced, presenting both criticisms and potential benefits',
        'Indifferent to the topic',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The author presents both "critics argue" and "supporters counter," showing a balanced perspective on space tourism.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'exam_r2',
      question: 'According to the passage, why are microplastics particularly dangerous?',
      passage:
          'Microplastics — tiny fragments less than five millimetres in size — have been found '
          'in the most remote corners of the Earth, from Arctic ice cores to the deepest ocean '
          'trenches. What makes them particularly insidious is their ability to absorb toxic '
          'chemicals from the surrounding environment, effectively concentrating pollutants. When '
          'marine organisms ingest these contaminated particles, the toxins accumulate up the food '
          'chain, ultimately reaching human plates. A recent study estimated that the average person '
          'consumes approximately five grams of plastic per week — roughly the weight of a credit card.',
      answers: [
        'They are only found in oceans',
        'They absorb and concentrate toxic chemicals that enter the food chain',
        'They are too small to be detected by scientists',
        'They only affect marine life, not humans',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage explains microplastics are "insidious" because of "their ability to absorb toxic chemicals" which then "accumulate up the food chain."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'exam_r3',
      question: 'What is the main argument presented in favour of a four-day work week?',
      passage:
          'Iceland\'s landmark trial of a four-day work week, involving over 2,500 workers between '
          '2015 and 2019, has been hailed as an "overwhelming success." Participants worked 35 or 36 '
          'hours instead of 40, with no reduction in pay. The results were striking: productivity either '
          'remained the same or improved in the majority of workplaces. Workers reported significantly '
          'lower stress levels, reduced burnout, and an improved work-life balance. Since the trial, '
          '86% of Iceland\'s workforce has either moved to shorter hours or gained the right to negotiate '
          'them. Similar experiments in Spain, Japan, and New Zealand have yielded comparable results.',
      answers: [
        'Companies can pay workers less',
        'Workers are less productive but happier',
        'Productivity stays the same or improves while worker well-being increases',
        'It only works in Scandinavian countries',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage states "productivity either remained the same or improved" while workers reported "lower stress" and "improved work-life balance."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'exam_r4',
      question: 'What does the writer imply about electric vehicles in developing countries?',
      passage:
          'The global push towards electric vehicles has gathered remarkable momentum in wealthy nations, '
          'where generous subsidies, expanding charging infrastructure, and falling battery prices have '
          'made the transition increasingly viable. However, the picture in developing countries remains '
          'starkly different. In many African and South Asian nations, unreliable electricity grids make '
          'charging impractical, and the upfront cost of EVs remains far beyond the reach of average '
          'consumers. Some experts argue that the current EV revolution risks creating a new kind of '
          'inequality — a green divide between those who can afford clean transport and those who cannot.',
      answers: [
        'EVs are equally accessible everywhere in the world',
        'Developing countries don\'t need electric vehicles',
        'The EV transition may widen inequality between rich and poor nations',
        'Battery prices are the only obstacle to EV adoption',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage warns of "a green divide between those who can afford clean transport and those who cannot," implying widening inequality.',
      difficulty: Difficulty.hard,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'exam_r5',
      question: 'What does the passage reveal about the Mediterranean diet?',
      passage:
          'For decades, nutritionists have championed the Mediterranean diet as one of the healthiest '
          'in the world. Rich in olive oil, fresh vegetables, legumes, fish, and whole grains, it has '
          'been associated with lower rates of heart disease, diabetes, and certain cancers. Yet a recent '
          'study published in The Lancet suggests that the benefits may be as much about lifestyle as food. '
          'Mediterranean communities traditionally eat slowly, share meals with family, walk regularly, and '
          'enjoy afternoon rest. Researchers now believe that these social and behavioural habits contribute '
          'to longevity just as much as the food itself.',
      answers: [
        'The Mediterranean diet has been proven unhealthy',
        'Only the food, not the lifestyle, matters for health',
        'The health benefits may come from lifestyle habits as much as the food',
        'Olive oil is the single most important health factor',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage states "the benefits may be as much about lifestyle as food" and that "social and behavioural habits contribute to longevity just as much as the food itself."',
      difficulty: Difficulty.hard,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'exam_r6',
      question: 'What is the central idea of this passage about rewilding?',
      passage:
          'Rewilding — the large-scale restoration of ecosystems to their natural state — has gained '
          'significant traction in Europe. In the Netherlands, the Oostvaardersplassen nature reserve '
          'allows herds of deer, horses, and cattle to roam freely across reclaimed land. In Scotland, '
          'ambitious projects aim to reintroduce species like the Eurasian lynx and the European beaver. '
          'Proponents argue that rewilding not only restores biodiversity but also creates natural flood '
          'defences, sequesters carbon, and boosts rural tourism. However, farmers and landowners '
          'sometimes resist, fearing damage to livestock and loss of productive agricultural land.',
      answers: [
        'Rewilding is universally opposed by European communities',
        'Rewilding aims to restore ecosystems and offers multiple benefits despite some opposition',
        'Rewilding only works in the Netherlands',
        'Rewilding is solely focused on reintroducing predators',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage describes rewilding\'s goals and multiple benefits while acknowledging opposition from farmers, showing it offers multiple benefits despite resistance.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
  ];

  static const List<ExerciseModel> useOfEnglishExercises = [
    ExerciseModel(
      id: 'exam_ue1',
      question: 'Hardly _____ the house when it started pouring with rain.',
      answers: ['I had left', 'had I left', 'I left', 'did I leave'],
      correctAnswerIndex: 1,
      explanation:
          '"Hardly" at the start triggers subject-auxiliary inversion with past perfect: "Hardly had I left."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue2',
      question: 'She couldn\'t help _____ when she heard the joke.',
      answers: ['laughing', 'to laugh', 'laugh', 'to laughing'],
      correctAnswerIndex: 0,
      explanation:
          '"Can\'t help + gerund" is a fixed expression meaning to be unable to stop oneself from doing something.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue3',
      question: 'We _____ better leave now if we want to catch the last train.',
      answers: ['would', 'should', 'had', 'could'],
      correctAnswerIndex: 2,
      explanation:
          '"Had better + infinitive" expresses strong advice or a warning. "We had better leave now."',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue4',
      question: 'Rewrite: "The last time I saw her was in 2019."\nI _____ her since 2019.',
      answers: [
        'didn\'t see',
        'haven\'t seen',
        'don\'t see',
        'wasn\'t seeing',
      ],
      correctAnswerIndex: 1,
      explanation:
          '"Haven\'t seen ... since" is the present perfect structure for expressing duration from a past point to now.',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue5',
      question: 'The new software is supposed to do away _____ the need for manual data entry.',
      answers: ['from', 'with', 'for', 'of'],
      correctAnswerIndex: 1,
      explanation:
          '"Do away with" is a phrasal verb meaning to abolish or eliminate something.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue6',
      question: 'Were it not _____ your help, I would never have passed the exam.',
      answers: ['about', 'for', 'with', 'from'],
      correctAnswerIndex: 1,
      explanation:
          '"Were it not for" is a formal conditional structure meaning "if it had not been for."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue7',
      question: 'She has a tendency to put things _____ until the last minute.',
      answers: ['on', 'away', 'off', 'up'],
      correctAnswerIndex: 2,
      explanation:
          '"Put off" means to postpone or delay. "Put things off until the last minute" = to procrastinate.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue8',
      question: 'Rewrite: "I started learning French five years ago."\nI _____ French for five years.',
      answers: [
        'learn',
        'am learning',
        'have been learning',
        'had learned',
      ],
      correctAnswerIndex: 2,
      explanation:
          'Present perfect continuous "have been learning" expresses an action started in the past that continues to the present, with "for five years."',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue9',
      question: 'The professor, _____ research has been widely published, is giving a lecture tomorrow.',
      answers: ['who', 'whose', 'which', 'whom'],
      correctAnswerIndex: 1,
      explanation:
          '"Whose" is the possessive relative pronoun, referring to "the professor\'s research."',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue10',
      question: 'No sooner had the concert begun _____ the power went out.',
      answers: ['when', 'than', 'that', 'as'],
      correctAnswerIndex: 1,
      explanation:
          '"No sooner ... than" is a fixed correlative structure. "No sooner had X happened than Y happened."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue11',
      question: 'He denied _____ anything about the missing documents.',
      answers: ['to know', 'knowing', 'know', 'to knowing'],
      correctAnswerIndex: 1,
      explanation:
          '"Deny + gerund" is the correct pattern. "He denied knowing" means he said he did not know.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'exam_ue12',
      question: 'Rewrite: "They think the painting was stolen overnight."\nThe painting _____',
      answers: [
        'is thought to have been stolen overnight',
        'is thought to steal overnight',
        'thinks to have been stolen overnight',
        'was thought stealing overnight',
      ],
      correctAnswerIndex: 0,
      explanation:
          'Impersonal passive with perfect infinitive: "is thought to have been stolen" reports a belief about a past event.',
      difficulty: Difficulty.hard,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
  ];

  static const List<ExerciseModel> listeningExercises = [
    ExerciseModel(
      id: 'exam_l1',
      question:
          'You hear a news presenter reporting on a local event. What is the main purpose of the event?',
      passage:
          '[Audio Transcript]\nThis weekend, the city of Brighton will host its annual Sustainability '
          'Fair at the seafront pavilion. Over fifty local organisations will be showcasing eco-friendly '
          'products, from reusable household goods to organic food. There will also be free workshops on '
          'composting, energy saving, and reducing food waste. The event, now in its eighth year, is '
          'expected to attract over ten thousand visitors. Doors open at nine a.m. on Saturday and entry '
          'is completely free.',
      audioFile: 'assets/audio/exam_l1.mp3',
      answers: [
        'To celebrate the city\'s anniversary',
        'To promote sustainable living through products and workshops',
        'To raise money for a local charity',
        'To launch a new shopping centre',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The report describes organisations showcasing "eco-friendly products" and "free workshops on composting, energy saving, and reducing food waste."',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'exam_l2',
      question:
          'You hear a man talking about a documentary he watched. What impressed him most?',
      passage:
          '[Audio Transcript]\nI watched the most incredible documentary last night about the deep '
          'ocean. I always knew the ocean was deep, but actually seeing those creatures living at five '
          'thousand metres with absolutely no sunlight — it completely changed how I think about life '
          'on Earth. The filming technology was amazing too, but for me, it was those organisms that '
          'thrive in total darkness that really stood out. It makes you wonder what else is out there '
          'that we haven\'t discovered yet.',
      audioFile: 'assets/audio/exam_l2.mp3',
      answers: [
        'The filming technology used',
        'The depth of the ocean itself',
        'Creatures that survive without sunlight at extreme depths',
        'The presenter\'s narration style',
      ],
      correctAnswerIndex: 2,
      explanation:
          'He says "for me, it was those organisms that thrive in total darkness" — the creatures living without sunlight impressed him most.',
      difficulty: Difficulty.medium,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'exam_l3',
      question:
          'You hear a woman talking about her career change. What motivated her decision?',
      passage:
          '[Audio Transcript]\nI\'d been working in corporate finance for twelve years, and on paper '
          'everything looked perfect — good salary, bonuses, the whole package. But I\'d wake up every '
          'Monday with this sinking feeling in my stomach. Then one evening my daughter looked at me '
          'and said, "Mum, why are you always tired and sad?" And that was the moment everything '
          'clicked. I enrolled in a teacher training programme that very evening. Three years later, '
          'I\'m teaching maths at a secondary school, and I\'ve honestly never been happier.',
      audioFile: 'assets/audio/exam_l3.mp3',
      answers: [
        'She was made redundant from her finance job',
        'She wanted a higher salary',
        'Her daughter\'s observation made her realise she was unhappy',
        'She always dreamed of being a teacher since childhood',
      ],
      correctAnswerIndex: 2,
      explanation:
          'She says her daughter asked why she was "always tired and sad" and "that was the moment everything clicked," directly triggering her career change.',
      difficulty: Difficulty.medium,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'exam_l4',
      question:
          'You hear an announcement at a train station. What should passengers on the 14:20 to Manchester do?',
      passage:
          '[Audio Transcript]\nAttention please. We regret to inform passengers that the 14:20 service '
          'to Manchester Piccadilly has been cancelled due to a signal failure near Stoke-on-Trent. '
          'Passengers holding tickets for this service should board the 14:35 to Birmingham New Street, '
          'where a connecting service to Manchester will be available from Platform 6. We apologise for '
          'any inconvenience caused. Alternatively, you may claim a full refund at the ticket office.',
      audioFile: 'assets/audio/exam_l4.mp3',
      answers: [
        'Wait at the platform for a delayed service',
        'Take the 14:35 to Birmingham and connect from there',
        'Take a bus replacement service',
        'Contact the train company by phone',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The announcement says passengers "should board the 14:35 to Birmingham New Street, where a connecting service to Manchester will be available."',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
  ];

  static List<ExerciseModel> getAllExamExercises() => [
        ...readingExercises,
        ...useOfEnglishExercises,
        ...listeningExercises,
      ];
}
