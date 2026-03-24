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
      lastPracticeDate: DateTime.now(),
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

    final result = isCorrect ? 1.0 : 0.0;
    const w = 0.2;

    double? reading, listening, grammar, writing, cloze;
    switch (category) {
      case 'reading':
        reading = _progress!.readingScore * (1 - w) + result * w;
      case 'useOfEnglish':
        grammar = _progress!.grammarScore * (1 - w) + result * w;
      case 'listening':
        listening = _progress!.listeningScore * (1 - w) + result * w;
      case 'writing':
        writing = _progress!.writingScore * (1 - w) + result * w;
      case 'clozePart1':
        cloze = _progress!.clozeScore * (1 - w) + result * w;
    }

    _progress = _progress!.copyWith(
      totalExercisesCompleted: _progress!.totalExercisesCompleted + 1,
      totalCorrectAnswers:
          _progress!.totalCorrectAnswers + (isCorrect ? 1 : 0),
      readingScore: reading,
      listeningScore: listening,
      grammarScore: grammar,
      writingScore: writing,
      clozeScore: cloze,
      completedExercises: {
        ..._progress!.completedExercises,
        exerciseId: true,
      },
      lastPracticeDate: DateTime.now(),
    );
  }
}
