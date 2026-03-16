import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/mock_exam_provider.dart';

class MockExamScreen extends ConsumerWidget {
  const MockExamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Mock Exam',
              style: AppTypography.title2.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
          SliverPadding(
            padding: AppSpacing.pagePadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: AppSpacing.md),

                // Hero card
                PremiumCard(
                  gradient: AppColors.primaryGradient,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.assignment_rounded,
                          color: Colors.white, size: 40),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'B2 Practice Exam',
                        style: AppTypography.title1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        AppConstants.appDescription,
                        style: AppTypography.subheadline.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        children: [
                          _InfoBadge(
                            icon: Icons.timer_outlined,
                            label:
                                '${AppConstants.examDurationMinutes} min',
                          ),
                          const SizedBox(width: AppSpacing.md),
                          const _InfoBadge(
                            icon: Icons.quiz_outlined,
                            label: '8 questions',
                          ),
                          const SizedBox(width: AppSpacing.md),
                          const _InfoBadge(
                            icon: Icons.category_outlined,
                            label: '3 sections',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Exam sections
                Text(
                  'Exam Sections',
                  style: AppTypography.title3.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                _SectionCard(
                  title: 'Reading',
                  description: 'Comprehension and inference questions',
                  duration: '${AppConstants.readingSectionMinutes} min',
                  questionCount: 2,
                  color: AppColors.reading,
                  icon: Icons.auto_stories_rounded,
                ),
                const SizedBox(height: AppSpacing.sm),

                _SectionCard(
                  title: 'Use of English',
                  description: 'Grammar, vocabulary and transformations',
                  duration: '${AppConstants.useOfEnglishSectionMinutes} min',
                  questionCount: 4,
                  color: AppColors.grammar,
                  icon: Icons.edit_note_rounded,
                ),
                const SizedBox(height: AppSpacing.sm),

                _SectionCard(
                  title: 'Listening',
                  description: 'Audio comprehension exercises',
                  duration: '${AppConstants.listeningSectionMinutes} min',
                  questionCount: 2,
                  color: AppColors.listening,
                  icon: Icons.headphones_rounded,
                ),

                const SizedBox(height: AppSpacing.xl),

                // Instructions
                PremiumCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Before You Start',
                        style: AppTypography.headline.copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      ...[
                        'Find a quiet place without distractions',
                        'Make sure you have enough time to complete the exam',
                        'Answer all questions — there is no penalty for guessing',
                        'You can navigate between questions within a section',
                      ].map(
                        (instruction) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.check_circle_rounded,
                                  color: AppColors.success, size: 18),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  instruction,
                                  style:
                                      AppTypography.subheadline.copyWith(
                                    color: isDark
                                        ? AppColors.textSecondaryDark
                                        : AppColors.textSecondaryLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                PrimaryButton(
                  label: 'Start Mock Exam',
                  icon: Icons.play_arrow_rounded,
                  onPressed: () {
                    ref.read(mockExamProvider.notifier).startExam();
                    context.go('/mock-exam/session');
                  },
                ),

                const SizedBox(height: AppSpacing.md),

                Center(
                  child: Text(
                    AppConstants.disclaimer,
                    textAlign: TextAlign.center,
                    style: AppTypography.caption2.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.xxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTypography.caption2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final int questionCount;
  final Color color;
  final IconData icon;

  const _SectionCard({
    required this.title,
    required this.description,
    required this.duration,
    required this.questionCount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PremiumCard(
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.headline.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  description,
                  style: AppTypography.caption1.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                duration,
                style: AppTypography.footnote.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$questionCount Qs',
                style: AppTypography.caption2.copyWith(
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
