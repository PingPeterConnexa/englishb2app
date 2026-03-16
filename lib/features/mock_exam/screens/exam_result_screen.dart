import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/secondary_button.dart';
import '../../../core/widgets/result_card.dart';
import '../providers/mock_exam_provider.dart';

class ExamResultScreen extends ConsumerWidget {
  const ExamResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final exam = ref.watch(mockExamProvider);

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Exam Results',
            style: AppTypography.headline.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: AppSpacing.pagePadding,
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.md),

              ResultCard(
                title: 'Mock Exam Complete',
                subtitle: 'B2 Practice Test',
                score: exam.correctCount,
                total: exam.exercises.length,
                details: [
                  ResultDetail(
                    label: 'Reading',
                    score: exam.readingCorrect,
                    total: exam.readingTotal,
                  ),
                  ResultDetail(
                    label: 'Use of English',
                    score: exam.useOfEnglishCorrect,
                    total: exam.useOfEnglishTotal,
                  ),
                  ResultDetail(
                    label: 'Listening',
                    score: exam.listeningCorrect,
                    total: exam.listeningTotal,
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),

              // Feedback
              _FeedbackCard(
                percentage: exam.exercises.isNotEmpty
                    ? exam.correctCount / exam.exercises.length
                    : 0,
              ),

              const SizedBox(height: AppSpacing.xl),

              PrimaryButton(
                label: 'Back to Mock Exams',
                onPressed: () {
                  ref.read(mockExamProvider.notifier).reset();
                  context.go('/mock-exam');
                },
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: 'View Progress',
                onPressed: () {
                  ref.read(mockExamProvider.notifier).reset();
                  context.go('/progress');
                },
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeedbackCard extends StatelessWidget {
  final double percentage;

  const _FeedbackCard({required this.percentage});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    String title;
    String message;
    IconData icon;
    Color color;

    if (percentage >= 0.85) {
      title = 'Outstanding!';
      message =
          'You are well-prepared for a B2-level exam. Keep practicing to maintain your skills.';
      icon = Icons.emoji_events_rounded;
      color = AppColors.success;
    } else if (percentage >= 0.7) {
      title = 'Well Done!';
      message =
          'You have a solid foundation. Focus on the areas where you lost marks to improve further.';
      icon = Icons.thumb_up_rounded;
      color = AppColors.success;
    } else if (percentage >= 0.6) {
      title = 'Good Effort';
      message =
          'You are close to the pass threshold. Regular practice will help you reach your goal.';
      icon = Icons.trending_up_rounded;
      color = AppColors.warning;
    } else {
      title = 'Keep Practising';
      message =
          'Focus on building your skills in each area. Consistent daily practice will make a big difference.';
      icon = Icons.fitness_center_rounded;
      color = AppColors.error;
    }

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headline.copyWith(color: color),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  message,
                  style: AppTypography.subheadline.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
