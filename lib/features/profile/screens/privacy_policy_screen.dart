import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.lg),

            Text(
              'Privacy Policy',
              style: AppTypography.title1.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Last updated: March 2026',
              style: AppTypography.footnote.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            _Section(
              title: 'Data We Collect',
              content:
                  'We collect the minimum data necessary to provide the ${AppConstants.appName} service:\n\n'
                  '• Account information (email, name)\n'
                  '• Learning progress and scores\n'
                  '• App usage analytics (anonymised)\n\n'
                  'We do not sell your personal data to third parties.',
            ),

            _Section(
              title: 'How We Use Your Data',
              content:
                  'Your data is used to:\n\n'
                  '• Provide personalised learning experiences\n'
                  '• Track your progress across sessions\n'
                  '• Improve the app based on aggregated usage patterns\n'
                  '• Send essential service communications',
            ),

            _Section(
              title: 'Data Storage & Security',
              content:
                  'Your data is stored securely using Firebase services (Google Cloud). '
                  'We implement industry-standard security measures to protect your information. '
                  'Data is encrypted in transit and at rest.',
            ),

            _Section(
              title: 'Your Rights (GDPR)',
              content:
                  'Under GDPR, you have the right to:\n\n'
                  '• Access your personal data\n'
                  '• Correct inaccurate data\n'
                  '• Request deletion of your data\n'
                  '• Export your data in a portable format\n'
                  '• Withdraw consent at any time\n\n'
                  'To exercise these rights, contact us or use the account deletion feature in the app.',
            ),

            _Section(
              title: 'Data Deletion',
              content:
                  'You can delete your account and all associated data at any time through '
                  'Profile > Delete Account. This action is permanent and cannot be undone.',
            ),

            _Section(
              title: 'Third-Party Services',
              content:
                  'We use the following third-party services:\n\n'
                  '• Firebase (Authentication, Database, Analytics)\n\n'
                  'Each service has its own privacy policy governing data handling.',
            ),

            _Section(
              title: 'Contact',
              content:
                  'For privacy-related inquiries, please visit:\n'
                  '${AppConstants.privacyPolicyUrl}',
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
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
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
          const SizedBox(height: AppSpacing.sm),
          Text(
            content,
            style: AppTypography.subheadline.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
