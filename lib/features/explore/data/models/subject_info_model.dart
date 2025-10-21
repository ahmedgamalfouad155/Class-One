class SubjectInfoModel {
  final String id;
  final String title;
  final String instructor;
  final String image;

  SubjectInfoModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'instructor': instructor,
      'image_url': image,
    };
  }

  factory SubjectInfoModel.fromMap(
    Map<String, dynamic> map,
    String documentId,
  ) {
    return SubjectInfoModel(
      id: documentId,
      title: map['title'] as String,
      instructor: map['instructor'] as String,
      image: map['image_url'] as String,
    );
  }
}
