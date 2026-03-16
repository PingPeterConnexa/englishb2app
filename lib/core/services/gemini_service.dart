import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../data/models/writing_feedback_model.dart';

const _apiKey = String.fromEnvironment('GEMINI_API_KEY');

final geminiServiceProvider = Provider<GeminiService>((ref) {
  return GeminiService();
});

class GeminiService {
  GenerativeModel? _model;

  bool get isConfigured => _apiKey.isNotEmpty;

  GenerativeModel _getModel() {
    _model ??= GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        temperature: 0.4,
        maxOutputTokens: 2048,
        responseMimeType: 'application/json',
      ),
    );
    return _model!;
  }

  Future<WritingFeedbackModel> analyzeWriting({
    required String userText,
    required String prompt,
  }) async {
    if (!isConfigured) {
      throw Exception('Gemini API key not configured');
    }

    final systemPrompt = '''
You are an expert B2 English (FCE / Cambridge) writing examiner.
Analyze the student's response to the given writing task.

Return a JSON object with EXACTLY this structure:
{
  "overallScore": <int 0-100>,
  "overallComment": "<1-2 sentence summary>",
  "grammarScore": <int 0-100>,
  "corrections": [
    {"original": "<wrong phrase>", "corrected": "<fixed phrase>", "explanation": "<short why>"}
  ],
  "vocabularyScore": <int 0-100>,
  "vocabularySuggestions": ["<suggestion 1>", "<suggestion 2>"],
  "coherenceScore": <int 0-100>,
  "coherenceComment": "<1-2 sentences about structure/flow>",
  "improvedVersion": "<full rewritten text with improvements>"
}

Rules:
- Scores should reflect B2 level expectations
- Be encouraging but honest
- Maximum 6 corrections
- Maximum 4 vocabulary suggestions
- The improved version should keep the student's ideas but fix errors and enhance style
- ALL text must be in English
''';

    final userMessage = '''
Writing task: $prompt

Student's response:
$userText
''';

    final response = await _getModel().generateContent([
      Content.system(systemPrompt),
      Content.text(userMessage),
    ]);

    final text = response.text;
    if (text == null || text.isEmpty) {
      throw Exception('Empty response from Gemini');
    }

    return _parseFeedback(text);
  }

  WritingFeedbackModel _parseFeedback(String jsonText) {
    final cleaned =
        jsonText.replaceAll('```json', '').replaceAll('```', '').trim();
    final map = jsonDecode(cleaned) as Map<String, dynamic>;

    final corrections = (map['corrections'] as List<dynamic>?)
            ?.map((c) => CorrectionItem(
                  original: c['original'] as String? ?? '',
                  corrected: c['corrected'] as String? ?? '',
                  explanation: c['explanation'] as String? ?? '',
                ))
            .toList() ??
        [];

    final vocabSuggestions = (map['vocabularySuggestions'] as List<dynamic>?)
            ?.map((s) => s.toString())
            .toList() ??
        [];

    return WritingFeedbackModel(
      overallScore: (map['overallScore'] as num?)?.toInt() ?? 0,
      overallComment: map['overallComment'] as String? ?? '',
      grammarScore: (map['grammarScore'] as num?)?.toInt() ?? 0,
      corrections: corrections,
      vocabularyScore: (map['vocabularyScore'] as num?)?.toInt() ?? 0,
      vocabularySuggestions: vocabSuggestions,
      coherenceScore: (map['coherenceScore'] as num?)?.toInt() ?? 0,
      coherenceComment: map['coherenceComment'] as String? ?? '',
      improvedVersion: map['improvedVersion'] as String? ?? '',
    );
  }
}
