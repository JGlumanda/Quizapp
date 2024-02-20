import 'dart:convert';

import 'package:flutter/services.dart';

class QuizManager {
  QuizManager._internal() {
    loadQuestions();
  }

  factory QuizManager() {
    return _instance;
  }

  static final QuizManager _instance = QuizManager._internal();
  late Map<String, dynamic> _questions;
  final int _totalQuestions = 10;
  int _currentQuestion = 0;
  int _correctAnswers = 0;

  Future<void> loadQuestions() async {
    //Load questions from json file
    final String response =
        await rootBundle.loadString('assets/questions.json');
    _questions = await json.decode(response);
  }

  List<String> getStudiums() {
    List<String> studiumJobs = [];
    List<dynamic> studiumList = _questions['Studium'];

    for (var studium in studiumList) {
      studiumJobs.addAll(studium.keys.toList());
    }

    return studiumJobs;
  }

  List<String> getAusbildungen() {
    List<String> ausbildungJobs = [];
    List<dynamic> ausbildungList = _questions['Ausbildung'];

    for (var ausbildung in ausbildungList) {
      ausbildungJobs.addAll(ausbildung.keys.toList());
    }

    return ausbildungJobs;
  }
}
