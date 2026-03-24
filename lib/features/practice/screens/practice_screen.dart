import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/utils/haptic_utils.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Practice',
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
                Text(
                  'Choose a skill to practice',
                  style: AppTypography.body.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                _CategoryCard(
                  title: 'Reading',
                  subtitle: 'Comprehension, main ideas, detail questions',
                  icon: Icons.auto_stories_rounded,
                  color: AppColors.reading,
                  exerciseCount: 12,
                  onTap: () {
                    HapticUtils.light();
                    context.go('/practice/exercise/reading');
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                _CategoryCard(
                  title: 'Use of English',
                  subtitle: 'Grammar, gap fill, sentence transformation',
                  icon: Icons.edit_note_rounded,
                  color: AppColors.grammar,
                  exerciseCount: 20,
                  onTap: () {
                    HapticUtils.light();
                    context.go('/practice/exercise/useOfEnglish');
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                _CategoryCard(
                  title: 'Listening',
                  subtitle: 'Conversations, interviews, monologues',
                  icon: Icons.headphones_rounded,
                  color: AppColors.listening,
                  exerciseCount: 3,
                  onTap: () {
                    HapticUtils.light();
                    context.go('/practice/exercise/listening');
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                _CategoryCard(
                  title: 'Writing',
                  subtitle: 'Essays, reviews, letters, reports',
                  icon: Icons.create_rounded,
                  color: AppColors.writing,
                  exerciseCount: 2,
                  onTap: () {
                    HapticUtils.light();
                    context.go('/practice/writing');
                  },
                ),
                const SizedBox(height: AppSpacing.md),

                _CategoryCard(
                  title: 'Gap fill',
                  subtitle:
                      'Multiple-choice gaps in short texts — 3 separate tasks',
                  icon: Icons.view_list_rounded,
                  color: AppColors.clozePart1,
                  exerciseCount: 3,
                  onTap: () {
                    HapticUtils.light();
                    context.go('/practice/gap-fill');
                  },
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

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final int exerciseCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.exerciseCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return PremiumCard(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: Icon(icon, color: color, size: 28),
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
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTypography.footnote.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '$exerciseCount exercises available',
                  style: AppTypography.caption1.copyWith(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: isDark
                ? AppColors.textTertiaryDark
                : AppColors.textTertiaryLight,
          ),
        ],
      ),
    );
  }
}
