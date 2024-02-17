import 'package:flutter/cupertino.dart';

class QuizQuestion{
  late String Question;
  late List<String> Answers;
  late int CorrectAnswer;

  QuizQuestion(String pQuestion, List<String> pAnswers, int pCorectAnswer){
    Question = pQuestion;
    Answers = pAnswers;
    CorrectAnswer = pCorectAnswer;
  }
}
