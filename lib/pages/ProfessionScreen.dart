// lib/screens/profession_screen.dart
import 'package:flutter/material.dart';

import '../models/Profession.dart';
import 'QuizScreen.dart';

class ProfessionScreen extends StatelessWidget {
  final Profession profession;

  ProfessionScreen({required this.profession});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uhlmann Quizapp'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            // Add your professions here dynamically
            ListTile(
              title: Text('Profession 1'),
              onTap: () {
                // Navigate to profession screen
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(profession.imageUrl),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(profession: profession),
                          ),
                        );
                      },
                      child: Text('Button um das Quiz zu starten'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Text(
                profession.introText,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8.0),
              ...profession.details.map((detail) {
                if (detail.type == 'image') {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(detail.content),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      detail.content,
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
