/// Result from LanguageTool (rule-based spelling & grammar), not generative AI.
class LanguageToolMatch {
  final String message;
  final int offset;
  final int length;
  final List<String> replacementSuggestions;
  final String contextText;
  final int contextOffset;

  const LanguageToolMatch({
    required this.message,
    required this.offset,
    required this.length,
    required this.replacementSuggestions,
    required this.contextText,
    required this.contextOffset,
  });

  factory LanguageToolMatch.fromJson(Map<String, dynamic> json) {
    final reps = (json['replacements'] as List<dynamic>?) ?? [];
    final context = json['context'] as Map<String, dynamic>?;
    return LanguageToolMatch(
      message: json['message']?.toString() ?? '',
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      length: (json['length'] as num?)?.toInt() ?? 0,
      replacementSuggestions: reps
          .map((r) => (r as Map<String, dynamic>)['value']?.toString() ?? '')
          .where((s) => s.isNotEmpty)
          .take(6)
          .toList(),
      contextText: context?['text']?.toString() ?? '',
      contextOffset: (context?['offset'] as num?)?.toInt() ?? 0,
    );
  }

  String highlightedInFullText(String fullText) {
    if (offset < 0 ||
        length <= 0 ||
        offset + length > fullText.length) {
      return contextText;
    }
    return fullText.substring(offset, offset + length);
  }
}

class LanguageToolResult {
  final List<LanguageToolMatch> matches;

  const LanguageToolResult({required this.matches});

  bool get hasIssues => matches.isNotEmpty;
}
