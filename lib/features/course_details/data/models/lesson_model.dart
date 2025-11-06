import 'package:sinna/core/constants/constants.dart';

class LessonModel {
  String id;
  String tittle;
  int number;
  String videoUrl; 
  String term;
  
  LessonModel({
    required this.id,
    required this.tittle,
    required this.number,
    required this.videoUrl, 
    required this.term,
  }); 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreLessonFieldsName.id: id,
      FireStoreLessonFieldsName.title: tittle,
      FireStoreLessonFieldsName.number: number,
      FireStoreLessonFieldsName.videoUrl: videoUrl,
      FireStoreLessonFieldsName.term: term,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map, String documentId) {
    return LessonModel(
      id: documentId,
      tittle: map[FireStoreLessonFieldsName.title] as String,
      number: map[FireStoreLessonFieldsName.number] as int,
      videoUrl: map[FireStoreLessonFieldsName.videoUrl] as String,
      term: map[FireStoreLessonFieldsName.term] as String,
    );
  }
}
