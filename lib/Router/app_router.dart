import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/Router/route_constants.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteConstants.start,
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const StartScreen();
        },
      ),
      GoRoute(
        name: RouteConstants.question,
        path: '/question',
        builder: (BuildContext context, GoRouterState state) {
          return const QuestionsScreen();
        },
      ),
      GoRoute(
        name: RouteConstants.result,
        path: '/result',
        builder: (context, state) => ResultScreen(
          chooseAnswers:
              state.extra as List<String>, // Get data from queryParameters
        ),
      ),
    ],
  );
}
