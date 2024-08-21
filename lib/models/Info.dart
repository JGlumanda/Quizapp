import 'Detail.dart';

class Info {
  final String name;
  final String imageUrl;
  final String introText;
  final List<Detail> details;

  Info({
    required this.name,
    required this.imageUrl,
    required this.introText,
    required this.details,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    var detailsJson = json['details'] as List;
    List<Detail> detailList =
        detailsJson.map((i) => Detail.fromJson(i)).toList();

    return Info(
      name: json['name'],
      imageUrl: json['imageUrl'],
      introText: json['introText'],
      details: detailList,
    );
  }
}
