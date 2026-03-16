import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'progress_ring.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final int score;
  final int total;
  final String? subtitle;
  final List<ResultDetail>? details;

  const ResultCard({
    super.key,
    required this.title,
    required this.score,
    required this.total,
    this.subtitle,
    this.details,
  });

  double get _percentage => total > 0 ? score / total : 0;

  Color get _gradeColor {
    if (_percentage >= 0.85) return AppColors.success;
    if (_percentage >= 0.6) return AppColors.warning;
    return AppColors.error;
  }

  String get _gradeLabel {
    if (_percentage >= 0.85) return 'Excellent';
    if (_percentage >= 0.7) return 'Good';
    if (_percentage >= 0.6) return 'Pass';
    return 'Needs Practice';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
          width: 0.5,
        ),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTypography.title2.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              subtitle!,
              style: AppTypography.subheadline.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          ProgressRing(
            progress: _percentage,
            size: 140,
            strokeWidth: 12,
            color: _gradeColor,
            center: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${(_percentage * 100).round()}%',
                  style: AppTypography.title1.copyWith(
                    color: _gradeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _gradeLabel,
                  style: AppTypography.caption1.copyWith(
                    color: _gradeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '$score out of $total correct',
            style: AppTypography.body.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          if (details != null && details!.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            const Divider(),
            const SizedBox(height: AppSpacing.md),
            ...details!.map((detail) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        detail.label,
                        style: AppTypography.subheadline.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                      Text(
                        '${detail.score}/${detail.total}',
                        style: AppTypography.headline.copyWith(
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ],
      ),
    );
  }
}

class ResultDetail {
  final String label;
  final int score;
  final int total;

  const ResultDetail({
    required this.label,
    required this.score,
    required this.total,
  });
}
