import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

class PremiumCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final Color? backgroundColor;

  const PremiumCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.gradient,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppSpacing.animFast,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null
              ? (backgroundColor ??
                  (isDark ? AppColors.cardDark : AppColors.cardLight))
              : null,
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          border: gradient == null
              ? Border.all(
                  color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  width: 0.5,
                )
              : null,
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Padding(
          padding: padding ?? AppSpacing.cardPadding,
          child: child,
        ),
      ),
    );
  }
}
