// lib/widgets/profession_tile.dart
import 'package:flutter/material.dart';

import '../models/Profession.dart';
import '../pages/ProfessionScreen.dart';

class ProfessionTile extends StatelessWidget {
  final Profession profession;

  ProfessionTile({required this.profession});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(profession.imageUrl),  // Load image from local assets
      title: Text(profession.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfessionScreen(profession: profession),
          ),
        );
      },
    );
  }
}
