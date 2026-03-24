import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../content/mock_exam_exercises.dart';
import '../content/sample_exercises.dart';
import '../models/exercise_model.dart';

final exerciseRepositoryProvider = Provider<ExerciseRepository>((ref) {
  return ExerciseRepository();
});

class ExerciseRepository {
  Future<List<ExerciseModel>> getExercisesByCategory(
      ExerciseCategory category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return SampleExercises.getByCategory(category);
  }

  Future<List<ExerciseModel>> getMockExamExercises() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return MockExamExercises.getAllExamExercises();
  }

  Future<List<WritingPromptModel>> getWritingPrompts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return SampleExercises.writingPrompts;
  }
}
