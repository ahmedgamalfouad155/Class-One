import 'package:sinna/core/constants/constants.dart';

class CourseModel {
  String id;
  String tittle;
  int number;
  String videoUrl;
  String pdfUrl; 
  String pdfTitle;
  String term;
  
  CourseModel({
    required this.id,
    required this.tittle,
    required this.number,
    required this.videoUrl,
    required this.pdfUrl,
    required this.pdfTitle,
    required this.term,
  }); 

  void update({
    String? id,
    String? tittle,
    int? number,
    String? videoUrl,
    String? pdfUrl,
    String? pdfTitle,
    String? term,
  }) {
    if (id != null) this.id = id;
    if (tittle != null) this.tittle = tittle;
    if (number != null) this.number = number;
    if (videoUrl != null) this.videoUrl = videoUrl;
    if (pdfUrl != null) this.pdfUrl = pdfUrl;
    if (pdfTitle != null) this.pdfTitle = pdfTitle;
    if (term != null) this.term = term;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreLessonFieldsName.id: id,
      FireStoreLessonFieldsName.title: tittle,
      FireStoreLessonFieldsName.number: number,
      FireStoreLessonFieldsName.videoUrl: videoUrl,
      FireStoreLessonFieldsName.pdfUrl: pdfUrl,
      FireStoreLessonFieldsName.pdfTitle: pdfTitle,
      FireStoreLessonFieldsName.term: term,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseModel(
      id: documentId,
      tittle: map[FireStoreLessonFieldsName.title] as String,
      number: map[FireStoreLessonFieldsName.number] as int,
      videoUrl: map[FireStoreLessonFieldsName.videoUrl] as String,
      pdfUrl: map[FireStoreLessonFieldsName.pdfUrl] as String,
      pdfTitle: map[FireStoreLessonFieldsName.pdfTitle] as String,
      term: map[FireStoreLessonFieldsName.term] as String,
    );
  }
}
