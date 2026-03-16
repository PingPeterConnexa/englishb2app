import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/widgets/exam_timer.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/mock_exam_provider.dart';

class ExamSessionScreen extends ConsumerWidget {
  const ExamSessionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final exam = ref.watch(mockExamProvider);

    if (exam.exercises.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (exam.isCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/mock-exam/result');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final exercise = exam.currentExercise!;
    final sectionLabel = _sectionLabel(exam.currentSection);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => _showExitDialog(context, ref),
          ),
          title: Text(sectionLabel,
              style: AppTypography.headline.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.md),
              child: ExamTimer(
                totalSeconds: exam.totalSeconds,
                onTimeUp: () {
                  ref.read(mockExamProvider.notifier).onTimeUp();
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Progress
            LinearProgressIndicator(
              value: exam.progress,
              backgroundColor: isDark ? AppColors.borderDark : AppColors.borderLight,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
              minHeight: 3,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: AppSpacing.pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.lg),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _sectionColor(exam.currentSection)
                                .withValues(alpha: 0.12),
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusFull),
                          ),
                          child: Text(
                            sectionLabel,
                            style: AppTypography.caption1.copyWith(
                              color: _sectionColor(exam.currentSection),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Q${exam.currentIndex + 1}/${exam.exercises.length}',
                          style: AppTypography.footnote.copyWith(
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Passage
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

                    // Question
                    Text(
                      exercise.question,
                      style: AppTypography.title3.copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Answers
                    ...List.generate(exercise.answers.length, (index) {
                      final isSelected =
                          exam.selectedAnswers[exam.currentIndex] == index;
                      final isCorrect =
                          index == exercise.correctAnswerIndex;
                      final showResult = exam.showExplanation;

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
                        bgColor =
                            AppColors.primaryBlue.withValues(alpha: 0.08);
                      } else {
                        borderColor = isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight;
                        bgColor = Colors.transparent;
                      }

                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: GestureDetector(
                          onTap: exam.showExplanation
                              ? null
                              : () {
                                  HapticUtils.selection();
                                  ref
                                      .read(mockExamProvider.notifier)
                                      .selectAnswer(index);
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
                                                color: Colors.white,
                                                size: 18)
                                            : Text(
                                                String.fromCharCode(
                                                    65 + index),
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

                    if (exam.showExplanation) ...[
                      const SizedBox(height: AppSpacing.md),
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color:
                              AppColors.primaryBlue.withValues(alpha: 0.08),
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMd),
                          border: Border.all(
                            color:
                                AppColors.primaryBlue.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                    Icons.lightbulb_outline_rounded,
                                    color: AppColors.primaryBlue,
                                    size: 20),
                                const SizedBox(width: AppSpacing.sm),
                                Text(
                                  'Explanation',
                                  style: AppTypography.headline.copyWith(
                                    color: AppColors.primaryBlue,
                                  ),
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

            if (exam.showExplanation)
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: PrimaryButton(
                    label:
                        exam.currentIndex < exam.exercises.length - 1
                            ? 'Next Question'
                            : 'Finish Exam',
                    onPressed: () =>
                        ref.read(mockExamProvider.notifier).nextQuestion(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _sectionLabel(ExamSection section) {
    switch (section) {
      case ExamSection.reading:
        return 'Reading';
      case ExamSection.useOfEnglish:
        return 'Use of English';
      case ExamSection.listening:
        return 'Listening';
    }
  }

  Color _sectionColor(ExamSection section) {
    switch (section) {
      case ExamSection.reading:
        return AppColors.reading;
      case ExamSection.useOfEnglish:
        return AppColors.grammar;
      case ExamSection.listening:
        return AppColors.listening;
    }
  }

  void _showExitDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Exam?'),
        content: const Text(
            'Your progress will be lost. Are you sure you want to leave?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              ref.read(mockExamProvider.notifier).reset();
              context.go('/mock-exam');
            },
            child: Text('Leave',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }
}
