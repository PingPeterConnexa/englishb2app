import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class ScoreIndicator extends StatelessWidget {
  final int score;
  final int total;
  final String label;
  final double size;

  const ScoreIndicator({
    super.key,
    required this.score,
    required this.total,
    this.label = 'Score',
    this.size = 80,
  });

  double get _percentage => total > 0 ? score / total : 0;

  Color get _color {
    if (_percentage >= 0.85) return AppColors.success;
    if (_percentage >= 0.6) return AppColors.warning;
    return AppColors.error;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  value: _percentage,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                  backgroundColor: _color.withValues(alpha: 0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(_color),
                ),
              ),
              Text(
                '$score/$total',
                style: AppTypography.headline.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
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
