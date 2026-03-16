import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/exercise_model.dart';
import '../../../data/repositories/exercise_repository.dart';
import '../../../data/repositories/progress_repository.dart';

class ExerciseSessionState {
  final List<ExerciseModel> exercises;
  final int currentIndex;
  final Map<int, int> selectedAnswers;
  final bool isCompleted;
  final bool showExplanation;

  const ExerciseSessionState({
    this.exercises = const [],
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.isCompleted = false,
    this.showExplanation = false,
  });

  ExerciseModel? get currentExercise =>
      exercises.isNotEmpty && currentIndex < exercises.length
          ? exercises[currentIndex]
          : null;

  bool get hasSelectedAnswer => selectedAnswers.containsKey(currentIndex);

  int get correctCount {
    int count = 0;
    selectedAnswers.forEach((index, answer) {
      if (index < exercises.length &&
          exercises[index].correctAnswerIndex == answer) {
        count++;
      }
    });
    return count;
  }

  double get progress =>
      exercises.isEmpty ? 0 : (currentIndex + 1) / exercises.length;

  ExerciseSessionState copyWith({
    List<ExerciseModel>? exercises,
    int? currentIndex,
    Map<int, int>? selectedAnswers,
    bool? isCompleted,
    bool? showExplanation,
  }) =>
      ExerciseSessionState(
        exercises: exercises ?? this.exercises,
        currentIndex: currentIndex ?? this.currentIndex,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers,
        isCompleted: isCompleted ?? this.isCompleted,
        showExplanation: showExplanation ?? this.showExplanation,
      );
}

class ExerciseSessionNotifier extends StateNotifier<ExerciseSessionState> {
  final ExerciseRepository _exerciseRepo;
  final ProgressRepository _progressRepo;

  ExerciseSessionNotifier(this._exerciseRepo, this._progressRepo)
      : super(const ExerciseSessionState());

  Future<void> loadExercises(ExerciseCategory category) async {
    final exercises =
        await _exerciseRepo.getExercisesByCategory(category);
    state = ExerciseSessionState(exercises: exercises);
  }

  Future<void> loadMockExam() async {
    final exercises = await _exerciseRepo.getMockExamExercises();
    state = ExerciseSessionState(exercises: exercises);
  }

  void selectAnswer(int answerIndex) {
    if (state.hasSelectedAnswer) return;
    state = state.copyWith(
      selectedAnswers: {...state.selectedAnswers, state.currentIndex: answerIndex},
      showExplanation: true,
    );

    final exercise = state.currentExercise!;
    final isCorrect = exercise.correctAnswerIndex == answerIndex;
    _progressRepo.recordExerciseResult(
      exerciseId: exercise.id,
      isCorrect: isCorrect,
      category: exercise.category.name,
    );
  }

  void nextQuestion() {
    if (state.currentIndex < state.exercises.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        showExplanation: false,
      );
    } else {
      state = state.copyWith(isCompleted: true);
    }
  }

  void reset() {
    state = const ExerciseSessionState();
  }
}

final exerciseSessionProvider =
    StateNotifierProvider<ExerciseSessionNotifier, ExerciseSessionState>((ref) {
  return ExerciseSessionNotifier(
    ref.read(exerciseRepositoryProvider),
    ref.read(progressRepositoryProvider),
  );
});
