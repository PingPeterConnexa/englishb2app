import '../models/exercise_model.dart';

class SampleExercises {
  SampleExercises._();

  static const List<ExerciseModel> readingExercises = [
    ExerciseModel(
      id: 'r1',
      question: 'According to the passage, what is the main reason urban gardens have become popular?',
      passage:
          'In recent years, urban gardens have sprung up across major cities worldwide. '
          'What began as a small movement among environmental enthusiasts has grown into a '
          'widespread phenomenon embraced by people of all backgrounds. The primary driving '
          'force behind this trend is the growing desire among city dwellers to reconnect '
          'with nature and take control of their food sources. Studies show that participants '
          'in urban gardening programs report improved mental health, stronger community bonds, '
          'and a deeper understanding of sustainable living practices.',
      answers: [
        'Environmental regulations require them',
        'City dwellers want to reconnect with nature and control their food',
        'Property values increase near gardens',
        'Schools require gardening as part of their curriculum',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage states "The primary driving force behind this trend is the growing desire among city dwellers to reconnect with nature and take control of their food sources."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r2',
      question: 'What does the author suggest about remote work in the passage?',
      passage:
          'The shift to remote work has fundamentally altered how professionals view their careers. '
          'While the flexibility to work from anywhere initially seemed like a dream come true, '
          'many employees have discovered unexpected challenges. The blurring of boundaries between '
          'work and personal life has led to longer working hours for some, while others struggle '
          'with feelings of isolation. Nevertheless, most surveys indicate that a majority of '
          'workers prefer a hybrid model that combines the benefits of both office and remote settings.',
      answers: [
        'It has been entirely positive for all workers',
        'It should be completely abolished',
        'It offers flexibility but comes with unexpected challenges',
        'It only benefits employers, not employees',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage presents a balanced view, noting that remote work "initially seemed like a dream" but workers "discovered unexpected challenges."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r3',
      question: 'Which statement best summarises the passage about digital literacy?',
      passage:
          'Digital literacy has become as essential as traditional reading and writing skills. '
          'In an era where information flows freely through countless channels, the ability to '
          'critically evaluate online content separates informed citizens from those vulnerable '
          'to misinformation. Educational institutions worldwide are beginning to incorporate '
          'digital literacy programs into their core curricula, recognising that students must '
          'learn not only how to access information but also how to verify its accuracy and '
          'understand its potential biases.',
      answers: [
        'Technology is replacing traditional education',
        'Digital literacy is a crucial modern skill that schools are starting to teach',
        'Students prefer digital learning over traditional methods',
        'Misinformation is impossible to combat',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage emphasizes that digital literacy is essential and that educational institutions are incorporating it into curricula.',
      difficulty: Difficulty.easy,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r4',
      question: 'What can be inferred about the elderly volunteers from the passage?',
      passage:
          'A remarkable programme in Helsinki pairs elderly volunteers with primary school '
          'children for weekly reading sessions. The volunteers, many of whom are retired '
          'teachers and professionals, bring decades of experience and warmth to these encounters. '
          'Research conducted over three years found that children in the programme showed a '
          '23% improvement in reading fluency compared to their peers. Perhaps more significantly, '
          'the elderly participants reported feeling a renewed sense of purpose and decreased '
          'feelings of loneliness.',
      answers: [
        'They are required to participate by local law',
        'They only include former teachers',
        'They benefit emotionally from the programme as much as the children benefit academically',
        'They are paid for their services',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage mentions "renewed sense of purpose and decreased feelings of loneliness" for volunteers alongside academic benefits for children, suggesting mutual benefit.',
      difficulty: Difficulty.hard,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
  ];

  static const List<ExerciseModel> useOfEnglishExercises = [
    ExerciseModel(
      id: 'ue1',
      question: 'She _____ to the gym three times a week for the past two years.',
      answers: ['has been going', 'goes', 'is going', 'went'],
      correctAnswerIndex: 0,
      explanation:
          '"Has been going" is the present perfect continuous, used for actions that started in the past and continue to the present, especially with "for" + duration.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue2',
      question: 'If I _____ about the meeting earlier, I would have attended.',
      answers: ['knew', 'had known', 'have known', 'would know'],
      correctAnswerIndex: 1,
      explanation:
          'This is a third conditional sentence expressing a hypothetical past situation. The structure requires "had + past participle" in the if-clause.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue3',
      question: 'The project was so complex that nobody could work it _____.',
      answers: ['out', 'up', 'off', 'through'],
      correctAnswerIndex: 0,
      explanation:
          '"Work out" means to solve or figure out something. It is the correct phrasal verb for solving a complex problem.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue4',
      question:
          'Rewrite the sentence: "People believe the company will expand next year."\nThe company _____',
      answers: [
        'is believed to expand next year',
        'is believed expanding next year',
        'believes to expand next year',
        'believed to be expanding next year',
      ],
      correctAnswerIndex: 0,
      explanation:
          'When transforming an active sentence with "people believe" to passive, we use "is believed to + infinitive."',
      difficulty: Difficulty.hard,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue5',
      question: 'Despite _____ hard all semester, she found the exam extremely difficult.',
      answers: ['studying', 'to study', 'studied', 'having studied'],
      correctAnswerIndex: 3,
      explanation:
          '"Having studied" (perfect gerund) is used after "despite" to emphasize that the studying was completed before the exam.',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue6',
      question: 'I wish I _____ more time to finish the assignment.',
      answers: ['have', 'had', 'would have', 'am having'],
      correctAnswerIndex: 1,
      explanation:
          'After "wish" referring to a present situation we want to be different, we use the past simple.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue7',
      question: 'She spoke _____ quickly that nobody could follow her presentation.',
      answers: ['too', 'so', 'such', 'enough'],
      correctAnswerIndex: 1,
      explanation:
          '"So + adjective/adverb + that" is the correct structure here. "So quickly that…" expresses result.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue8',
      question:
          'Rewrite: "It\'s not necessary for you to come early."\nYou _____ come early.',
      answers: [
        'don\'t have to',
        'mustn\'t',
        'shouldn\'t',
        'can\'t',
      ],
      correctAnswerIndex: 0,
      explanation:
          '"Don\'t have to" expresses lack of obligation/necessity, matching "it\'s not necessary." "Mustn\'t" would mean prohibition.',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
  ];

  static const List<ExerciseModel> listeningExercises = [
    ExerciseModel(
      id: 'l1',
      question:
          'You hear two colleagues discussing a meeting. What does the woman suggest?',
      passage:
          '[Audio Transcript]\nWoman: I think we should postpone the meeting until Thursday. '
          'Half the team is still working on the quarterly report and won\'t have their figures ready.\n'
          'Man: That\'s a fair point. Should we notify everyone by email?\n'
          'Woman: Yes, and let\'s book the larger conference room while we\'re at it.',
      answers: [
        'Cancelling the meeting entirely',
        'Postponing the meeting to Thursday',
        'Having the meeting without the report',
        'Asking the team to work faster',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The woman explicitly says "I think we should postpone the meeting until Thursday."',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'l2',
      question:
          'You hear a radio interview about a new museum exhibition. What surprised the curator most?',
      passage:
          '[Audio Transcript]\nInterviewer: So what has surprised you most about the public response?\n'
          'Curator: Honestly, the age range of our visitors. We expected mainly art students and historians, '
          'but we\'ve had entire families coming through—grandparents with young children. The interactive '
          'displays seem to bridge generational gaps in a way we hadn\'t anticipated.',
      answers: [
        'The number of international visitors',
        'The diversity of age groups visiting',
        'The negative reviews from critics',
        'The low attendance during weekdays',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The curator says "the age range of our visitors" surprised them most, noting families spanning generations.',
      difficulty: Difficulty.medium,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'l3',
      question:
          'You hear a student leaving a voicemail for her tutor. Why is she calling?',
      passage:
          '[Audio Transcript]\nHi Professor Clarke, this is Emma from your Wednesday seminar group. '
          'I\'m calling because I\'ve had a look at the essay guidelines and I\'m confused about the '
          'referencing format. The handbook says APA but the assignment sheet mentions Harvard style. '
          'Could you let me know which one we should follow? I want to make sure I get it right before '
          'the deadline next Friday. Thanks!',
      answers: [
        'To request an extension on her essay',
        'To clarify which referencing format to use',
        'To complain about the assignment difficulty',
        'To cancel her attendance at the seminar',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Emma says she is "confused about the referencing format" and asks "which one we should follow."',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
  ];

  static const List<WritingPromptModel> writingPrompts = [
    WritingPromptModel(
      id: 'w1',
      prompt:
          'Your English teacher has asked you to write an essay on the following topic:\n\n'
          '"Technology has made our lives easier, but it has also created new problems."\n\n'
          'Write an essay of 140–190 words discussing both sides of this argument and give your own opinion.',
      sampleAnswer:
          'Technology has transformed nearly every aspect of modern life, bringing both remarkable '
          'benefits and unexpected challenges.\n\n'
          'On the one hand, technological advances have streamlined daily tasks that once consumed hours. '
          'Communication across continents happens instantly, medical treatments have become more effective, '
          'and access to information is virtually unlimited. These improvements have undeniably enhanced our '
          'quality of life.\n\n'
          'On the other hand, our dependence on technology has introduced serious concerns. Social media, '
          'for instance, has been linked to increased anxiety among young people. Furthermore, automation '
          'threatens traditional employment, and privacy has become increasingly difficult to maintain in '
          'the digital age.\n\n'
          'In my opinion, while the challenges are significant, the benefits of technology outweigh the '
          'drawbacks, provided we develop thoughtful regulations and maintain a healthy balance between our '
          'digital and real-world lives.',
      evaluationChecklist: [
        'Clear introduction that addresses the topic',
        'Arguments presented for both sides',
        'Appropriate linking words and cohesive devices',
        'Personal opinion clearly stated',
        'Appropriate range of vocabulary for B2 level',
        'Correct use of grammar structures',
        'Appropriate length (140–190 words)',
        'Clear paragraph structure',
      ],
      difficulty: Difficulty.medium,
    ),
    WritingPromptModel(
      id: 'w2',
      prompt:
          'You have recently visited a new restaurant in your town. Write a review for your school '
          'magazine of 140–190 words. Include:\n\n'
          '• A description of the restaurant and its atmosphere\n'
          '• What you ate and your opinion of the food\n'
          '• Whether you would recommend it to others',
      sampleAnswer:
          'Last Saturday, I visited The Green Table, a newly opened vegetarian restaurant on Park '
          'Street, and I was pleasantly surprised by the experience.\n\n'
          'The restaurant has a warm, inviting atmosphere with exposed brick walls, soft lighting, '
          'and small wooden tables that create an intimate dining experience. The staff were friendly '
          'and attentive without being intrusive.\n\n'
          'I ordered the mushroom risotto as my main course, which was absolutely delicious—creamy, '
          'well-seasoned, and beautifully presented. For dessert, the chocolate avocado mousse was '
          'unexpectedly wonderful, proving that healthy alternatives can be just as satisfying.\n\n'
          'The prices are reasonable for the quality of food and service provided. I would highly '
          'recommend The Green Table to anyone looking for a memorable meal, whether or not they '
          'are vegetarian. It has certainly earned a regular spot in my dining routine.',
      evaluationChecklist: [
        'Review format with clear structure',
        'Descriptive language for the atmosphere',
        'Specific details about the food',
        'Personal opinion and recommendation included',
        'Appropriate vocabulary range',
        'Varied sentence structures',
        'Appropriate length (140–190 words)',
        'Engaging and informative tone',
      ],
      difficulty: Difficulty.medium,
    ),
  ];

  static const List<SpeakingPromptModel> speakingPrompts = [
    SpeakingPromptModel(
      id: 's1',
      topic: 'Travel and Cultural Experiences',
      questions: [
        'Describe a memorable trip you have taken. Where did you go and what made it special?',
        'Do you think travelling is the best way to learn about other cultures? Why or why not?',
        'How has tourism changed in recent years, and what effects has this had?',
      ],
      suggestedDurationSeconds: 120,
      difficulty: Difficulty.medium,
    ),
    SpeakingPromptModel(
      id: 's2',
      topic: 'Education and Learning',
      questions: [
        'What do you think is the most important subject taught in schools today? Why?',
        'How do you think education will change in the next twenty years?',
        'Do you agree that learning should be fun, or is discipline more important?',
      ],
      suggestedDurationSeconds: 120,
      difficulty: Difficulty.medium,
    ),
    SpeakingPromptModel(
      id: 's3',
      topic: 'Health and Lifestyle',
      questions: [
        'What do you do to stay healthy in your daily life?',
        'Some people say that mental health is just as important as physical health. Do you agree?',
        'How has the way people think about health changed in your lifetime?',
      ],
      suggestedDurationSeconds: 120,
      difficulty: Difficulty.easy,
    ),
  ];

  static List<ExerciseModel> getAllExercises() => [
        ...readingExercises,
        ...useOfEnglishExercises,
        ...listeningExercises,
      ];

  static List<ExerciseModel> getByCategory(ExerciseCategory category) {
    switch (category) {
      case ExerciseCategory.reading:
        return readingExercises;
      case ExerciseCategory.useOfEnglish:
        return useOfEnglishExercises;
      case ExerciseCategory.listening:
        return listeningExercises;
      case ExerciseCategory.writing:
        return [];
      case ExerciseCategory.speaking:
        return [];
    }
  }
}
