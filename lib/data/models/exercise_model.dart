enum ExerciseType {
  multipleChoice,
  gapFill,
  sentenceTransformation,
  readingComprehension,
  listeningComprehension,
  writingPrompt,
}

enum ExerciseCategory {
  reading,
  useOfEnglish,
  listening,
  writing,
}

enum Difficulty { easy, medium, hard }

class ExerciseModel {
  final String id;
  final String question;
  final String? passage;
  final String? audioFile;
  final List<String> answers;
  final int correctAnswerIndex;
  final String explanation;
  final Difficulty difficulty;
  final ExerciseType type;
  final ExerciseCategory category;
  final Map<String, dynamic>? metadata;

  const ExerciseModel({
    required this.id,
    required this.question,
    this.passage,
    this.audioFile,
    required this.answers,
    required this.correctAnswerIndex,
    required this.explanation,
    required this.difficulty,
    required this.type,
    required this.category,
    this.metadata,
  });

  String get correctAnswer => answers[correctAnswerIndex];

  Map<String, dynamic> toMap() => {
        'id': id,
        'question': question,
        'passage': passage,
        'answers': answers,
        'correctAnswerIndex': correctAnswerIndex,
        'explanation': explanation,
        'difficulty': difficulty.name,
        'type': type.name,
        'category': category.name,
        'metadata': metadata,
      };

  factory ExerciseModel.fromMap(Map<String, dynamic> map) => ExerciseModel(
        id: map['id'] as String,
        question: map['question'] as String,
        passage: map['passage'] as String?,
        answers: List<String>.from(map['answers'] as List),
        correctAnswerIndex: map['correctAnswerIndex'] as int,
        explanation: map['explanation'] as String,
        difficulty: Difficulty.values.byName(map['difficulty'] as String),
        type: ExerciseType.values.byName(map['type'] as String),
        category: ExerciseCategory.values.byName(map['category'] as String),
        metadata: map['metadata'] as Map<String, dynamic>?,
      );
}

class WritingPromptModel {
  final String id;
  final String prompt;
  final String sampleAnswer;
  final List<String> evaluationChecklist;
  final Difficulty difficulty;

  const WritingPromptModel({
    required this.id,
    required this.prompt,
    required this.sampleAnswer,
    required this.evaluationChecklist,
    required this.difficulty,
  });
}

