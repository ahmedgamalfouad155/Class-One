import 'package:sinna/core/constants/constants.dart';

class CourseInfoModel {
  final String id;
  final String title;
  final String instructor;
  final String image;

  CourseInfoModel({
    required this.id,
    required this.title,
    required this.instructor,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreCourseInfoFieldsName.id: id,
      FireStoreCourseInfoFieldsName.title: title,
      FireStoreCourseInfoFieldsName.instructor: instructor,
      FireStoreCourseInfoFieldsName.imageUurl: image,
    };
  }

  factory CourseInfoModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CourseInfoModel(
      id: documentId,
      title: map[FireStoreCourseInfoFieldsName.title] as String,
      instructor: map[FireStoreCourseInfoFieldsName.instructor] as String,
      image: map[FireStoreCourseInfoFieldsName.imageUurl] as String,
    );
  }
}
