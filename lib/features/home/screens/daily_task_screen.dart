import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../data/models/exercise_model.dart';
import '../providers/daily_task_provider.dart';

class DailyTaskScreen extends ConsumerStatefulWidget {
  const DailyTaskScreen({super.key});

  @override
  ConsumerState<DailyTaskScreen> createState() => _DailyTaskScreenState();
}

class _DailyTaskScreenState extends ConsumerState<DailyTaskScreen> {
  int? _selectedAnswer;
  bool _showExplanation = false;
  bool _answeredCorrectly = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final taskAsync = ref.watch(dailyTaskProvider);

    return taskAsync.when(
      data: (task) {
        if (task.isCompletedToday && !_showExplanation) {
          return _buildAlreadyDoneView(context, task, isDark);
        }
        if (_showExplanation && _answeredCorrectly) {
          return _buildCompletedView(context, task, isDark);
        }
        return _buildExerciseView(context, task.exercise, task.dayIndex, isDark);
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Error loading daily task')),
      ),
    );
  }

  Widget _buildExerciseView(
      BuildContext context, ExerciseModel exercise, int dayIndex, bool isDark) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Task · Day $dayIndex',
          style: AppTypography.headline.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: AppSpacing.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),

                  if (exercise.passage != null) ...[
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.surfaceDark
                            : AppColors.dividerLight,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusMd),
                      ),
                      child: Text(
                        exercise.passage!,
                        style: AppTypography.subheadline.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                  ],

                  Text(
                    exercise.question,
                    style: AppTypography.title3.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),

                  ...List.generate(exercise.answers.length, (index) {
                    final isSelected = _selectedAnswer == index;
                    final isCorrect = index == exercise.correctAnswerIndex;
                    final showResult = _showExplanation;

                    Color borderColor;
                    Color bgColor;
                    if (showResult && isCorrect) {
                      borderColor = AppColors.success;
                      bgColor = AppColors.success.withValues(alpha: 0.08);
                    } else if (showResult && isSelected && !isCorrect) {
                      borderColor = AppColors.error;
                      bgColor = AppColors.error.withValues(alpha: 0.08);
                    } else if (isSelected) {
                      borderColor = AppColors.primaryBlue;
                      bgColor = AppColors.primaryBlue.withValues(alpha: 0.08);
                    } else {
                      borderColor =
                          isDark ? AppColors.borderDark : AppColors.borderLight;
                      bgColor = Colors.transparent;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: GestureDetector(
                        onTap: _showExplanation
                            ? null
                            : () {
                                HapticUtils.selection();
                                setState(() => _selectedAnswer = index);
                              },
                        child: AnimatedContainer(
                          duration: AppSpacing.animFast,
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusMd),
                            border:
                                Border.all(color: borderColor, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? borderColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: borderColor, width: 1.5),
                                ),
                                child: Center(
                                  child: showResult && isCorrect
                                      ? const Icon(Icons.check,
                                          color: Colors.white, size: 18)
                                      : showResult &&
                                              isSelected &&
                                              !isCorrect
                                          ? const Icon(Icons.close,
                                              color: Colors.white, size: 18)
                                          : Text(
                                              String.fromCharCode(65 + index),
                                              style: AppTypography.headline
                                                  .copyWith(
                                                color: isSelected
                                                    ? Colors.white
                                                    : (isDark
                                                        ? AppColors
                                                            .textSecondaryDark
                                                        : AppColors
                                                            .textSecondaryLight),
                                                fontSize: 14,
                                              ),
                                            ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: Text(
                                  exercise.answers[index],
                                  style: AppTypography.body.copyWith(
                                    color: isDark
                                        ? AppColors.textPrimaryDark
                                        : AppColors.textPrimaryLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

                  if (_showExplanation) ...[
                    const SizedBox(height: AppSpacing.md),
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: 0.08),
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusMd),
                        border: Border.all(
                          color: AppColors.primaryBlue.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lightbulb_outline_rounded,
                                  color: AppColors.primaryBlue, size: 20),
                              const SizedBox(width: AppSpacing.sm),
                              Text(
                                'Explanation',
                                style: AppTypography.headline
                                    .copyWith(color: AppColors.primaryBlue),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            exercise.explanation,
                            style: AppTypography.subheadline.copyWith(
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),

          if (_selectedAnswer != null && !_showExplanation)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: PrimaryButton(
                  label: 'Check Answer',
                  onPressed: _submitAnswer,
                ),
              ),
            ),

          if (_showExplanation)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: PrimaryButton(
                  label: _answeredCorrectly ? 'Done' : 'Close',
                  onPressed: () => context.pop(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _submitAnswer() {
    final taskState = ref.read(dailyTaskProvider).valueOrNull;
    if (taskState == null || _selectedAnswer == null) return;

    final isCorrect =
        _selectedAnswer == taskState.exercise.correctAnswerIndex;

    setState(() {
      _showExplanation = true;
      _answeredCorrectly = isCorrect;
    });

    if (isCorrect) {
      HapticUtils.success();
      ref.read(dailyTaskProvider.notifier).markCompleted();
    } else {
      HapticUtils.error();
    }
  }

  Widget _buildCompletedView(
      BuildContext context, DailyTaskState task, bool isDark) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_rounded,
                    color: AppColors.success, size: 40),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Daily Task Complete!',
                style: AppTypography.title2.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${task.streak} day streak',
                style: AppTypography.title3.copyWith(
                  color: AppColors.warning,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: 'Back to Home',
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlreadyDoneView(
      BuildContext context, DailyTaskState task, bool isDark) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Task',
          style: AppTypography.headline.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle_rounded,
                    color: AppColors.success, size: 40),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Already completed today!',
                style: AppTypography.title2.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Come back tomorrow for a new challenge.',
                style: AppTypography.body.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                '${task.streak} day streak 🔥',
                style: AppTypography.title3.copyWith(
                  color: AppColors.warning,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: 'Back to Home',
                onPressed: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
