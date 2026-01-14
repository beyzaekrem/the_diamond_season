import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/auth/entry_screen.dart';
import '../features/home/home_screen.dart';
import '../features/character/screens/love_match_screen.dart';
import '../features/character/screens/match_quiz_screen.dart';
import '../features/quiz/screens/character_quiz_screen.dart';
import '../features/quiz/screens/quiz_result_screen.dart';
import '../features/quiz/models/quiz_models.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/entry',
        builder: (context, state) => const EntryScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/love-match',
        builder: (context, state) => const LoveMatchScreen(),
      ),
      GoRoute(
        path: '/match-quiz',
        builder: (context, state) => const MatchQuizScreen(),
      ),
      GoRoute(
        path: '/quiz',
        builder: (context, state) => const CharacterQuizScreen(),
      ),
      GoRoute(
        path: '/quiz-result',
        builder: (context, state) {
          final result = state.extra as QuizResult?;
          if (result == null) {
            // Fallback if no result provided
            return const CharacterQuizScreen();
          }
          return QuizResultScreen(result: result);
        },
      ),
    ],
  );
});
