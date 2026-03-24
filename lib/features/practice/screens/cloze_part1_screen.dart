import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/haptic_utils.dart';
import '../../../data/content/cloze_part1_passages.dart';
import '../../../data/models/cloze_passage_model.dart';
import '../../../data/repositories/progress_repository.dart';
import '../../progress/providers/progress_provider.dart';

/// Multiple-choice gap-fill: several independent tasks (one passage each).
class ClozePart1Screen extends ConsumerStatefulWidget {
  const ClozePart1Screen({super.key});

  @override
  ConsumerState<ClozePart1Screen> createState() => _ClozePart1ScreenState();
}

class _ClozePart1ScreenState extends ConsumerState<ClozePart1Screen> {
  static const int _passageCount = 3;
  static const int _gapsPerPassage = 8;

  int _currentPassage = 0;

  /// Selected option index per passage × gap, or null if empty.
  late List<List<int?>> _choices;

  /// User tapped "Check answers" for this passage — show green/red feedback.
  late List<bool> _feedbackShown;

  /// First selection per gap already sent to progress.
  final Set<String> _recordedGapKeys = {};

  @override
  void initState() {
    super.initState();
    _choices = List.generate(
      _passageCount,
      (_) => List<int?>.filled(_gapsPerPassage, null),
    );
    _feedbackShown = List.filled(_passageCount, false);
  }

  int _filledOnPassage(int p) =>
      _choices[p].where((c) => c != null).length;

  double _progressForPassage(int p) =>
      _gapsPerPassage == 0 ? 0 : _filledOnPassage(p) / _gapsPerPassage;

  bool get _currentAllFilled =>
      _choices[_currentPassage].every((c) => c != null);

  bool get _currentFeedback => _feedbackShown[_currentPassage];

  Future<void> _recordGapIfNeeded(int passageIndex, int gapIndex, int optionIndex) async {
    final passage = ClozePart1Passages.all[passageIndex];
    final key = '${passage.id}_g$gapIndex';
    if (_recordedGapKeys.contains(key)) return;

    _recordedGapKeys.add(key);
    final correct = optionIndex == passage.gaps[gapIndex].correctIndex;
    await ref.read(progressRepositoryProvider).recordExerciseResult(
          exerciseId: key,
          isCorrect: correct,
          category: 'clozePart1',
        );
    ref.invalidate(progressProvider);
  }

