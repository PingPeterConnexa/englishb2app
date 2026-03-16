import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/tts_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/widgets/audio_passage_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/result_card.dart';
import '../../../data/models/exercise_model.dart';
import '../../progress/providers/progress_provider.dart';
import '../providers/practice_provider.dart';

class ExerciseScreen extends ConsumerStatefulWidget {
  final String categoryName;

  const ExerciseScreen({super.key, required this.categoryName});

  @override
  ConsumerState<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends ConsumerState<ExerciseScreen> {
  @override
  void initState() {
    super.initState();
    final category = ExerciseCategory.values.firstWhere(
      (c) => c.name == widget.categoryName,
      orElse: () => ExerciseCategory.reading,
    );
    Future.microtask(
      () => ref.read(exerciseSessionProvider.notifier).loadExercises(category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final session = ref.watch(exerciseSessionProvider);

    if (session.exercises.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (session.isCompleted) {
      return _buildResultView(context, session, isDark);
    }

    final exercise = session.currentExercise!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _categoryTitle(widget.categoryName),
          style: AppTypography.headline.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            ref.read(ttsProvider.notifier).stop();
            ref.read(exerciseSessionProvider.notifier).reset();
            ref.invalidate(progressProvider);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: session.progress,
            backgroundColor: isDark ? AppColors.borderDark : AppColors.borderLight,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
            minHeight: 3,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: AppSpacing.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.lg),
                  // Question counter
                  Text(
                    'Question ${session.currentIndex + 1} of ${session.exercises.length}',
                    style: AppTypography.footnote.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  if (exercise.passage != null) ...[
                    AudioPassageCard(passage: exercise.passage!),
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

                  // Answer options
                  ...List.generate(exercise.answers.length, (index) {
                    final isSelected =
                        session.selectedAnswers[session.currentIndex] == index;
                    final isCorrect =
                        index == exercise.correctAnswerIndex;
                    final showResult = session.showExplanation;

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
                        onTap: session.showExplanation
                            ? null
                            : () {
                                HapticUtils.selection();
                                ref
                                    .read(exerciseSessionProvider.notifier)
                                    .selectAnswer(index);
                              },
                        child: AnimatedContainer(
                          duration: AppSpacing.animFast,
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusMd),
                            border: Border.all(color: borderColor, width: 1.5),
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
                                    color: borderColor,
                                    width: 1.5,
                                  ),
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

                  // Explanation
                  if (session.showExplanation) ...[
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

          // Bottom action
          if (session.showExplanation)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: PrimaryButton(
                  label: session.currentIndex < session.exercises.length - 1
                      ? 'Next Question'
                      : 'See Results',
                  onPressed: () => ref
                      .read(exerciseSessionProvider.notifier)
                      .nextQuestion(),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultView(
      BuildContext context, ExerciseSessionState session, bool isDark) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results',
            style: AppTypography.headline.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            )),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            ref.read(ttsProvider.notifier).stop();
            ref.read(exerciseSessionProvider.notifier).reset();
            ref.invalidate(progressProvider);
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.pagePadding,
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.lg),
            ResultCard(
              title: _categoryTitle(widget.categoryName),
              subtitle: 'Practice Complete',
              score: session.correctCount,
              total: session.exercises.length,
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Done',
              onPressed: () {
                ref.read(ttsProvider.notifier).stop();
                ref.read(exerciseSessionProvider.notifier).reset();
                ref.invalidate(progressProvider);
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  String _categoryTitle(String name) {
    switch (name) {
      case 'reading':
        return 'Reading';
      case 'useOfEnglish':
        return 'Use of English';
      case 'listening':
        return 'Listening';
      default:
        return name;
    }
  }
}
