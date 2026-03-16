import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/progress_model.dart';

final progressRepositoryProvider = Provider<ProgressRepository>((ref) {
  return ProgressRepository();
});

class ProgressRepository {
  ProgressModel? _progress;

  Future<ProgressModel> getProgress(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _progress ??= ProgressModel(
      userId: userId,
      readingScore: 0.72,
      listeningScore: 0.65,
      grammarScore: 0.78,
      writingScore: 0.60,
      speakingScore: 0.55,
      totalExercisesCompleted: 47,
      totalCorrectAnswers: 35,
      currentStreak: 5,
      longestStreak: 12,
      lastPracticeDate: DateTime.now(),
      completedExercises: const {'r1': true, 'ue1': true, 'ue2': true, 'l1': true},
      mockExamResults: [
        MockExamResult(
          examId: 'mock_1',
          date: DateTime.now().subtract(const Duration(days: 7)),
          readingScore: 6,
          readingTotal: 8,
          useOfEnglishScore: 12,
          useOfEnglishTotal: 16,
          listeningScore: 5,
          listeningTotal: 8,
          totalScore: 23,
          totalPossible: 32,
        ),
      ],
    );
    return _progress!;
  }

  Future<void> updateProgress(ProgressModel progress) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _progress = progress;
  }

  Future<void> recordExerciseResult({
    required String exerciseId,
    required bool isCorrect,
    required String category,
  }) async {
    if (_progress == null) return;
    final updated = _progress!.copyWith(
      totalExercisesCompleted: _progress!.totalExercisesCompleted + 1,
      totalCorrectAnswers:
          _progress!.totalCorrectAnswers + (isCorrect ? 1 : 0),
      completedExercises: {
        ..._progress!.completedExercises,
        exerciseId: true,
      },
      lastPracticeDate: DateTime.now(),
    );
    _progress = updated;
  }
}
