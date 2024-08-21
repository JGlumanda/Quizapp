// lib/services/DataService.dart
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quizapp/models/Info.dart';

import '../models/Profession.dart';

class DataService {
  // Singleton instance
  static final DataService _instance = DataService._internal();

  late List<Profession> professions;
  late List<Info> infos;

  factory DataService() {
    return _instance;
  }

  DataService._internal();

  Future<void> init() async {
    await loadProfessions();
    await loadInfos();
  }

  Future<List<Profession>> loadProfessions() async {
    final String response =
        await rootBundle.loadString('assets/data/professions.json');
    final data = await json.decode(response) as List;
    return professions = data.map((json) => Profession.fromJson(json)).toList();
  }

  Future<List<Info>> loadInfos() async {
    final response = await rootBundle.loadString('assets/data/Infos.json');
    final List<dynamic> data = jsonDecode(response);
    return infos = data.map((json) => Info.fromJson(json)).toList();
  }
}
