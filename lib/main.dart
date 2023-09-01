import 'package:flutter/material.dart';
import 'package:quiz_app/Router/app_router.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quiz App',
      routerConfig: AppRouter().router,
    );
  }
}
