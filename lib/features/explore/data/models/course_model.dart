class CourseModel {
  String id;
  String tittle;
  int number;
  String videoUrl;
  String pdfUrl;
  CourseModel({
    required this.id,
    required this.tittle,
    required this.number,
    required this.videoUrl,
    required this.pdfUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'number': number,
      'video_url': videoUrl,
      'pdf_url': pdfUrl,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseModel(
      id: documentId,
      tittle: map['tittle'] as String,
      number: map['number'] as int,
      videoUrl: map['video_url'] as String,
      pdfUrl: map['pdf_url'] as String,
    );
  }
}
