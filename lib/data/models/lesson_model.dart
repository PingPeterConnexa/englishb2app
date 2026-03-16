import 'exercise_model.dart';

class LessonModel {
  final String id;
  final String title;
  final String description;
  final ExerciseCategory category;
  final Difficulty difficulty;
  final int exerciseCount;
  final int estimatedMinutes;
  final List<String> exerciseIds;
  final bool isPremium;

  const LessonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.difficulty,
    required this.exerciseCount,
    this.estimatedMinutes = 15,
    this.exerciseIds = const [],
    this.isPremium = false,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'category': category.name,
        'difficulty': difficulty.name,
        'exerciseCount': exerciseCount,
        'estimatedMinutes': estimatedMinutes,
        'exerciseIds': exerciseIds,
        'isPremium': isPremium,
      };

  factory LessonModel.fromMap(Map<String, dynamic> map) => LessonModel(
        id: map['id'] as String,
        title: map['title'] as String,
        description: map['description'] as String,
        category: ExerciseCategory.values.byName(map['category'] as String),
        difficulty: Difficulty.values.byName(map['difficulty'] as String),
        exerciseCount: map['exerciseCount'] as int,
        estimatedMinutes: map['estimatedMinutes'] as int? ?? 15,
        exerciseIds: List<String>.from(map['exerciseIds'] as List? ?? []),
        isPremium: map['isPremium'] as bool? ?? false,
      );
}
