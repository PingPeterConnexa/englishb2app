import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/language_tool_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../data/content/sample_exercises.dart';
import '../../../data/models/language_tool_result.dart';

class WritingPracticeScreen extends ConsumerStatefulWidget {
  const WritingPracticeScreen({super.key});

  @override
  ConsumerState<WritingPracticeScreen> createState() =>
      _WritingPracticeScreenState();
}

class _WritingPracticeScreenState extends ConsumerState<WritingPracticeScreen> {
  int _selectedPromptIndex = 0;
  bool _showSample = false;
  bool _checking = false;
  String? _errorMessage;
  LanguageToolResult? _checkResult;
  final _writingController = TextEditingController();

  @override
  void dispose() {
    _writingController.dispose();
    super.dispose();
  }

  Future<void> _runCheck() async {
    final text = _writingController.text;
    if (text.trim().isEmpty) return;

    setState(() {
      _checking = true;
      _errorMessage = null;
      _checkResult = null;
    });

    try {
      final service = ref.read(languageToolServiceProvider);
      final result = await service.checkText(text: text);
      if (mounted) {
        setState(() {
          _checkResult = result;
          _checking = false;
        });
      }
    } on LanguageToolException catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.message;
          _checking = false;
        });
      }
    } catch (e) {
      if (mounted) {
        var msg = e.toString();
        if (kIsWeb &&
            (msg.contains('ClientException') ||
                msg.contains('Failed to fetch') ||
                msg.contains('XMLHttpRequest'))) {
          msg =
              'Could not reach the grammar service from the browser (network or CORS). '
              'Try again on Android/iOS, or check your connection.';
        }
        setState(() {
          _errorMessage = 'Check failed: $msg';
          _checking = false;
        });
      }
    }
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
                            _checkResult = null;
                            _errorMessage = null;
                            _writingController.clear();
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

            Text(
              'Your Response',
              style: AppTypography.headline.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Your device can underline spelling mistakes while you type. '
              'Tap “Check spelling & grammar” for suggestions (LanguageTool, free).',
              style: AppTypography.caption1.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _writingController,
              maxLines: 10,
              onChanged: (_) => setState(() {}),
              spellCheckConfiguration: SpellCheckConfiguration(
                spellCheckService: DefaultSpellCheckService(),
                misspelledTextStyle: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.error.withValues(alpha: 0.7),
                  decorationThickness: 1.5,
                ),
              ),
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

            PrimaryButton(
              label: _checking ? 'Checking…' : 'Check spelling & grammar',
              icon: Icons.spellcheck_rounded,
              isLoading: _checking,
              onPressed: _checking || _writingController.text.trim().isEmpty
                  ? null
                  : _runCheck,
            ),

            if (_errorMessage != null) ...[
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline_rounded,
                        color: AppColors.error, size: 20),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        _errorMessage!,
                        style: AppTypography.caption1.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            if (_checkResult != null) ...[
              const SizedBox(height: AppSpacing.lg),
              _buildCheckSummary(_checkResult!, isDark),
            ],

            const SizedBox(height: AppSpacing.lg),

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
                        const Icon(Icons.menu_book_rounded,
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

  Widget _buildCheckSummary(LanguageToolResult result, bool isDark) {
    final text = _writingController.text;
    if (!result.hasIssues) {
      return PremiumCard(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            const Icon(Icons.check_circle_rounded,
                color: AppColors.success, size: 28),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                'No spelling or grammar issues reported. '
                'You can still compare with the sample answer and checklist.',
                style: AppTypography.body.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${result.matches.length} suggestion${result.matches.length == 1 ? '' : 's'}',
          style: AppTypography.headline.copyWith(
            color: AppColors.writing,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        ...result.matches.asMap().entries.map((entry) {
          final i = entry.key + 1;
          final m = entry.value;
          final wrong = m.highlightedInFullText(text);
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: PremiumCard(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#$i',
                    style: AppTypography.caption2.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    m.message,
                    style: AppTypography.subheadline.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      height: 1.45,
                    ),
                  ),
                  if (wrong.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.06),
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Text(
                        wrong,
                        style: AppTypography.body.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                  if (m.replacementSuggestions.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Suggestions:',
                      style: AppTypography.caption1.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Wrap(
                      spacing: AppSpacing.xs,
                      runSpacing: AppSpacing.xs,
                      children: m.replacementSuggestions
                          .map(
                            (s) => Chip(
                              label: Text(s),
                              labelStyle: AppTypography.caption1,
                              visualDensity: VisualDensity.compact,
                              backgroundColor:
                                  AppColors.success.withValues(alpha: 0.12),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Powered by LanguageTool (rule-based). Text is sent over HTTPS for checking.',
          style: AppTypography.caption2.copyWith(
            color: isDark
                ? AppColors.textTertiaryDark
                : AppColors.textTertiaryLight,
          ),
        ),
      ],
    );
  }
}
