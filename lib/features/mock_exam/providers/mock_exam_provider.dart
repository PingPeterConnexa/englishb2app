import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/exercise_model.dart';
import '../../../data/repositories/exercise_repository.dart';
import '../../../data/repositories/progress_repository.dart';

enum ExamSection { reading, useOfEnglish, listening }

class MockExamState {
  final List<ExerciseModel> exercises;
  final int currentIndex;
  final Map<int, int> selectedAnswers;
  final ExamSection currentSection;
  final bool isCompleted;
  final bool showExplanation;
  final int totalSeconds;

  const MockExamState({
    this.exercises = const [],
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.currentSection = ExamSection.reading,
    this.isCompleted = false,
    this.showExplanation = false,
    this.totalSeconds = 5400,
  });

  ExerciseModel? get currentExercise =>
      exercises.isNotEmpty && currentIndex < exercises.length
          ? exercises[currentIndex]
          : null;

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

  int get readingCorrect => _correctForCategory(ExerciseCategory.reading);
  int get useOfEnglishCorrect =>
      _correctForCategory(ExerciseCategory.useOfEnglish);
  int get listeningCorrect =>
      _correctForCategory(ExerciseCategory.listening);

  int get readingTotal =>
      exercises.where((e) => e.category == ExerciseCategory.reading).length;
  int get useOfEnglishTotal => exercises
      .where((e) => e.category == ExerciseCategory.useOfEnglish)
      .length;
  int get listeningTotal =>
      exercises.where((e) => e.category == ExerciseCategory.listening).length;

  int _correctForCategory(ExerciseCategory category) {
    int count = 0;
    selectedAnswers.forEach((index, answer) {
      if (index < exercises.length &&
          exercises[index].category == category &&
          exercises[index].correctAnswerIndex == answer) {
        count++;
      }
    });
    return count;
  }

  double get progress =>
      exercises.isEmpty ? 0 : selectedAnswers.length / exercises.length;

  MockExamState copyWith({
    List<ExerciseModel>? exercises,
    int? currentIndex,
    Map<int, int>? selectedAnswers,
    ExamSection? currentSection,
    bool? isCompleted,
    bool? showExplanation,
    int? totalSeconds,
  }) =>
      MockExamState(
        exercises: exercises ?? this.exercises,
        currentIndex: currentIndex ?? this.currentIndex,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers,
        currentSection: currentSection ?? this.currentSection,
        isCompleted: isCompleted ?? this.isCompleted,
        showExplanation: showExplanation ?? this.showExplanation,
        totalSeconds: totalSeconds ?? this.totalSeconds,
      );
}

class MockExamNotifier extends StateNotifier<MockExamState> {
  final ExerciseRepository _exerciseRepo;
  final ProgressRepository _progressRepo; // ignore: unused_field

  MockExamNotifier(this._exerciseRepo, this._progressRepo)
      : super(const MockExamState());

  Future<void> startExam() async {
    final exercises = await _exerciseRepo.getMockExamExercises();
    state = MockExamState(exercises: exercises);
  }

  void selectAnswer(int answerIndex) {
    if (state.selectedAnswers.containsKey(state.currentIndex)) return;
    state = state.copyWith(
      selectedAnswers: {
        ...state.selectedAnswers,
        state.currentIndex: answerIndex,
      },
      showExplanation: true,
    );
  }

  void nextQuestion() {
    if (state.currentIndex < state.exercises.length - 1) {
      final nextIndex = state.currentIndex + 1;
      final nextExercise = state.exercises[nextIndex];
      ExamSection section;
      switch (nextExercise.category) {
        case ExerciseCategory.reading:
          section = ExamSection.reading;
        case ExerciseCategory.useOfEnglish:
          section = ExamSection.useOfEnglish;
        case ExerciseCategory.listening:
          section = ExamSection.listening;
        default:
          section = state.currentSection;
      }
      state = state.copyWith(
        currentIndex: nextIndex,
        currentSection: section,
        showExplanation: false,
      );
    } else {
      state = state.copyWith(isCompleted: true);
    }
  }

  void onTimeUp() {
    state = state.copyWith(isCompleted: true);
  }

  void reset() {
    state = const MockExamState();
  }
}

final mockExamProvider =
    StateNotifierProvider<MockExamNotifier, MockExamState>((ref) {
  return MockExamNotifier(
    ref.read(exerciseRepositoryProvider),
    ref.read(progressRepositoryProvider),
  );
});
