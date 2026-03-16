import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/gemini_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/premium_card.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../data/content/sample_exercises.dart';
import '../../../data/models/writing_feedback_model.dart';

class WritingPracticeScreen extends ConsumerStatefulWidget {
  const WritingPracticeScreen({super.key});

  @override
  ConsumerState<WritingPracticeScreen> createState() =>
      _WritingPracticeScreenState();
}

class _WritingPracticeScreenState extends ConsumerState<WritingPracticeScreen> {
  int _selectedPromptIndex = 0;
  bool _showSample = false;
  bool _showImproved = false;
  bool _isAnalyzing = false;
  String? _errorMessage;
  WritingFeedbackModel? _feedback;
  final _writingController = TextEditingController();

  @override
  void dispose() {
    _writingController.dispose();
    super.dispose();
  }

  Future<void> _analyzeWriting() async {
    final text = _writingController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isAnalyzing = true;
      _errorMessage = null;
      _feedback = null;
    });

    try {
      final gemini = ref.read(geminiServiceProvider);
      final prompt = SampleExercises.writingPrompts[_selectedPromptIndex];
      final feedback = await gemini.analyzeWriting(
        userText: text,
        prompt: prompt.prompt,
      );
      if (mounted) {
        setState(() {
          _feedback = feedback;
          _isAnalyzing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        final msg = e.toString();
        String displayMsg;
        if (msg.contains('API key') && msg.contains('not configured')) {
          displayMsg =
              'Gemini API key not configured. Run with:\n--dart-define=GEMINI_API_KEY=your_key';
        } else {
          displayMsg = 'Analysis failed: $msg';
        }
        setState(() {
          _errorMessage = displayMsg;
          _isAnalyzing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final prompts = SampleExercises.writingPrompts;
    final prompt = prompts[_selectedPromptIndex];
    final gemini = ref.read(geminiServiceProvider);

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
                            _feedback = null;
                            _errorMessage = null;
                            _showImproved = false;
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

            if (gemini.isConfigured) ...[
              PrimaryButton(
                label: _isAnalyzing ? 'Analyzing...' : 'Check with AI',
                icon: Icons.auto_awesome_rounded,
                isLoading: _isAnalyzing,
                onPressed: _isAnalyzing || _writingController.text.trim().isEmpty
                    ? null
                    : _analyzeWriting,
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            if (_errorMessage != null) ...[
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
              const SizedBox(height: AppSpacing.md),
            ],

            if (_feedback != null) ...[
              _buildFeedbackSection(isDark),
              const SizedBox(height: AppSpacing.lg),
            ],

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

  Widget _buildFeedbackSection(bool isDark) {
    final fb = _feedback!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildScoreOverview(fb, isDark),
        const SizedBox(height: AppSpacing.md),
        if (fb.corrections.isNotEmpty) ...[
          _buildCorrections(fb.corrections, isDark),
          const SizedBox(height: AppSpacing.md),
        ],
        if (fb.vocabularySuggestions.isNotEmpty) ...[
          _buildVocabSuggestions(fb.vocabularySuggestions, isDark),
          const SizedBox(height: AppSpacing.md),
        ],
        _buildCoherence(fb, isDark),
        const SizedBox(height: AppSpacing.md),
        _buildImprovedVersion(fb.improvedVersion, isDark),
      ],
    );
  }

  Widget _buildScoreOverview(WritingFeedbackModel fb, bool isDark) {
    return PremiumCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded,
                  color: AppColors.primaryBlue, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'AI Feedback',
                style: AppTypography.headline.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm, vertical: 4),
                decoration: BoxDecoration(
                  color: _scoreColor(fb.overallScore).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                ),
                child: Text(
                  '${fb.overallScore}/100',
                  style: AppTypography.headline.copyWith(
                    color: _scoreColor(fb.overallScore),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            fb.overallComment,
            style: AppTypography.body.copyWith(
              color: isDark
                  ? AppColors.textPrimaryDark
                  : AppColors.textPrimaryLight,
              height: 1.5,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                  child: _ScorePill(
                      label: 'Grammar', score: fb.grammarScore)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                  child: _ScorePill(
                      label: 'Vocabulary', score: fb.vocabularyScore)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                  child: _ScorePill(
                      label: 'Coherence', score: fb.coherenceScore)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCorrections(List<CorrectionItem> corrections, bool isDark) {
    return PremiumCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.spellcheck_rounded,
                  color: AppColors.error, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Corrections',
                style: AppTypography.headline.copyWith(
                  color: AppColors.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...corrections.map((c) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: c.original,
                            style: AppTypography.body.copyWith(
                              color: AppColors.error,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const TextSpan(text: '  →  '),
                          TextSpan(
                            text: c.corrected,
                            style: AppTypography.body.copyWith(
                              color: AppColors.success,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        style: AppTypography.body.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      c.explanation,
                      style: AppTypography.caption1.copyWith(
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildVocabSuggestions(List<String> suggestions, bool isDark) {
    return PremiumCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline_rounded,
                  color: AppColors.writing, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Vocabulary Tips',
                style: AppTypography.headline.copyWith(
                  color: AppColors.writing,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...suggestions.map((s) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•  ',
                        style: AppTypography.body.copyWith(
                            color: AppColors.writing,
                            fontWeight: FontWeight.w700)),
                    Expanded(
                      child: Text(
                        s,
                        style: AppTypography.subheadline.copyWith(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildCoherence(WritingFeedbackModel fb, bool isDark) {
    return PremiumCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.connect_without_contact_rounded,
                  color: AppColors.primaryBlue, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Coherence & Structure',
                style: AppTypography.headline.copyWith(
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            fb.coherenceComment,
            style: AppTypography.subheadline.copyWith(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImprovedVersion(String improved, bool isDark) {
    if (improved.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => setState(() => _showImproved = !_showImproved),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                  color: AppColors.success.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.auto_fix_high_rounded,
                    color: AppColors.success, size: 20),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  _showImproved
                      ? 'Hide Improved Version'
                      : 'Show Improved Version',
                  style: AppTypography.headline.copyWith(
                    color: AppColors.success,
                  ),
                ),
                const Spacer(),
                Icon(
                  _showImproved
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
                  color: AppColors.success,
                ),
              ],
            ),
          ),
        ),
        if (_showImproved) ...[
          const SizedBox(height: AppSpacing.sm),
          PremiumCard(
            backgroundColor: AppColors.success.withValues(alpha: 0.05),
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              improved,
              style: AppTypography.subheadline.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                height: 1.6,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Color _scoreColor(int score) {
    if (score >= 80) return AppColors.success;
    if (score >= 60) return AppColors.writing;
    return AppColors.error;
  }
}

class _ScorePill extends StatelessWidget {
  final String label;
  final int score;

  const _ScorePill({required this.label, required this.score});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color color;
    if (score >= 80) {
      color = AppColors.success;
    } else if (score >= 60) {
      color = AppColors.writing;
    } else {
      color = AppColors.error;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Column(
        children: [
          Text(
            '$score',
            style: AppTypography.title3.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTypography.caption2.copyWith(
              color: isDark
                  ? AppColors.textTertiaryDark
                  : AppColors.textTertiaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