  Future<void> _openGapMenu(
    BuildContext tapContext,
    int passageIndex,
    int gapIndex,
    Offset globalPosition,
  ) async {
    if (_feedbackShown[passageIndex]) return;

    final passage = ClozePart1Passages.all[passageIndex];
    final gap = passage.gaps[gapIndex];
    final overlay =
        Navigator.of(tapContext).overlay!.context.findRenderObject()! as RenderBox;
    final overlaySize = overlay.size;

    HapticUtils.selection();

    final selected = await showMenu<int>(
      context: tapContext,
      position: RelativeRect.fromRect(
        Rect.fromLTWH(globalPosition.dx, globalPosition.dy + 8, 0, 0),
        Offset.zero & overlaySize,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      items: [
        for (var i = 0; i < gap.options.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: Text(
              gap.options[i],
              style: AppTypography.body,
            ),
          ),
      ],
    );

    if (!mounted || selected == null) return;

    setState(() {
      _choices[passageIndex][gapIndex] = selected;
    });
    HapticUtils.light();
    await _recordGapIfNeeded(passageIndex, gapIndex, selected);
  }

  void _clearGap(int passageIndex, int gapIndex) {
    if (_feedbackShown[passageIndex]) return;
    HapticUtils.light();
    setState(() {
      _choices[passageIndex][gapIndex] = null;
    });
  }

  void _checkCurrentPassage() {
    if (!_currentAllFilled || _currentFeedback) return;
    HapticUtils.medium();
    setState(() => _feedbackShown[_currentPassage] = true);
  }

  void _tryAgainCurrentPassage() {
    HapticUtils.light();
    setState(() {
      _feedbackShown[_currentPassage] = false;
      _choices[_currentPassage] = List<int?>.filled(_gapsPerPassage, null);
    });
  }

  void _goBack() {
    if (_currentPassage > 0) {
      setState(() => _currentPassage--);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _goNext() {
    if (_currentPassage < _passageCount - 1) {
      setState(() => _currentPassage++);
    }
  }

  void _jumpToPassage(int index) {
    if (index == _currentPassage) return;
    setState(() => _currentPassage = index);
  }

  double _fixedGapWidth(
    BuildContext context,
    ClozeGapData gap,
    int displayNumber,
    TextStyle style,
  ) {
    final scaler = MediaQuery.textScalerOf(context);
    final painter = TextPainter(
      textDirection: TextDirection.ltr,
      textScaler: scaler,
    );
    var maxW = 0.0;
    for (final o in gap.options) {
      painter.text = TextSpan(text: o, style: style);
      painter.layout(maxWidth: double.infinity);
      maxW = math.max(maxW, painter.width);
    }
    painter.text = TextSpan(text: '$displayNumber', style: style);
    painter.layout(maxWidth: double.infinity);
    maxW = math.max(maxW, painter.width);
    // Reserve space for clear icon + padding so width never grows after fill.
    return maxW + 44;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final passage = ClozePart1Passages.all[_currentPassage];
    final chipStyle = AppTypography.subheadline.copyWith(
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gap fill',
          style: AppTypography.headline.copyWith(
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progressForPassage(_currentPassage),
            backgroundColor:
                isDark ? AppColors.borderDark : AppColors.borderLight,
            valueColor:
                const AlwaysStoppedAnimation<Color>(AppColors.clozePart1),
            minHeight: 3,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: AppSpacing.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Task ${_currentPassage + 1} · ${_filledOnPassage(_currentPassage)} of $_gapsPerPassage gaps',
                    style: AppTypography.footnote.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.surfaceDark
                          : AppColors.dividerLight,
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      passage.instruction,
                      style: AppTypography.caption1.copyWith(
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    passage.title,
                    style: AppTypography.title2.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _buildPassageBody(
                    context,
                    isDark,
                    passage,
                    _currentPassage,
                    chipStyle,
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                ],
              ),
            ),
          ),
          _buildFooter(isDark),
        ],
      ),
    );
  }

