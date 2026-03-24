/// One multiple-choice gap (Cambridge Reading & Use of English Part 1 style).
class ClozeGapData {
  final List<String> options;
  final int correctIndex;

  const ClozeGapData({
    required this.options,
    required this.correctIndex,
  });
}

/// Inline segment: plain text or a gap reference (0-based within this passage).
class ClozeBodyPiece {
  final String? text;
  final int? gapIndex;

  const ClozeBodyPiece.text(this.text) : gapIndex = null;

  const ClozeBodyPiece.gap(this.gapIndex) : text = null;
}

class ClozePassageData {
  final String id;
  final String title;
  final String instruction;
  final List<ClozeBodyPiece> pieces;
  final List<ClozeGapData> gaps;

  const ClozePassageData({
    required this.id,
    required this.title,
    required this.instruction,
    required this.pieces,
    required this.gaps,
  });

  int get gapCount => gaps.length;
}
