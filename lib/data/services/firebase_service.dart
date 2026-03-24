// Firebase service layer.
//
// Uncomment and configure when Firebase is set up via `flutterfire configure`.
// Integration points: Auth, Firestore, Analytics, Remote Config, Storage.

class FirebaseService {
  // Singleton
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  /// Firestore collection references
  static const String usersCollection = 'users';
  static const String progressCollection = 'progress';
  static const String exercisesCollection = 'exercises';
  static const String mockTestsCollection = 'mock_tests';
  static const String resultsCollection = 'results';
  static const String lessonsCollection = 'lessons';

  /// Exercise sub-collections by category
  static const String readingPath = 'exercises/reading';
  static const String useOfEnglishPath = 'exercises/use_of_english';
  static const String listeningPath = 'exercises/listening';
  static const String writingPath = 'exercises/writing';
  static const String clozePart1Path = 'exercises/cloze_part1';

  /// Remote Config keys for premium feature flags
  static const String flagUnlimitedMockExams = 'premium_unlimited_mock_exams';
  static const String flagAdvancedStats = 'premium_advanced_stats';
  static const String flagAiClozeHints = 'premium_ai_cloze_hints';
  static const String flagPersonalStudyPlan = 'premium_personal_study_plan';

  // Future<void> initialize() async {
  //   await Firebase.initializeApp();
  //   await _initRemoteConfig();
  //   await _initAnalytics();
  // }

  // Future<void> _initRemoteConfig() async {
  //   final remoteConfig = FirebaseRemoteConfig.instance;
  //   await remoteConfig.setDefaults({
  //     flagUnlimitedMockExams: false,
  //     flagAdvancedStats: false,
  //     flagAiClozeHints: false,
  //     flagPersonalStudyPlan: false,
  //   });
  //   await remoteConfig.fetchAndActivate();
  // }

  // Future<void> _initAnalytics() async {
  //   await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  // }

  // bool isPremiumFeatureEnabled(String flagKey) {
  //   return FirebaseRemoteConfig.instance.getBool(flagKey);
  // }
}
