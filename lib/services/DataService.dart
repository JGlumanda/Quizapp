// lib/services/DataService.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/Profession.dart';

class DataService {
  // Singleton instance
  static final DataService _instance = DataService._internal();

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  Future<List<Profession>> loadProfessions() async {
    final String response = await rootBundle.loadString('assets/data/professions.json');
    final data = await json.decode(response) as List;
    return data.map((json) => Profession.fromJson(json)).toList();
  }
}
