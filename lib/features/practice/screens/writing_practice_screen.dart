import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../data/content/sample_exercises.dart';

class WritingPracticeScreen extends ConsumerStatefulWidget {
  const WritingPracticeScreen({super.key});

  @override
  ConsumerState<WritingPracticeScreen> createState() =>
      _WritingPracticeScreenState();
}

class _WritingPracticeScreenState extends ConsumerState<WritingPracticeScreen> {
  int _selectedPromptIndex = 0;
  bool _showSample = false;
  final _writingController = TextEditingController();

  @override
  void dispose() {
    _writingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final prompts = SampleExercises.writingPrompts;
    final prompt = prompts[_selectedPromptIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Writing Practice',
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

            // Prompt selector
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
                      label: Text('Prompt ${index + 1}'),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedPromptIndex = index;
                            _showSample = false;
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

            // Prompt
            PremiumCard(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.create_rounded,
                          color: AppColors.writing, size: 20),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'Writing Task',
                        style: AppTypography.headline.copyWith(
                          color: AppColors.writing,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    prompt.prompt,
                    style: AppTypography.body.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Writing area
            Text(
              'Your Response',
              style: AppTypography.headline.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _writingController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Start writing here...',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
              ),
              style: AppTypography.body.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                height: 1.6,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // Evaluation checklist
            Text(
              'Evaluation Checklist',
              style: AppTypography.headline.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            ...prompt.evaluationChecklist.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.check_circle_outline_rounded,
                        color: AppColors.success, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        item,
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

            const SizedBox(height: AppSpacing.lg),

            // Show/hide sample answer
            PrimaryButton(
              label: _showSample ? 'Hide Sample Answer' : 'Show Sample Answer',
              icon: _showSample
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              onPressed: () => setState(() => _showSample = !_showSample),
            ),

            if (_showSample) ...[
              const SizedBox(height: AppSpacing.lg),
              PremiumCard(
                backgroundColor: AppColors.success.withValues(alpha: 0.05),
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome_rounded,
                            color: AppColors.success, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Sample Answer',
                          style: AppTypography.headline.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      prompt.sampleAnswer,
                      style: AppTypography.subheadline.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }
}
