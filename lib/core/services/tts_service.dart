import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { idle, playing }

class TtsService extends StateNotifier<TtsState> {
  final FlutterTts _tts = FlutterTts();

  TtsService() : super(TtsState.idle) {
    _init();
  }

  Future<void> _init() async {
    await _tts.setLanguage('en-GB');
    await _tts.setSpeechRate(0.45);
    await _tts.setPitch(1.0);
    await _tts.setVolume(1.0);

    _tts.setCompletionHandler(() => state = TtsState.idle);
    _tts.setCancelHandler(() => state = TtsState.idle);
    _tts.setErrorHandler((_) => state = TtsState.idle);
  }

  Future<void> speak(String text) async {
    await stop();
    state = TtsState.playing;
    await _tts.speak(text);
  }

  Future<void> stop() async {
    state = TtsState.idle;
    await _tts.stop();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }
}

final ttsProvider = StateNotifierProvider<TtsService, TtsState>((ref) {
  return TtsService();
});
