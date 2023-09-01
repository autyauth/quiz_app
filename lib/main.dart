import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Router/app_router.dart';
import 'package:quiz_app/app_provider.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
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
