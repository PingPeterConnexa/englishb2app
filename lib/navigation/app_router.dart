import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/screens/onboarding_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/home/screens/daily_task_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/practice/screens/practice_screen.dart';
import '../features/practice/screens/exercise_screen.dart';
import '../features/practice/screens/writing_practice_screen.dart';
import '../features/practice/screens/cloze_part1_screen.dart';
import '../features/mock_exam/screens/mock_exam_screen.dart';
import '../features/mock_exam/screens/exam_session_screen.dart';
import '../features/mock_exam/screens/exam_result_screen.dart';
import '../features/progress/screens/progress_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/privacy_policy_screen.dart';
import '../features/profile/screens/settings_screen.dart';
import 'app_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/daily-task',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const DailyTaskScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/practice',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: PracticeScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'exercise/:category',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) {
                    final category = state.pathParameters['category'] ?? 'reading';
                    return ExerciseScreen(categoryName: category);
                  },
                ),
                GoRoute(
                  path: 'writing',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const WritingPracticeScreen(),
                ),
                GoRoute(
                  path: 'gap-fill',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ClozePart1Screen(),
                ),
                GoRoute(
                  path: 'cloze-part1',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ClozePart1Screen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/mock-exam',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MockExamScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'session',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ExamSessionScreen(),
                ),
                GoRoute(
                  path: 'result',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const ExamResultScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/progress',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProgressScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'privacy',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const PrivacyPolicyScreen(),
                ),
                GoRoute(
                  path: 'settings',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const SettingsScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
