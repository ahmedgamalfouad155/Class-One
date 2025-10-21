class CourseModel {
  String id;
  String tittle;
  int number;
  String videoUrl;
  String pdfUrl;
  String hours;
  String minutes;
  String pdfTitle;
  String term;
  String subTitle;
  CourseModel({
    required this.id,
    required this.tittle,
    required this.number,
    required this.videoUrl,
    required this.pdfUrl,
    required this.hours,
    required this.minutes,
    required this.pdfTitle,
    required this.term,
    required this.subTitle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tittle': tittle,
      'number': number,
      'video_url': videoUrl,
      'pdf_url': pdfUrl,
      'hours': hours,
      'ninutes': minutes,
      'pdf_title': pdfTitle,
      'term': term,
      "subtitle": subTitle,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseModel(
      id: documentId,
      tittle: map['tittle'] as String,
      number: map['number'] as int,
      videoUrl: map['video_url'] as String,
      pdfUrl: map['pdf_url'] as String,
      hours: map['hours'] as String,
      minutes: map['ninutes'] as String,
      pdfTitle: map['pdf_title'] as String,
      term: map['term'] as String,
      subTitle: map['subtitle'] as String,
    );
  }
}
