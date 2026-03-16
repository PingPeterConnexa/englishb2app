class ProgressModel {
  final String userId;
  final double readingScore;
  final double listeningScore;
  final double grammarScore;
  final double writingScore;
  final double speakingScore;
  final int totalExercisesCompleted;
  final int totalCorrectAnswers;
  final int currentStreak;
  final int longestStreak;
  final DateTime lastPracticeDate;
  final Map<String, bool> completedExercises;
  final List<MockExamResult> mockExamResults;

  const ProgressModel({
    required this.userId,
    this.readingScore = 0,
    this.listeningScore = 0,
    this.grammarScore = 0,
    this.writingScore = 0,
    this.speakingScore = 0,
    this.totalExercisesCompleted = 0,
    this.totalCorrectAnswers = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    required this.lastPracticeDate,
    this.completedExercises = const {},
    this.mockExamResults = const [],
  });

  double get overallScore {
    final scores = [readingScore, listeningScore, grammarScore, writingScore];
    if (scores.every((s) => s == 0)) return 0;
    final nonZero = scores.where((s) => s > 0);
    return nonZero.isEmpty ? 0 : nonZero.reduce((a, b) => a + b) / nonZero.length;
  }

  double get examReadiness {
    final weights = {
      readingScore: 0.25,
      listeningScore: 0.25,
      grammarScore: 0.3,
      writingScore: 0.2,
    };
    double weighted = 0;
    weights.forEach((score, weight) {
      weighted += score * weight;
    });
    return weighted.clamp(0, 1);
  }

  double get accuracy {
    if (totalExercisesCompleted == 0) return 0;
    return totalCorrectAnswers / totalExercisesCompleted;
  }

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'readingScore': readingScore,
        'listeningScore': listeningScore,
        'grammarScore': grammarScore,
        'writingScore': writingScore,
        'speakingScore': speakingScore,
        'totalExercisesCompleted': totalExercisesCompleted,
        'totalCorrectAnswers': totalCorrectAnswers,
        'currentStreak': currentStreak,
        'longestStreak': longestStreak,
        'lastPracticeDate': lastPracticeDate.toIso8601String(),
        'completedExercises': completedExercises,
        'mockExamResults': mockExamResults.map((r) => r.toMap()).toList(),
      };

  factory ProgressModel.fromMap(Map<String, dynamic> map) => ProgressModel(
        userId: map['userId'] as String,
        readingScore: (map['readingScore'] as num?)?.toDouble() ?? 0,
        listeningScore: (map['listeningScore'] as num?)?.toDouble() ?? 0,
        grammarScore: (map['grammarScore'] as num?)?.toDouble() ?? 0,
        writingScore: (map['writingScore'] as num?)?.toDouble() ?? 0,
        speakingScore: (map['speakingScore'] as num?)?.toDouble() ?? 0,
        totalExercisesCompleted:
            map['totalExercisesCompleted'] as int? ?? 0,
        totalCorrectAnswers: map['totalCorrectAnswers'] as int? ?? 0,
        currentStreak: map['currentStreak'] as int? ?? 0,
        longestStreak: map['longestStreak'] as int? ?? 0,
        lastPracticeDate: DateTime.parse(map['lastPracticeDate'] as String),
        completedExercises:
            Map<String, bool>.from(map['completedExercises'] as Map? ?? {}),
        mockExamResults: (map['mockExamResults'] as List?)
                ?.map((r) => MockExamResult.fromMap(r as Map<String, dynamic>))
                .toList() ??
            [],
      );

  ProgressModel copyWith({
    double? readingScore,
    double? listeningScore,
    double? grammarScore,
    double? writingScore,
    double? speakingScore,
    int? totalExercisesCompleted,
    int? totalCorrectAnswers,
    int? currentStreak,
    int? longestStreak,
    DateTime? lastPracticeDate,
    Map<String, bool>? completedExercises,
    List<MockExamResult>? mockExamResults,
  }) =>
      ProgressModel(
        userId: userId,
        readingScore: readingScore ?? this.readingScore,
        listeningScore: listeningScore ?? this.listeningScore,
        grammarScore: grammarScore ?? this.grammarScore,
        writingScore: writingScore ?? this.writingScore,
        speakingScore: speakingScore ?? this.speakingScore,
        totalExercisesCompleted:
            totalExercisesCompleted ?? this.totalExercisesCompleted,
        totalCorrectAnswers: totalCorrectAnswers ?? this.totalCorrectAnswers,
        currentStreak: currentStreak ?? this.currentStreak,
        longestStreak: longestStreak ?? this.longestStreak,
        lastPracticeDate: lastPracticeDate ?? this.lastPracticeDate,
        completedExercises: completedExercises ?? this.completedExercises,
        mockExamResults: mockExamResults ?? this.mockExamResults,
      );
}

class MockExamResult {
  final String examId;
  final DateTime date;
  final int readingScore;
  final int readingTotal;
  final int useOfEnglishScore;
  final int useOfEnglishTotal;
  final int listeningScore;
  final int listeningTotal;
  final int totalScore;
  final int totalPossible;

  const MockExamResult({
    required this.examId,
    required this.date,
    required this.readingScore,
    required this.readingTotal,
    required this.useOfEnglishScore,
    required this.useOfEnglishTotal,
    required this.listeningScore,
    required this.listeningTotal,
    required this.totalScore,
    required this.totalPossible,
  });

  double get percentage => totalPossible > 0 ? totalScore / totalPossible : 0;

  Map<String, dynamic> toMap() => {
        'examId': examId,
        'date': date.toIso8601String(),
        'readingScore': readingScore,
        'readingTotal': readingTotal,
        'useOfEnglishScore': useOfEnglishScore,
        'useOfEnglishTotal': useOfEnglishTotal,
        'listeningScore': listeningScore,
        'listeningTotal': listeningTotal,
        'totalScore': totalScore,
        'totalPossible': totalPossible,
      };

  factory MockExamResult.fromMap(Map<String, dynamic> map) => MockExamResult(
        examId: map['examId'] as String,
        date: DateTime.parse(map['date'] as String),
        readingScore: map['readingScore'] as int,
        readingTotal: map['readingTotal'] as int,
        useOfEnglishScore: map['useOfEnglishScore'] as int,
        useOfEnglishTotal: map['useOfEnglishTotal'] as int,
        listeningScore: map['listeningScore'] as int,
        listeningTotal: map['listeningTotal'] as int,
        totalScore: map['totalScore'] as int,
        totalPossible: map['totalPossible'] as int,
      );
}
