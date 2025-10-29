import 'package:sinna/core/constants/constants.dart';

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
      FireStoreLessonFieldsName.id: id,
      FireStoreLessonFieldsName.title: tittle,
      FireStoreLessonFieldsName.number: number,
      FireStoreLessonFieldsName.videoUrl: videoUrl,
      FireStoreLessonFieldsName.pdfUrl: pdfUrl,
      FireStoreLessonFieldsName.hours: hours,
      FireStoreLessonFieldsName.ninutes: minutes,
      FireStoreLessonFieldsName.pdfTitle: pdfTitle,
      FireStoreLessonFieldsName.term: term,
      FireStoreLessonFieldsName.subtitle: subTitle,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseModel(
      id: documentId,
      tittle: map[FireStoreLessonFieldsName.title] as String,
      number: map[FireStoreLessonFieldsName.number] as int,
      videoUrl: map[FireStoreLessonFieldsName.videoUrl] as String,
      pdfUrl: map[FireStoreLessonFieldsName.pdfUrl] as String,
      hours: map[FireStoreLessonFieldsName.hours] as String,
      minutes: map[FireStoreLessonFieldsName.ninutes] as String,
      pdfTitle: map[FireStoreLessonFieldsName.pdfTitle] as String,
      term: map[FireStoreLessonFieldsName.term] as String,
      subTitle: map[FireStoreLessonFieldsName.subtitle] as String,
    );
  }
}
