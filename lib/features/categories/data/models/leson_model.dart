class LesonModel {
  String id;
  String name;
  int number;
  String videoUrl;
  LesonModel({
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

  factory LesonModel.fromMap(Map<String, dynamic> map, String documentId) {
    return LesonModel(
      id: documentId,
      name: map['name'] as String,
      number: map['number'] as int,
      videoUrl: map['videoUrl'] as String,
    );
  }
}
