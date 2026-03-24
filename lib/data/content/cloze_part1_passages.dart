import '../models/cloze_passage_model.dart';

/// Three Cambridge-style multiple-choice cloze passages (8 gaps each), B2 level.
class ClozePart1Passages {
  ClozePart1Passages._();

  static const List<ClozePassageData> all = [
    _genealogy,
    _remoteWork,
    _urbanGreen,
  ];

  static const ClozePassageData _genealogy = ClozePassageData(
    id: 'cloze_part1_genealogy',
    title: 'What is genealogy?',
    instruction: 'For each question, choose the correct answer for each gap.',
    gaps: [
      // correctIndex: varied A–D (0–3) per gap — fixed shuffle, not cyclic.
      ClozeGapData(
        options: ['instead', 'except', 'sooner', 'rather'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['result', 'conclude', 'insist', 'consist'],
        correctIndex: 0,
      ),
      ClozeGapData(
        options: ['ignore', 'refuse', 'access', 'reject'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['delay', 'expense', 'concern', 'doubt'],
        correctIndex: 1,
      ),
      ClozeGapData(
        options: ['refuse', 'deny', 'find', 'doubt'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['hides', 'doubts', 'avoids', 'reveals'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['further', 'latest', 'longer', 'deeper'],
        correctIndex: 0,
      ),
      ClozeGapData(
        options: ['engaged', 'participated', 'involved', 'entered'],
        correctIndex: 1,
      ),
    ],
    pieces: [
      ClozeBodyPiece.text(
        'Genealogy is a branch of history. It concerns family history, ',
      ),
      ClozeBodyPiece.gap(0),
      ClozeBodyPiece.text(
        ' than the national or world history studied at school. It doesn\'t merely involve drawing a family tree, however – tracing your family history can also ',
      ),
      ClozeBodyPiece.gap(1),
      ClozeBodyPiece.text(
        ' in learning about your roots and your identity. The internet enables millions of people worldwide to ',
      ),
      ClozeBodyPiece.gap(2),
      ClozeBodyPiece.text(
        ' information about their family history, without great ',
      ),
      ClozeBodyPiece.gap(3),
      ClozeBodyPiece.text(
        '. People who research their family history often ',
      ),
      ClozeBodyPiece.gap(4),
      ClozeBodyPiece.text(
        ' that it\'s a fascinating hobby which ',
      ),
      ClozeBodyPiece.gap(5),
      ClozeBodyPiece.text(
        ' a lot about where they come from and whether they have famous ancestors. According to a survey involving 900 people who had researched their family history, the chances of discovering a celebrity in your past are one in ten. The survey also concluded that the ',
      ),
      ClozeBodyPiece.gap(6),
      ClozeBodyPiece.text(
        ' back you follow your family line, the more likely you are to find a relation who was much wealthier than you are. However, the vast majority of people who ',
      ),
      ClozeBodyPiece.gap(7),
      ClozeBodyPiece.text(
        ' in the survey discovered they were better off than their ancestors.',
      ),
    ],
  );

  static const ClozePassageData _remoteWork = ClozePassageData(
    id: 'cloze_part1_remote',
    title: 'The future of remote work',
    instruction: 'For each question, choose the correct answer for each gap.',
    gaps: [
      ClozeGapData(
        options: ['switch', 'shift', 'transfer', 'slide'],
        correctIndex: 1,
      ),
      ClozeGapData(
        options: ['Unless', 'Until', 'Although', 'While'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['boundaries', 'limits', 'edges', 'frames'],
        correctIndex: 0,
      ),
      ClozeGapData(
        options: ['distance', 'silence', 'isolation', 'privacy'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['compare', 'contact', 'compete', 'combine'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['employers', 'employees', 'customers', 'managers'],
        correctIndex: 0,
      ),
      ClozeGapData(
        options: ['popularity', 'priority', 'productivity', 'probability'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['adopt', 'adjust', 'admire', 'advise'],
        correctIndex: 1,
      ),
    ],
    pieces: [
      ClozeBodyPiece.text(
        'The widespread ',
      ),
      ClozeBodyPiece.gap(0),
      ClozeBodyPiece.text(
        ' to remote and hybrid arrangements has reshaped how organisations think about office space. ',
      ),
      ClozeBodyPiece.gap(1),
      ClozeBodyPiece.text(
        ' many workers welcome flexible schedules, the blurring of ',
      ),
      ClozeBodyPiece.gap(2),
      ClozeBodyPiece.text(
        ' between home and work has raised concerns about burnout and ',
      ),
      ClozeBodyPiece.gap(3),
      ClozeBodyPiece.text(
        '. Surveys suggest that the most successful teams are those that ',
      ),
      ClozeBodyPiece.gap(4),
      ClozeBodyPiece.text(
        ' clear communication habits with realistic expectations from ',
      ),
      ClozeBodyPiece.gap(5),
      ClozeBodyPiece.text(
        '. Measuring ',
      ),
      ClozeBodyPiece.gap(6),
      ClozeBodyPiece.text(
        ' remains difficult, yet companies continue to ',
      ),
      ClozeBodyPiece.gap(7),
      ClozeBodyPiece.text(
        ' their policies as the labour market evolves.',
      ),
    ],
  );

  static const ClozePassageData _urbanGreen = ClozePassageData(
    id: 'cloze_part1_green',
    title: 'Green space in cities',
    instruction: 'For each question, choose the correct answer for each gap.',
    gaps: [
      ClozeGapData(
        options: ['profits', 'rewards', 'benefits', 'savings'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['reduce', 'remove', 'repeat', 'replace'],
        correctIndex: 0,
      ),
      ClozeGapData(
        options: ['entrance', 'approach', 'arrival', 'access'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['probably', 'particularly', 'personally', 'previously'],
        correctIndex: 1,
      ),
      ClozeGapData(
        options: ['involvement', 'invention', 'invitation', 'investment'],
        correctIndex: 3,
      ),
      ClozeGapData(
        options: ['long-standing', 'long-lasting', 'long-term', 'long-suffering'],
        correctIndex: 2,
      ),
      ClozeGapData(
        options: ['experience', 'evidence', 'experiment', 'explanation'],
        correctIndex: 1,
      ),
      ClozeGapData(
        options: ['tackle', 'touch', 'tighten', 'translate'],
        correctIndex: 0,
      ),
    ],
    pieces: [
      ClozeBodyPiece.text(
        'Urban planners increasingly recognise that parks and tree-lined streets deliver measurable health ',
      ),
      ClozeBodyPiece.gap(0),
      ClozeBodyPiece.text(
        '. Green corridors can help ',
      ),
      ClozeBodyPiece.gap(1),
      ClozeBodyPiece.text(
        ' air pollution and moderate summer temperatures, but equal ',
      ),
      ClozeBodyPiece.gap(2),
      ClozeBodyPiece.text(
        ' to nature is not yet guaranteed for every neighbourhood, ',
      ),
      ClozeBodyPiece.gap(3),
      ClozeBodyPiece.text(
        ' in densely built districts. Critics argue that planting trees without sustained maintenance is poor ',
      ),
      ClozeBodyPiece.gap(4),
      ClozeBodyPiece.text(
        ', whereas supporters highlight ',
      ),
      ClozeBodyPiece.gap(5),
      ClozeBodyPiece.text(
        ' gains for mental well-being. Recent ',
      ),
      ClozeBodyPiece.gap(6),
      ClozeBodyPiece.text(
        ' from several European cities shows that coordinated policies can ',
      ),
      ClozeBodyPiece.gap(7),
      ClozeBodyPiece.text(
        ' both inequality and environmental risks if communities are involved from the outset.',
      ),
    ],
  );
}
