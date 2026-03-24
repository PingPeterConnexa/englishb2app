import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/progress_ring.dart';
import '../providers/progress_provider.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progressAsync = ref.watch(progressProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Progress',
              style: AppTypography.title2.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ),
          SliverPadding(
            padding: AppSpacing.pagePadding,
            sliver: progressAsync.when(
              data: (progress) => SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: AppSpacing.md),

                  // Overall Score
                  PremiumCard(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        Text(
                          'Overall Progress',
                          style: AppTypography.title3.copyWith(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        ProgressRing(
                          progress: progress.overallScore,
                          size: 160,
                          strokeWidth: 14,
                          color: AppColors.primaryBlue,
                          center: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${(progress.overallScore * 100).round()}%',
                                style: AppTypography.largeTitle.copyWith(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                'average score',
                                style: AppTypography.caption1.copyWith(
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _StatItem(
                              value: '${progress.totalExercisesCompleted}',
                              label: 'Exercises',
                              color: AppColors.primaryBlue,
                            ),
                            _StatItem(
                              value: '${(progress.accuracy * 100).round()}%',
                              label: 'Accuracy',
                              color: AppColors.success,
                            ),
                            _StatItem(
                              value: '${progress.currentStreak}',
                              label: 'Day Streak',
                              color: AppColors.warning,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Skill Breakdown
                  Text(
                    'Skill Breakdown',
                    style: AppTypography.title3.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  PremiumCard(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        _SkillBar(
                          label: 'Reading',
                          value: progress.readingScore,
                          color: AppColors.reading,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _SkillBar(
                          label: 'Grammar',
                          value: progress.grammarScore,
                          color: AppColors.grammar,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _SkillBar(
                          label: 'Listening',
                          value: progress.listeningScore,
                          color: AppColors.listening,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _SkillBar(
                          label: 'Writing',
                          value: progress.writingScore,
                          color: AppColors.writing,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        _SkillBar(
                          label: 'Gap fill',
                          value: progress.clozeScore,
                          color: AppColors.clozePart1,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Exam Readiness
                  Text(
                    'Exam Readiness',
                    style: AppTypography.title3.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  PremiumCard(
                    gradient: AppColors.primaryGradient,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'B2 Readiness',
                                style: AppTypography.headline.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                '${(progress.examReadiness * 100).round()}%',
                                style: AppTypography.largeTitle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 40,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(
                                progress.examReadiness >= 0.6
                                    ? 'You are on track!'
                                    : 'Keep practising daily',
                                style: AppTypography.subheadline.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProgressRing(
                          progress: progress.examReadiness,
                          size: 90,
                          strokeWidth: 8,
                          color: Colors.white,
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          center: Icon(
                            progress.examReadiness >= 0.6
                                ? Icons.check_rounded
                                : Icons.trending_up_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  // Mock Exam History
                  if (progress.mockExamResults.isNotEmpty) ...[
                    Text(
                      'Mock Exam History',
                      style: AppTypography.title3.copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    PremiumCard(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 100,
                            barGroups: progress.mockExamResults
                                .asMap()
                                .entries
                                .map((entry) => BarChartGroupData(
                                      x: entry.key,
                                      barRods: [
                                        BarChartRodData(
                                          toY: entry.value.percentage * 100,
                                          color: entry.value.percentage >= 0.6
                                              ? AppColors.success
                                              : AppColors.warning,
                                          width: 24,
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(6),
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList(),
                            titlesData: FlTitlesData(
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: const AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) => Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8),
                                    child: Text(
                                      'Test ${value.toInt() + 1}',
                                      style:
                                          AppTypography.caption2.copyWith(
                                        color: isDark
                                            ? AppColors.textTertiaryDark
                                            : AppColors.textTertiaryLight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                          ),
                        ),
                      ),
                    ),
                  ],

                  // Milestones
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Milestones',
                    style: AppTypography.title3.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  _MilestoneItem(
                    title: 'First Exercise',
                    description: 'Complete your first exercise',
                    isCompleted: progress.totalExercisesCompleted >= 1,
                    icon: Icons.star_rounded,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _MilestoneItem(
                    title: '10 Exercises',
                    description: 'Complete 10 exercises',
                    isCompleted: progress.totalExercisesCompleted >= 10,
                    icon: Icons.local_fire_department_rounded,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _MilestoneItem(
                    title: 'Mock Exam Pro',
                    description: 'Complete a mock exam',
                    isCompleted: progress.mockExamResults.isNotEmpty,
                    icon: Icons.assignment_turned_in_rounded,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _MilestoneItem(
                    title: '7-Day Streak',
                    description: 'Practice for 7 consecutive days',
                    isCompleted: progress.longestStreak >= 7,
                    icon: Icons.whatshot_rounded,
                  ),

                  const SizedBox(height: AppSpacing.xxl),
                ]),
              ),
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => const SliverFillRemaining(
                child: Center(child: Text('Error loading progress')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Text(
          value,
          style: AppTypography.title2.copyWith(
            color: color,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: AppTypography.caption1.copyWith(
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}

class _SkillBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;

  const _SkillBar({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTypography.subheadline.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            Text(
              '${(value * 100).round()}%',
              style: AppTypography.subheadline.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: color.withValues(alpha: 0.12),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}

class _MilestoneItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isCompleted;
  final IconData icon;

  const _MilestoneItem({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: isCompleted
              ? AppColors.success.withValues(alpha: 0.3)
              : (isDark ? AppColors.borderDark : AppColors.borderLight),
          width: isCompleted ? 1.5 : 0.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppColors.success.withValues(alpha: 0.12)
                  : (isDark ? AppColors.borderDark : AppColors.borderLight)
                      .withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isCompleted
                  ? AppColors.success
                  : (isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight),
              size: 20,
            ),
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
          if (isCompleted)
            const Icon(Icons.check_circle_rounded,
                color: AppColors.success, size: 24),
        ],
      ),
    );
  }
}
