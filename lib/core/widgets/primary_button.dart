import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import '../utils/haptic_utils.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isExpanded;
  final IconData? icon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.isExpanded = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: 56,
      child: ElevatedButton(
        onPressed: (isLoading || onPressed == null)
            ? null
            : () {
                HapticUtils.light();
                onPressed!();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isDark ? AppColors.accentBlue : AppColors.primaryBlue,
          foregroundColor: Colors.white,
          disabledBackgroundColor:
              isDark ? AppColors.accentBlue.withValues(alpha: 0.3) : AppColors.primaryBlue.withValues(alpha: 0.3),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisSize:
                    isExpanded ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Text(label, style: AppTypography.headline.copyWith(
                    color: Colors.white,
                  )),
                ],
              ),
      ),
    );
  }
}
