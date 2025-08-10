class LessonModel {
  String id;
  String name;
  int number;
  String videoUrl;
  LessonModel({
    required this.id,
    required this.name,
    required this.number,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'number': number,
      'videoUrl': videoUrl,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map, String documentId) {
    return LessonModel(
      id: documentId,
      name: map['name'] as String,
      number: map['number'] as int,
      videoUrl: map['videoUrl'] as String,
    );
  }
}
