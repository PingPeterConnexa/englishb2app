import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class AudioPassageCard extends StatefulWidget {
  final String passage;
  final String? audioFile;
  final bool examMode;

  const AudioPassageCard({
    super.key,
    required this.passage,
    this.audioFile,
    this.examMode = false,
  });

  @override
  State<AudioPassageCard> createState() => _AudioPassageCardState();
}

class _AudioPassageCardState extends State<AudioPassageCard> {
  final AudioPlayer _player = AudioPlayer();
  bool _showTranscript = false;
  bool _isPlaying = false;
  int _playCount = 0;

  bool get _isListening => widget.passage.startsWith('[Audio Transcript]');
  bool get _hasPlayed => _playCount > 0;
  int get _maxPlays => widget.examMode ? 2 : 999;
  bool get _canPlayAgain => _playCount < _maxPlays;

  String get _cleanText =>
      widget.passage.replaceFirst('[Audio Transcript]\n', '').trim();

  @override
  void initState() {
    super.initState();
    _player.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
          if (state == PlayerState.completed) {
            _isPlaying = false;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _onPlayTap() async {
    if (widget.examMode) {
      await _examPlayback();
    } else {
      await _practicePlayback();
    }
  }

  Future<void> _practicePlayback() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      if (_playCount == 0 || _player.state == PlayerState.completed) {
        await _player.play(AssetSource(
          widget.audioFile!.replaceFirst('assets/', ''),
        ));
        setState(() => _playCount++);
      } else {
        await _player.resume();
      }
    }
  }

  Future<void> _examPlayback() async {
    if (_isPlaying || !_canPlayAgain) return;
    await _player.play(AssetSource(
      widget.audioFile!.replaceFirst('assets/', ''),
    ));
    setState(() => _playCount++);
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
    final hasAudio = widget.audioFile != null && widget.audioFile!.isNotEmpty;

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
              if (widget.examMode && hasAudio) ...[
                const SizedBox(width: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: _canPlayAgain
                        ? AppColors.listening.withValues(alpha: 0.12)
                        : AppColors.error.withValues(alpha: 0.12),
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(
                    '${_maxPlays - _playCount} plays left',
                    style: AppTypography.caption2.copyWith(
                      color: _canPlayAgain
                          ? AppColors.listening
                          : AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              if (hasAudio && (_canPlayAgain || _isPlaying))
                _PlayButton(
                  isPlaying: _isPlaying,
                  showPause: !widget.examMode,
                  onTap: _onPlayTap,
                ),
            ],
          ),

          if (hasAudio && _isPlaying) ...[
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

          if (hasAudio && !_isPlaying && !_hasPlayed) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              widget.examMode
                  ? 'Tap play to listen (max 2 times)'
                  : 'Tap play to listen',
              style: AppTypography.caption1.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
            ),
          ],

          if (hasAudio && !_canPlayAgain && !_isPlaying) ...[
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Icon(Icons.block_rounded,
                    color: AppColors.error.withValues(alpha: 0.6), size: 16),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'No plays remaining',
                  style: AppTypography.caption1.copyWith(
                    color: AppColors.error.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],

          if (!hasAudio) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              'Audio file not available',
              style: AppTypography.caption1.copyWith(
                color: isDark
                    ? AppColors.textTertiaryDark
                    : AppColors.textTertiaryLight,
              ),
            ),
          ],

          if (!widget.examMode) ...[
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
  final bool showPause;
  final VoidCallback onTap;

  const _PlayButton({
    required this.isPlaying,
    this.showPause = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final showAsPlaying = isPlaying && showPause;
    return GestureDetector(
      onTap: (isPlaying && !showPause) ? null : onTap,
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
          showAsPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
          color: isPlaying ? Colors.white : AppColors.listening,
          size: 22,
        ),
      ),
    );
  }
}
