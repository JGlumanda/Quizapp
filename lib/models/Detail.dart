class Detail {
  final String type;
  final String content;
  final String? layout; // Optional layout field

  Detail({required this.type, required this.content, this.layout});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      type: json['type'],
      content: json['content'],
      layout: json['layout'], // Parsing the layout field
    );
  }
}
