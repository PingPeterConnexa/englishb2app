class UserModel {
  final String userId;
  final String email;
  final String? displayName;
  final String level;
  final int streak;
  final DateTime createdAt;
  final List<String> completedLessons;
  final Map<String, double> examScores;
  final bool hasCompletedOnboarding;
  final bool hasAcceptedPrivacy;

  const UserModel({
    required this.userId,
    required this.email,
    this.displayName,
    this.level = 'B2',
    this.streak = 0,
    required this.createdAt,
    this.completedLessons = const [],
    this.examScores = const {},
    this.hasCompletedOnboarding = false,
    this.hasAcceptedPrivacy = false,
  });

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'email': email,
        'displayName': displayName,
        'level': level,
        'streak': streak,
        'createdAt': createdAt.toIso8601String(),
        'completedLessons': completedLessons,
        'examScores': examScores,
        'hasCompletedOnboarding': hasCompletedOnboarding,
        'hasAcceptedPrivacy': hasAcceptedPrivacy,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        userId: map['userId'] as String,
        email: map['email'] as String,
        displayName: map['displayName'] as String?,
        level: map['level'] as String? ?? 'B2',
        streak: map['streak'] as int? ?? 0,
        createdAt: DateTime.parse(map['createdAt'] as String),
        completedLessons:
            List<String>.from(map['completedLessons'] as List? ?? []),
        examScores:
            Map<String, double>.from(map['examScores'] as Map? ?? {}),
        hasCompletedOnboarding:
            map['hasCompletedOnboarding'] as bool? ?? false,
        hasAcceptedPrivacy: map['hasAcceptedPrivacy'] as bool? ?? false,
      );

  UserModel copyWith({
    String? displayName,
    String? level,
    int? streak,
    List<String>? completedLessons,
    Map<String, double>? examScores,
    bool? hasCompletedOnboarding,
    bool? hasAcceptedPrivacy,
  }) =>
      UserModel(
        userId: userId,
        email: email,
        displayName: displayName ?? this.displayName,
        level: level ?? this.level,
        streak: streak ?? this.streak,
        createdAt: createdAt,
        completedLessons: completedLessons ?? this.completedLessons,
        examScores: examScores ?? this.examScores,
        hasCompletedOnboarding:
            hasCompletedOnboarding ?? this.hasCompletedOnboarding,
        hasAcceptedPrivacy: hasAcceptedPrivacy ?? this.hasAcceptedPrivacy,
      );
}
