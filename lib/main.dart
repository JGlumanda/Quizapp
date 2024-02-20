import 'package:flutter/material.dart';
import 'package:quizapp/bi_logic/QuizManager.dart';
import 'package:quizapp/pages/page_splashscreen.dart';
import 'package:quizapp/theme/theme.dart';

import 'pages/page_Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uhlmann Quiz App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: initializeApp(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {

                  return const Splashscreen();
                } else {
                  return const CareerSelecter();
                }
              },
            ),
        ),
      ),
    );
  }

  Future<bool> initializeApp() async {
    await QuizManager().loadQuestions();
    return true;
  }
}