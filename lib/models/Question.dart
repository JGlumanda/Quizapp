class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question(
      {required this.questionText,
      required this.answers,
      required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    var answersJson = json['answers'] as List;
    List<String> answersList = List<String>.from(answersJson);

    return Question(
      questionText: json['questionText'],
      answers: answersList,
      correctAnswer: json['correctAnswer'],
    );
  }
}