  Widget _buildPassageBody(
    BuildContext context,
    bool isDark,
    ClozePassageData passage,
    int passageIndex,
    TextStyle chipStyle,
  ) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      runSpacing: 10,
      children: [
        for (final piece in passage.pieces)
          if (piece.text != null)
            Text(
              piece.text!,
              style: AppTypography.body.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                height: 1.55,
              ),
            )
          else if (piece.gapIndex != null) ...[
            Builder(
              builder: (ctx) {
                final gi = piece.gapIndex!;
                final gap = passage.gaps[gi];
                final w = _fixedGapWidth(ctx, gap, gi + 1, chipStyle);
                final sel = _choices[passageIndex][gi];
                final label =
                    sel != null ? gap.options[sel] : null;
                final feedback = _feedbackShown[passageIndex];
                final correct = sel != null && sel == gap.correctIndex;
                return _GapChip(
                  fixedWidth: w,
                  displayNumber: gi + 1,
                  label: label,
                  feedback: feedback,
                  isCorrect: correct,
                  isEmpty: sel == null,
                  isDark: isDark,
                  onTapDown: (details) => _openGapMenu(
                    context,
                    passageIndex,
                    gi,
                    details.globalPosition,
                  ),
                  onClear: label != null && !feedback
                      ? () => _clearGap(passageIndex, gi)
                      : null,
                );
              },
            ),
          ],
      ],
    );
  }

  Widget _buildFooter(bool isDark) {
    return Material(
      elevation: 8,
      color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a task',
                style: AppTypography.caption2.copyWith(
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var p = 0; p < _passageCount; p++)
                      Padding(
                        padding: const EdgeInsets.only(right: AppSpacing.sm),
                        child: ChoiceChip(
                          label: Text(
                            'Task ${p + 1}  ${_filledOnPassage(p)}/$_gapsPerPassage',
                            style: AppTypography.caption1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: p == _currentPassage,
                          onSelected: (_) => _jumpToPassage(p),
                          selectedColor:
                              AppColors.clozePart1.withValues(alpha: 0.25),
                          labelStyle: AppTypography.caption1.copyWith(
                            color: p == _currentPassage
                                ? AppColors.clozePart1
                                : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                          ),
                          side: BorderSide(
                            color: p == _currentPassage
                                ? AppColors.clozePart1
                                : (isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight),
                            width: p == _currentPassage ? 1.5 : 1,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (_currentFeedback) ...[
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _tryAgainCurrentPassage,
                    icon: const Icon(Icons.refresh_rounded, size: 20),
                    label: const Text('Try again'),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed:
                        _currentAllFilled ? _checkCurrentPassage : null,
                    icon: const Icon(Icons.fact_check_rounded, size: 20),
                    label: const Text('Check answers'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: AppColors.primaryBlue
                          .withValues(alpha: 0.35),
                    ),
                  ),
                ),
                if (!_currentAllFilled)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Text(
                      'Fill all 8 gaps in this task to check (other tasks are optional).',
                      style: AppTypography.caption2.copyWith(
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                      ),
                    ),
                  ),
              ],
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  OutlinedButton.icon(
                    onPressed: _goBack,
                    icon: const Icon(Icons.arrow_back_rounded, size: 20),
                    label: Text(_currentPassage == 0 ? 'Close' : 'Previous task'),
                  ),
                  const Spacer(),
                  if (_currentPassage < _passageCount - 1)
                    FilledButton.icon(
                      onPressed: _goNext,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 20),
                      label: const Text('Next task'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.clozePart1,
                        foregroundColor: Colors.white,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GapChip extends StatelessWidget {
  final double fixedWidth;
  final int displayNumber;
  final String? label;
  final bool feedback;
  final bool isCorrect;
  final bool isEmpty;
  final bool isDark;
  final void Function(TapDownDetails details) onTapDown;
  final VoidCallback? onClear;

  const _GapChip({
    required this.fixedWidth,
    required this.displayNumber,
    required this.label,
    required this.feedback,
    required this.isCorrect,
    required this.isEmpty,
    required this.isDark,
    required this.onTapDown,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor;
    Color textColor;
    Color? bg;

    if (feedback) {
      if (isEmpty) {
        borderColor = AppColors.warning;
        textColor = AppColors.warning;
        bg = AppColors.warning.withValues(alpha: 0.08);
      } else if (isCorrect) {
        borderColor = AppColors.success;
        textColor = AppColors.success;
        bg = AppColors.success.withValues(alpha: 0.1);
      } else {
        borderColor = AppColors.error;
        textColor = AppColors.error;
        bg = AppColors.error.withValues(alpha: 0.08);
      }
    } else {
      final filled = label != null;
      borderColor = filled
          ? AppColors.primaryBlue
          : (isDark ? AppColors.borderDark : AppColors.borderLight);
      textColor = filled
          ? AppColors.primaryBlue
          : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);
      bg = filled
          ? AppColors.primaryBlue.withValues(alpha: 0.06)
          : (isDark ? AppColors.cardDark : Colors.white);
    }

    final inner = SizedBox(
      width: fixedWidth,
      height: 34,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: borderColor, width: feedback ? 2 : 1.5),
          boxShadow: feedback
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label ?? '$displayNumber',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppTypography.subheadline.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 13,
                ),
              ),
            ),
            if (onClear != null) ...[
              const SizedBox(width: 2),
              InkWell(
                onTap: onClear,
                child: Icon(
                  Icons.close_rounded,
                  size: 16,
                  color: isDark
                      ? AppColors.textTertiaryDark
                      : AppColors.textTertiaryLight,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    if (feedback) return inner;
    return GestureDetector(onTapDown: onTapDown, child: inner);
  }
}
