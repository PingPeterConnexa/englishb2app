import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../data/models/language_tool_result.dart';

final languageToolServiceProvider = Provider<LanguageToolService>((ref) {
  return LanguageToolService();
});

/// Free public [LanguageTool](https://languagetool.org) API — rule-based checks
/// (spelling, grammar, style hints). Not a generative LLM.
///
/// Fair-use limits apply (~20 requests/min on the public server).
/// Text is sent to LanguageTool over HTTPS (see their privacy policy).
class LanguageToolService {
  static const _url = 'https://api.languagetool.org/v2/check';

  Future<LanguageToolResult> checkText({
    required String text,
    String language = 'en-GB',
  }) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      return const LanguageToolResult(matches: []);
    }

    final response = await http
        .post(
          Uri.parse(_url),
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Accept': 'application/json',
          },
          body: {
            'text': text,
            'language': language,
          },
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 429) {
      throw LanguageToolException(
        'Too many checks right now. Please wait a minute and try again.',
      );
    }

    if (response.statusCode != 200) {
      throw LanguageToolException(
        'Service returned ${response.statusCode}. Try again later.',
      );
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final raw = json['matches'] as List<dynamic>? ?? [];
    final matches = raw
        .map((m) => LanguageToolMatch.fromJson(m as Map<String, dynamic>))
        .toList();

    return LanguageToolResult(matches: matches);
  }
}

class LanguageToolException implements Exception {
  final String message;
  LanguageToolException(this.message);

  @override
  String toString() => message;
}
