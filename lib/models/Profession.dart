import 'Detail.dart';
import 'Question.dart';

class Profession {
  final String name;
  final String imageUrl;
  final String introText;
  final List<Detail> details;
  final List<Question> questions;

  Profession({
    required this.name,
    required this.imageUrl,
    required this.introText,
    required this.details,
    required this.questions,
  });

  factory Profession.fromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    List<Question> questionList =
        questionsJson.map((i) => Question.fromJson(i)).toList();

    var detailsJson = json['details'] as List;
    List<Detail> detailList =
        detailsJson.map((i) => Detail.fromJson(i)).toList();

    return Profession(
      name: json['name'],
      imageUrl: json['imageUrl'],
      introText: json['introText'],
      details: detailList,
      questions: questionList,
    );
  }
}