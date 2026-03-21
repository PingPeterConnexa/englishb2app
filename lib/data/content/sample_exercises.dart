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
    ExerciseModel(
      id: 'r5',
      question: 'According to the passage, what is the main advantage of second-hand fashion?',
      passage:
          'The second-hand clothing market has exploded in popularity, driven largely by '
          'younger consumers who are environmentally conscious. Platforms like Vinted and Depop '
          'have made it effortless to buy and sell pre-owned garments. Beyond the obvious financial '
          'savings, the greatest appeal lies in the environmental impact: extending the life of '
          'a single garment by just nine months can reduce its carbon footprint by up to 30%. '
          'Fashion brands are beginning to take notice, with several luxury houses launching '
          'their own resale programmes.',
      answers: [
        'It allows people to buy luxury items at full price',
        'It significantly reduces the environmental footprint of clothing',
        'It forces fashion brands to lower their prices',
        'It is only popular among older consumers',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage states the "greatest appeal lies in the environmental impact," specifically reducing carbon footprint by up to 30%.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r6',
      question: 'What is the writer\'s main purpose in this passage?',
      passage:
          'Sleep deprivation among teenagers has reached alarming levels, according to a report '
          'published by the World Health Organisation. The study found that 70% of adolescents in '
          'developed countries get less than the recommended eight hours of sleep on school nights. '
          'Experts point to a combination of early school start times, excessive screen use, and '
          'growing academic pressure. The consequences are far-reaching: poor concentration, weakened '
          'immune systems, and a higher risk of anxiety and depression. Several school districts in '
          'the US have responded by pushing start times to 8:30 a.m. or later, with promising results.',
      answers: [
        'To argue that schools should be abolished',
        'To highlight the problem of teen sleep deprivation and its consequences',
        'To advertise a new sleep product for teenagers',
        'To criticise parents for not monitoring bedtimes',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage presents data on teen sleep deprivation, identifies causes, describes consequences, and mentions responses — all focused on highlighting the problem.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r7',
      question: 'What does the phrase "a double-edged sword" imply about social media in this context?',
      passage:
          'Social media has proved to be a double-edged sword for small businesses. On one hand, '
          'platforms like Instagram and TikTok offer free marketing tools that can reach millions '
          'of potential customers overnight. Success stories abound of tiny start-ups going viral '
          'and transforming into thriving enterprises. On the other hand, the constant pressure to '
          'produce engaging content can overwhelm small teams, and a single negative review can '
          'spread just as quickly as positive publicity, potentially damaging a brand\'s reputation '
          'beyond repair.',
      answers: [
        'Social media is too dangerous for businesses to use',
        'Social media has both significant benefits and serious risks',
        'Social media only helps large corporations',
        'Social media is the only way to market a business',
      ],
      correctAnswerIndex: 1,
      explanation:
          '"Double-edged sword" is an idiom meaning something that has both positive and negative effects. The passage then illustrates both sides.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r8',
      question: 'Why does the author mention the 1952 Great Smog of London?',
      passage:
          'Air pollution remains one of the most pressing public health challenges worldwide. '
          'While dramatic events such as the 1952 Great Smog of London, which killed an estimated '
          '12,000 people, led to groundbreaking clean-air legislation, modern pollution is often '
          'invisible and therefore harder to combat. Microscopic particles known as PM2.5 penetrate '
          'deep into the lungs and bloodstream, contributing to heart disease, stroke, and lung cancer. '
          'The WHO estimates that outdoor air pollution causes 4.2 million premature deaths annually — '
          'a figure that dwarfs many other global health threats.',
      answers: [
        'To show that pollution is a new problem',
        'To illustrate a historical event that prompted action, contrasting it with today\'s invisible threat',
        'To argue that London still has the worst air quality',
        'To suggest that legislation is unnecessary',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The Great Smog is used as a historical reference point that led to action, contrasting with modern "invisible" pollution that is harder to address.',
      difficulty: Difficulty.hard,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r9',
      question: 'According to the passage, what has research shown about bilingual children?',
      passage:
          'Growing up bilingual was once thought to confuse children and delay their language '
          'development. However, decades of research have overturned this belief. Studies conducted '
          'at McGill University and the University of Edinburgh have demonstrated that bilingual '
          'children outperform their monolingual peers in tasks requiring problem-solving, '
          'multi-tasking, and creative thinking. The constant mental exercise of switching between '
          'two language systems appears to strengthen executive function — the brain\'s ability to '
          'plan, focus attention, and filter distractions.',
      answers: [
        'They struggle more with academic subjects',
        'They develop language skills more slowly than monolingual children',
        'They show advantages in problem-solving and cognitive flexibility',
        'They prefer one language over the other by age five',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage states bilingual children "outperform their monolingual peers in tasks requiring problem-solving, multi-tasking, and creative thinking."',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r10',
      question: 'What is the main concern expressed about artificial intelligence in the passage?',
      passage:
          'Artificial intelligence is transforming industries at an unprecedented pace, from healthcare '
          'diagnostics to financial trading. While proponents celebrate its potential to eliminate human '
          'error and boost productivity, critics warn of a more troubling consequence: the erosion of '
          'accountability. When an AI system makes a flawed medical diagnosis or a self-driving car '
          'causes an accident, determining who bears responsibility becomes extraordinarily complicated. '
          'Current legal frameworks were not designed for a world in which decisions are made by '
          'algorithms rather than people.',
      answers: [
        'AI will eliminate all jobs within a decade',
        'AI is too expensive for most companies',
        'The difficulty of assigning responsibility when AI makes mistakes',
        'AI only benefits the healthcare industry',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage focuses on "the erosion of accountability" and the challenge of "determining who bears responsibility" when AI systems make errors.',
      difficulty: Difficulty.hard,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r11',
      question: 'What can be inferred about the future of libraries from this passage?',
      passage:
          'Contrary to predictions of their demise, public libraries are experiencing a renaissance. '
          'Forward-thinking librarians have reimagined these spaces as community hubs offering far '
          'more than books. Modern libraries host coding workshops, provide 3D printing services, '
          'lend tools and musical instruments, and serve as co-working spaces for freelancers. '
          'In Helsinki, the Oodi library attracted 3.1 million visitors in its first year — more '
          'than the city\'s entire population. The key to survival, it seems, has been embracing '
          'adaptability rather than clinging to tradition.',
      answers: [
        'Libraries will close within the next few years',
        'Libraries are thriving by reinventing themselves as versatile community spaces',
        'Libraries should focus exclusively on lending books',
        'Only Finnish libraries have managed to stay relevant',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The passage describes libraries as "experiencing a renaissance" by becoming "community hubs" and emphasises "adaptability" as the key.',
      difficulty: Difficulty.medium,
      type: ExerciseType.readingComprehension,
      category: ExerciseCategory.reading,
    ),
    ExerciseModel(
      id: 'r12',
      question: 'What does the passage suggest about the relationship between music and memory?',
      passage:
          'Neurologists have long observed that patients with advanced dementia who can barely '
          'recognise their own families will suddenly come alive when they hear a song from their '
          'youth. Brain imaging studies reveal that music activates multiple areas simultaneously — '
          'including those responsible for emotion, memory, and motor function — creating a network '
          'of connections that proves remarkably resilient to cognitive decline. This discovery has '
          'led to the development of personalised music therapy programmes in care homes across '
          'Europe, with staff reporting noticeable improvements in mood and engagement.',
      answers: [
        'Music has no effect on people with dementia',
        'Only classical music can improve memory',
        'Music creates brain connections that resist cognitive decline',
        'Music therapy has been proven ineffective in care homes',
      ],
      correctAnswerIndex: 2,
      explanation:
          'The passage explains that music creates "a network of connections that proves remarkably resilient to cognitive decline."',
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
    ExerciseModel(
      id: 'ue9',
      question: 'The manager insisted _____ seeing all the documents before signing.',
      answers: ['on', 'for', 'to', 'about'],
      correctAnswerIndex: 0,
      explanation:
          '"Insist on + gerund" is the correct collocation. "Insist on seeing" means to demand firmly.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue10',
      question: 'Not until the film ended _____ how late it was.',
      answers: ['I realised', 'did I realise', 'I did realise', 'realised I'],
      correctAnswerIndex: 1,
      explanation:
          '"Not until" at the start of a sentence triggers subject-auxiliary inversion: "did I realise."',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue11',
      question: 'By this time next year, she _____ her degree.',
      answers: ['will finish', 'will have finished', 'finishes', 'is finishing'],
      correctAnswerIndex: 1,
      explanation:
          '"By this time next year" signals a completed future action, requiring the future perfect: "will have finished."',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue12',
      question: 'He apologised _____ arriving late to the meeting.',
      answers: ['about', 'for', 'of', 'to'],
      correctAnswerIndex: 1,
      explanation:
          '"Apologise for + gerund" is the fixed collocation. "He apologised for arriving late."',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue13',
      question: 'Rewrite: "I regret not studying harder at school."\nI wish I _____',
      answers: [
        'studied harder at school',
        'had studied harder at school',
        'have studied harder at school',
        'would study harder at school',
      ],
      correctAnswerIndex: 1,
      explanation:
          '"Wish + past perfect" is used for regrets about the past. "I wish I had studied" expresses this.',
      difficulty: Difficulty.hard,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue14',
      question: 'The children were warned not to _____ with strangers.',
      answers: ['get on', 'put up', 'go along', 'get into conversation'],
      correctAnswerIndex: 3,
      explanation:
          '"Get into conversation with" means to begin talking to someone. The other phrasal verbs do not fit the context.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue15',
      question: 'It\'s high time the government _____ action on climate change.',
      answers: ['takes', 'took', 'has taken', 'will take'],
      correctAnswerIndex: 1,
      explanation:
          '"It\'s high time + past simple" is a fixed structure expressing that something should have happened already.',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue16',
      question: 'She _____ have left already — her coat is still here.',
      answers: ['must', 'can\'t', 'should', 'might'],
      correctAnswerIndex: 1,
      explanation:
          '"Can\'t have + past participle" expresses a strong deduction that something is impossible. Her coat being there is evidence she hasn\'t left.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue17',
      question: 'Rewrite: "People say the castle is haunted."\nThe castle _____',
      answers: [
        'is said to be haunted',
        'says to be haunted',
        'is saying to be haunted',
        'said to be haunted',
      ],
      correctAnswerIndex: 0,
      explanation:
          'The impersonal passive structure "is said to be" is used to report what people generally believe.',
      difficulty: Difficulty.medium,
      type: ExerciseType.sentenceTransformation,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue18',
      question: 'I\'d rather you _____ me the truth yesterday.',
      answers: ['told', 'had told', 'tell', 'would tell'],
      correctAnswerIndex: 1,
      explanation:
          '"I\'d rather + subject + past perfect" is used to express a preference about a past action that didn\'t happen.',
      difficulty: Difficulty.hard,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue19',
      question: 'The report needs _____ before the deadline on Friday.',
      answers: ['to finish', 'finishing', 'to be finished', 'being finished'],
      correctAnswerIndex: 2,
      explanation:
          '"Needs to be finished" is the passive form. While "needs finishing" is also grammatical, "needs to be finished" is the clearest passive construction here.',
      difficulty: Difficulty.medium,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
    ExerciseModel(
      id: 'ue20',
      question: 'There\'s no point _____ about things you can\'t change.',
      answers: ['to worry', 'worrying', 'worry', 'to be worried'],
      correctAnswerIndex: 1,
      explanation:
          '"There\'s no point + gerund" is a fixed expression meaning it is useless to do something.',
      difficulty: Difficulty.easy,
      type: ExerciseType.gapFill,
      category: ExerciseCategory.useOfEnglish,
    ),
  ];

  static const List<ExerciseModel> listeningExercises = [
    ExerciseModel(
      id: 'l1',
      question:
          'You hear a manager leaving a voicemail for her team. What does she want them to do?',
      passage:
          '[Audio Transcript]\nHi everyone, it\'s Sarah. I\'m calling to let you know that '
          'Wednesday\'s meeting has been moved to Thursday at two o\'clock. Half the team is still '
          'working on the quarterly report and won\'t have the figures ready in time. Please make '
          'sure you\'ve updated your sections by Thursday morning so we can go through everything '
          'together. Also, we\'ll be using the larger conference room on the third floor. Thanks.',
      audioFile: 'assets/audio/l1.mp3',
      answers: [
        'Cancel the project entirely',
        'Prepare their report sections for a rescheduled meeting',
        'Work overtime on Wednesday',
        'Send their figures by email instead',
      ],
      correctAnswerIndex: 1,
      explanation:
          'Sarah asks the team to update their sections by Thursday morning for the rescheduled meeting.',
      difficulty: Difficulty.easy,
      type: ExerciseType.listeningComprehension,
      category: ExerciseCategory.listening,
    ),
    ExerciseModel(
      id: 'l2',
      question:
          'You hear a museum curator talking about a new exhibition. What surprised her most?',
      passage:
          '[Audio Transcript]\nWhen we opened the exhibition last month, we expected it to appeal '
          'mainly to art students and historians. But what has genuinely surprised me is the age range '
          'of our visitors. We\'ve had entire families coming through — grandparents with young children, '
          'teenagers taking photos for social media. The interactive displays seem to bridge generational '
          'gaps in a way we hadn\'t anticipated at all. It\'s been incredibly rewarding to see.',
      audioFile: 'assets/audio/l2.mp3',
      answers: [
        'The number of international visitors',
        'The wide range of age groups visiting the exhibition',
        'The negative reviews from critics',
        'The low attendance during weekdays',
      ],
      correctAnswerIndex: 1,
      explanation:
          'The curator says "what has genuinely surprised me is the age range of our visitors," noting families spanning generations.',
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
          'I\'m calling because I\'ve had a look at the essay guidelines and I\'m a bit confused about '
          'the referencing format. The handbook says we should use APA, but the assignment sheet mentions '
          'Harvard style. Could you let me know which one we should follow? I want to make sure I get '
          'it right before the deadline next Friday. Thanks very much.',
      audioFile: 'assets/audio/l3.mp3',
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
