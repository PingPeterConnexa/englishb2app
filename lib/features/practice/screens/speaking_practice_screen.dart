import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../data/content/sample_exercises.dart';

class SpeakingPracticeScreen extends StatefulWidget {
  const SpeakingPracticeScreen({super.key});

  @override
  State<SpeakingPracticeScreen> createState() => _SpeakingPracticeScreenState();
}

class _SpeakingPracticeScreenState extends State<SpeakingPracticeScreen> {
  int _selectedPromptIndex = 0;
  int _currentQuestionIndex = 0;
  bool _isTimerRunning = false;
  int _secondsElapsed = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    HapticUtils.medium();
    setState(() {
      _isTimerRunning = !_isTimerRunning;
      if (_isTimerRunning) {
        _secondsElapsed = 0;
        _timer = Timer.periodic(const Duration(seconds: 1), (_) {
          setState(() => _secondsElapsed++);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  String get _formattedTime {
    final minutes = _secondsElapsed ~/ 60;
    final seconds = _secondsElapsed % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final prompts = SampleExercises.speakingPrompts;
    final prompt = prompts[_selectedPromptIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Speaking Practice',
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
            const SizedBox(height: AppSpacing.md),

            // Topic selector
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: prompts.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedPromptIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.sm),
                    child: ChoiceChip(
                      label: Text('Topic ${index + 1}'),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedPromptIndex = index;
                            _currentQuestionIndex = 0;
                            _isTimerRunning = false;
                            _timer?.cancel();
                            _secondsElapsed = 0;
                          });
                        }
                      },
                      selectedColor: AppColors.primaryBlue,
                      labelStyle: AppTypography.footnote.copyWith(
                        color: isSelected ? Colors.white : null,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Topic card
            PremiumCard(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.speaking,
                  AppColors.speaking.withValues(alpha: 0.8),
                ],
              ),
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Topic',
                    style: AppTypography.footnote.copyWith(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    prompt.topic,
                    style: AppTypography.title2.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Suggested: ${prompt.suggestedDurationSeconds ~/ 60} min per question',
                    style: AppTypography.caption1.copyWith(
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Timer
            Center(
              child: Column(
                children: [
                  Text(
                    _formattedTime,
                    style: AppTypography.largeTitle.copyWith(
                      color: _isTimerRunning
                          ? AppColors.speaking
                          : (isDark
                              ? AppColors.textTertiaryDark
                              : AppColors.textTertiaryLight),
                      fontFeatures: const [FontFeature.tabularFigures()],
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: 180,
                    child: PrimaryButton(
                      label: _isTimerRunning ? 'Stop' : 'Start Speaking',
                      icon: _isTimerRunning
                          ? Icons.stop_rounded
                          : Icons.mic_rounded,
                      onPressed: _toggleTimer,
                      isExpanded: false,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Questions
            Text(
              'Questions',
              style: AppTypography.title3.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            ...List.generate(prompt.questions.length, (index) {
              final isActive = index == _currentQuestionIndex;
              return GestureDetector(
                onTap: () =>
                    setState(() => _currentQuestionIndex = index),
                child: AnimatedContainer(
                  duration: AppSpacing.animFast,
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.speaking.withValues(alpha: 0.08)
                        : (isDark ? AppColors.cardDark : AppColors.cardLight),
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusMd),
                    border: Border.all(
                      color: isActive
                          ? AppColors.speaking
                          : (isDark
                              ? AppColors.borderDark
                              : AppColors.borderLight),
                      width: isActive ? 1.5 : 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? AppColors.speaking
                              : (isDark
                                  ? AppColors.borderDark
                                  : AppColors.borderLight),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: AppTypography.headline.copyWith(
                              color: isActive
                                  ? Colors.white
                                  : (isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Text(
                          prompt.questions[index],
                          style: AppTypography.body.copyWith(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: AppSpacing.lg),

            // Tips
            PremiumCard(
              backgroundColor:
                  AppColors.primaryBlue.withValues(alpha: 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.tips_and_updates_rounded,
                          color: AppColors.primaryBlue, size: 20),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Speaking Tips',
                        style: AppTypography.headline.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  ...[
                    'Speak clearly and at a natural pace',
                    'Use a range of vocabulary and structures',
                    'Give reasons and examples to support your points',
                    'Try to speak for the full suggested time',
                  ].map(
                    (tip) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ',
                              style: AppTypography.subheadline.copyWith(
                                color: AppColors.primaryBlue,
                              )),
                          Expanded(
                            child: Text(
                              tip,
                              style: AppTypography.subheadline.copyWith(
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
