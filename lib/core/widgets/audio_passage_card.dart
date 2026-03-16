import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/tts_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class AudioPassageCard extends ConsumerStatefulWidget {
  final String passage;

  const AudioPassageCard({super.key, required this.passage});

  @override
  ConsumerState<AudioPassageCard> createState() => _AudioPassageCardState();
}

class _AudioPassageCardState extends ConsumerState<AudioPassageCard> {
  bool _showTranscript = false;
  bool _hasPlayed = false;

  bool get _isListening => widget.passage.startsWith('[Audio Transcript]');

  String get _cleanText =>
      widget.passage.replaceFirst('[Audio Transcript]\n', '').trim();

  @override
  void dispose() {
    ref.read(ttsProvider.notifier).stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isListening) {
      return _buildReadingCard(context);
    }
    return _buildListeningCard(context);
  }

  Widget _buildReadingCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.dividerLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Text(
        widget.passage,
        style: AppTypography.subheadline.copyWith(
          color: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          height: 1.6,
        ),
      ),
    );
  }

  Widget _buildListeningCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ttsState = ref.watch(ttsProvider);
    final isPlaying = ttsState == TtsState.playing;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.dividerLight,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: AppColors.listening.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.headphones_rounded,
                color: AppColors.listening,
                size: 20,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'Listening',
                style: AppTypography.headline.copyWith(
                  color: AppColors.listening,
                ),
              ),
              const Spacer(),
              _PlayButton(
                isPlaying: isPlaying,
                onTap: () async {
                  if (isPlaying) {
                    await ref.read(ttsProvider.notifier).stop();
                  } else {
                    await ref.read(ttsProvider.notifier).speak(_cleanText);
                    if (!_hasPlayed) {
                      setState(() => _hasPlayed = true);
                    }
                  }
                },
              ),
            ],
          ),

          if (isPlaying) ...[
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              child: LinearProgressIndicator(
                backgroundColor: AppColors.listening.withValues(alpha: 0.12),
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.listening),
                minHeight: 4,
              ),
            ),
          ],

          if (!isPlaying && !_hasPlayed) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'Tap play to listen',
              style: AppTypography.caption1.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
            ),
          ],

          if (_hasPlayed && !isPlaying) ...[
            const SizedBox(height: AppSpacing.sm),
            GestureDetector(
              onTap: () => setState(() => _showTranscript = !_showTranscript),
              child: Row(
                children: [
                  Icon(
                    _showTranscript
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: AppColors.listening,
                    size: 18,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    _showTranscript ? 'Hide transcript' : 'Show transcript',
                    style: AppTypography.caption1.copyWith(
                      color: AppColors.listening,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (_showTranscript) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              _cleanText,
              style: AppTypography.subheadline.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                height: 1.6,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const _PlayButton({required this.isPlaying, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppSpacing.animFast,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isPlaying
              ? AppColors.listening
              : AppColors.listening.withValues(alpha: 0.12),
          shape: BoxShape.circle,
        ),
        child: Icon(
          isPlaying ? Icons.stop_rounded : Icons.play_arrow_rounded,
          color: isPlaying ? Colors.white : AppColors.listening,
          size: 22,
        ),
      ),
    );
  }
}
