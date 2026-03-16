class WritingFeedbackModel {
  final int overallScore;
  final String overallComment;
  final int grammarScore;
  final List<CorrectionItem> corrections;
  final int vocabularyScore;
  final List<String> vocabularySuggestions;
  final int coherenceScore;
  final String coherenceComment;
  final String improvedVersion;

  const WritingFeedbackModel({
    required this.overallScore,
    required this.overallComment,
    required this.grammarScore,
    required this.corrections,
    required this.vocabularyScore,
    required this.vocabularySuggestions,
    required this.coherenceScore,
    required this.coherenceComment,
    required this.improvedVersion,
  });
}

class CorrectionItem {
  final String original;
  final String corrected;
  final String explanation;

  const CorrectionItem({
    required this.original,
    required this.corrected,
    required this.explanation,
  });
}
