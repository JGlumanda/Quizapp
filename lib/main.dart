// lib/main.dart
import 'package:flutter/material.dart';
import 'package:quizapp/pages/ProfessionScreen.dart';
import 'package:quizapp/services/DataService.dart';

import 'models/Profession.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uhlmann Quizapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<List<Profession>>(
        future: DataService().loadProfessions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Scaffold(
              body: Center(child: Text('No data available')),
            );
          } else {
            return ProfessionScreen(professions: snapshot.data!);
          }
        },
      ),
    );
  }
}
