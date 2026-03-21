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
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isSignUp = false;
  bool _acceptedPrivacy = false;
  String? _localError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  String? _validateEmailPassword() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty) {
      return 'Please enter your email address.';
    }
    if (!email.contains('@') || !email.contains('.')) {
      return 'Please enter a valid email address.';
    }
    if (password.isEmpty) {
      return 'Please enter your password.';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters.';
    }
    return null;
  }

  String? _validateSignUp() {
    final base = _validateEmailPassword();
    if (base != null) return base;

    final confirm = _confirmPasswordController.text;
    if (confirm != _passwordController.text) {
      return 'Passwords do not match. Please check and try again.';
    }
    if (!_acceptedPrivacy) {
      return 'Please accept the privacy policy to create an account.';
    }
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      return 'Please enter your name.';
    }
    return null;
  }

  void _submit() {
    setState(() => _localError = null);

    if (_isSignUp) {
      final err = _validateSignUp();
      if (err != null) {
        setState(() => _localError = err);
        return;
      }
      ref.read(authProvider.notifier).signUp(
            _emailController.text.trim(),
            _passwordController.text,
            _nameController.text.trim(),
          );
    } else {
      final err = _validateEmailPassword();
      if (err != null) {
        setState(() => _localError = err);
        return;
      }
      ref.read(authProvider.notifier).signInWithEmail(
            _emailController.text.trim(),
            _passwordController.text,
          );
    }
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

    final displayError = _localError ?? authState.error;

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

              if (_isSignUp) ...[
                Text(
                  'Name',
                  style: AppTypography.footnote.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Your name',
                  ),
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              Text(
                'Email',
                style: AppTypography.footnote.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'your@email.com',
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),

              Text(
                'Password',
                style: AppTypography.footnote.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                obscureText: true,
                textInputAction:
                    _isSignUp ? TextInputAction.next : TextInputAction.done,
                onSubmitted: (_) {
                  if (!_isSignUp) _submit();
                },
              ),

              if (_isSignUp) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Confirm password',
                  style: AppTypography.footnote.copyWith(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    hintText: 'Re-enter your password',
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                ),
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

              if (displayError != null) ...[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.errorLight,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Text(
                    displayError,
                    style: AppTypography.footnote
                        .copyWith(color: AppColors.error),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
              ],

              PrimaryButton(
                label: _isSignUp ? 'Create Account' : 'Sign In',
                isLoading: authState.status == AuthStatus.loading,
                onPressed: _submit,
              ),

              const SizedBox(height: AppSpacing.md),
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isSignUp = !_isSignUp;
                      _localError = null;
                      _confirmPasswordController.clear();
                      ref.read(authProvider.notifier).clearError();
                    });
                  },
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
