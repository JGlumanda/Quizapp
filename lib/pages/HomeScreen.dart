// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

import '../models/Profession.dart';
import '../services/DataService.dart';
import '../widgets/ProfessionTile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Profession>> futureProfessions;

  @override
  void initState() {
    super.initState();
    futureProfessions = DataService().loadProfessions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uhlmann Quizapp')),
      body: FutureBuilder<List<Profession>>(
        future: futureProfessions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final professions = snapshot.data!;
            return ListView.builder(
              itemCount: professions.length,
              itemBuilder: (context, index) {
                return ProfessionTile(profession: professions[index]);
              },
            );
          }
        },
      ),
    );
  }
}
