import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/progress_ring.dart';
import '../../../core/widgets/lesson_card.dart';
import '../../progress/providers/progress_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progressAsync = ref.watch(progressProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 0,
            floating: true,
            title: Text(
              AppConstants.appName,
              style: AppTypography.title2.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w800,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverPadding(
            padding: AppSpacing.pagePadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: AppSpacing.md),

                // Greeting
                Text(
                  _greeting(),
                  style: AppTypography.largeTitle.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Ready to practice today?',
                  style: AppTypography.body.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),

                // Exam readiness card
                progressAsync.when(
                  data: (progress) => PremiumCard(
                    gradient: AppColors.primaryGradient,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exam Readiness',
                                style: AppTypography.headline.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                '${(progress.examReadiness * 100).round()}%',
                                style: AppTypography.largeTitle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.sm,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusFull),
                                ),
                                child: Text(
                                  '${progress.currentStreak} day streak',
                                  style: AppTypography.caption1.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProgressRing(
                          progress: progress.examReadiness,
                          size: 100,
                          strokeWidth: 8,
                          color: Colors.white,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          center: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${(progress.examReadiness * 100).round()}%',
                                style: AppTypography.title3.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'ready',
                                style: AppTypography.caption2.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  loading: () => const SizedBox(
                    height: 140,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Daily Practice
                Text(
                  'Daily Practice',
                  style: AppTypography.title3.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                PremiumCard(
                  onTap: () => context.go('/practice/exercise/useOfEnglish'),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: AppColors.accentGradient,
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusMd),
                        ),
                        child: const Icon(Icons.bolt_rounded,
                            color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Grammar Drill',
                              style: AppTypography.headline.copyWith(
                                color: isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight,
                              ),
                            ),
                            Text(
                              '5 questions · ~3 min',
                              style: AppTypography.footnote.copyWith(
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.play_circle_fill_rounded,
                          color: AppColors.primaryBlue, size: 40),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Recommended Lessons
                Text(
                  'Recommended',
                  style: AppTypography.title3.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                LessonCard(
                  title: 'Reading: Main Ideas',
                  subtitle: '8 exercises · B2 level',
                  icon: Icons.auto_stories_rounded,
                  color: AppColors.reading,
                  progress: 0.3,
                  onTap: () => context.go('/practice/exercise/reading'),
                ),
                const SizedBox(height: AppSpacing.sm),

                LessonCard(
                  title: 'Conditionals Review',
                  subtitle: '10 exercises · B2 level',
                  icon: Icons.edit_note_rounded,
                  color: AppColors.grammar,
                  progress: 0.0,
                  onTap: () => context.go('/practice/exercise/useOfEnglish'),
                ),
                const SizedBox(height: AppSpacing.sm),

                LessonCard(
                  title: 'Listening: Conversations',
                  subtitle: '6 exercises · B2 level',
                  icon: Icons.headphones_rounded,
                  color: AppColors.listening,
                  progress: 0.5,
                  onTap: () => context.go('/practice/exercise/listening'),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Skills overview
                Text(
                  'Your Skills',
                  style: AppTypography.title3.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                progressAsync.when(
                  data: (progress) => Row(
                    children: [
                      _SkillChip(
                          label: 'Reading',
                          value: progress.readingScore,
                          color: AppColors.reading),
                      const SizedBox(width: AppSpacing.sm),
                      _SkillChip(
                          label: 'Grammar',
                          value: progress.grammarScore,
                          color: AppColors.grammar),
                      const SizedBox(width: AppSpacing.sm),
                      _SkillChip(
                          label: 'Listening',
                          value: progress.listeningScore,
                          color: AppColors.listening),
                    ],
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),

                const SizedBox(height: AppSpacing.xxl),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _SkillChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Text(
              '${(value * 100).round()}%',
              style: AppTypography.title3.copyWith(
                color: color,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTypography.caption2.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
