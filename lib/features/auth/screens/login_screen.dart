import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/constants.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  final _nameController = TextEditingController();
  bool _acceptedPrivacy = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authState = ref.watch(authProvider);

    ref.listen<AuthState>(authProvider, (_, state) {
      if (state.status == AuthStatus.authenticated) {
        context.go('/home');
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xxl),
              Text(
                AppConstants.appName,
                style: AppTypography.title2.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                _isSignUp ? 'Create your account' : 'Welcome back',
                style: AppTypography.largeTitle.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                AppConstants.appDescription,
                style: AppTypography.body.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // Apple Sign-In button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      ref.read(authProvider.notifier).signInWithApple(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? Colors.white : Colors.black,
                    foregroundColor:
                        isDark ? Colors.black : Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                  ),
                  icon: const Icon(Icons.apple, size: 24),
                  label: Text(
                    'Continue with Apple',
                    style: AppTypography.headline.copyWith(
                      color: isDark ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(child: Divider(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md),
                    child: Text(
                      'or',
                      style: AppTypography.footnote.copyWith(
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                  )),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),

              if (_isSignUp) ...[
                Text('Name', style: AppTypography.footnote.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                )),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Your name',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              Text('Email', style: AppTypography.footnote.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontWeight: FontWeight.w600,
              )),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'your@email.com',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),

              Text('Password', style: AppTypography.footnote.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontWeight: FontWeight.w600,
              )),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),

              if (_isSignUp) ...[
                const SizedBox(height: AppSpacing.md),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _acceptedPrivacy,
                        onChanged: (v) =>
                            setState(() => _acceptedPrivacy = v ?? false),
                        activeColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        'I agree to the Privacy Policy and consent to data processing as described.',
                        style: AppTypography.footnote.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: AppSpacing.lg),

              if (authState.error != null) ...[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.errorLight,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Text(
                    authState.error!,
                    style: AppTypography.footnote
                        .copyWith(color: AppColors.error),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              PrimaryButton(
                label: _isSignUp ? 'Create Account' : 'Sign In',
                isLoading: authState.status == AuthStatus.loading,
                onPressed: () {
                  if (_isSignUp) {
                    if (!_acceptedPrivacy) return;
                    ref.read(authProvider.notifier).signUp(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                        );
                  } else {
                    ref.read(authProvider.notifier).signInWithEmail(
                          _emailController.text,
                          _passwordController.text,
                        );
                  }
                },
              ),

              const SizedBox(height: AppSpacing.md),
              Center(
                child: TextButton(
                  onPressed: () => setState(() => _isSignUp = !_isSignUp),
                  child: Text(
                    _isSignUp
                        ? 'Already have an account? Sign In'
                        : "Don't have an account? Sign Up",
                    style: AppTypography.subheadline.copyWith(
                      color: AppColors.primaryBlue,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.sm),
              Center(
                child: TextButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).skipAuth();
                  },
                  child: Text(
                    'Continue as Guest',
                    style: AppTypography.subheadline.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),
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
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
