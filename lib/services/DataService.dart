// lib/services/data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/Profession.dart';

class DataService {
  Future<List<Profession>> loadProfessions() async {
    final String response = await rootBundle.loadString('assets/data/professions.json');
    final data = await json.decode(response) as List;
    return data.map((json) => Profession.fromJson(json)).toList();
  }
}
