import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/content/daily_exercises.dart';
import '../../../data/models/exercise_model.dart';

class DailyTaskState {
  final ExerciseModel exercise;
  final int dayIndex;
  final bool isCompletedToday;
  final int streak;

  const DailyTaskState({
    required this.exercise,
    required this.dayIndex,
    required this.isCompletedToday,
    required this.streak,
  });

  DailyTaskState copyWith({
    bool? isCompletedToday,
    int? streak,
  }) =>
      DailyTaskState(
        exercise: exercise,
        dayIndex: dayIndex,
        isCompletedToday: isCompletedToday ?? this.isCompletedToday,
        streak: streak ?? this.streak,
      );
}

class DailyTaskNotifier extends StateNotifier<AsyncValue<DailyTaskState>> {
  DailyTaskNotifier() : super(const AsyncValue.loading()) {
    _init();
  }

  static const _completedDateKey = 'daily_task_completed_date';
  static const _streakKey = 'daily_task_streak';
  static const _lastStreakDateKey = 'daily_task_last_streak_date';

  String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  int _dayOfYear() {
    final now = DateTime.now();
    return now.difference(DateTime(now.year)).inDays;
  }

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    final today = _todayKey();
    final completedDate = prefs.getString(_completedDateKey);
    final isCompleted = completedDate == today;
    var streak = prefs.getInt(_streakKey) ?? 0;
    final lastStreakDate = prefs.getString(_lastStreakDateKey);

    // Reset streak if the user missed a day
    if (lastStreakDate != null && lastStreakDate != today) {
      final lastDate = DateTime.tryParse(lastStreakDate);
      if (lastDate != null) {
        final diff = DateTime.now().difference(lastDate).inDays;
        if (diff > 1) streak = 0;
      }
    }

    // Cap streak at 31
    if (streak > 31) streak = 31;

    final dayIndex = _dayOfYear() % 31;
    final exercise = DailyExercises.tasks[dayIndex];

    state = AsyncValue.data(DailyTaskState(
      exercise: exercise,
      dayIndex: dayIndex + 1,
      isCompletedToday: isCompleted,
      streak: streak,
    ));
  }

  Future<void> markCompleted() async {
    final current = state.valueOrNull;
    if (current == null || current.isCompletedToday) return;

    final prefs = await SharedPreferences.getInstance();
    final today = _todayKey();
    var newStreak = current.streak + 1;
    if (newStreak > 31) newStreak = 31;

    await prefs.setString(_completedDateKey, today);
    await prefs.setInt(_streakKey, newStreak);
    await prefs.setString(_lastStreakDateKey, today);

    state = AsyncValue.data(current.copyWith(
      isCompletedToday: true,
      streak: newStreak,
    ));
  }
}

final dailyTaskProvider =
    StateNotifierProvider<DailyTaskNotifier, AsyncValue<DailyTaskState>>((ref) {
  return DailyTaskNotifier();
});
