import 'package:sinna/core/constants/constants.dart';

class CoursePathModel {
  String? institution;
  String? specialization;
  String? level;
  String? courseId;
  String? term;
  String? id;
  bool? isPaid;
  String? title;
  String? instructor;
  String? image;

  CoursePathModel({
    this.institution,
    this.specialization,
    this.level,
    this.courseId,
    this.term,
    this.id,
    this.isPaid,
    this.title,
    this.instructor,
    this.image,
  });

  void update({ 
    String? specialization,
    String? institution, 
    String? level,
    String? courseId,
    String? term,
    String? id,
    bool? isPaid,
    String? title,
    String? instructor,
    String? image,
  }) {
    if (institution != null) this.institution = institution;
    if (specialization != null) this.specialization = specialization;
    if (level != null) this.level = level;
    if (courseId != null) this.courseId = courseId;
    if (term != null) this.term = term;
    if (id != null) this.id = id;
    if (isPaid != null) this.isPaid = isPaid;
    if (title != null) this.title = title;
    if (instructor != null) this.instructor = instructor;
    if (image != null) this.image = image;
  }

  Map<String, dynamic> toMap() {
    return {
      FireStoreCoursePathFieldsName.institution: institution,
      FireStoreCoursePathFieldsName.specialization: specialization,
      FireStoreCoursePathFieldsName.level: level,
      FireStoreCoursePathFieldsName.coursrId: courseId,
      FireStoreCoursePathFieldsName.term: term,
      FireStoreCoursePathFieldsName.id: id,
      FireStoreCoursePathFieldsName.isPaid: isPaid ?? true,
      FireStoreCoursePathFieldsName.title: title,
      FireStoreCoursePathFieldsName.instructor: instructor,
      FireStoreCoursePathFieldsName.imageUrl: image,
    };
  }

  factory CoursePathModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CoursePathModel(
      institution: map[FireStoreCoursePathFieldsName.institution],
      specialization: map[FireStoreCoursePathFieldsName.specialization],
      level: map[FireStoreCoursePathFieldsName.level],
      courseId: map[FireStoreCoursePathFieldsName.coursrId],
      term: map[FireStoreCoursePathFieldsName.term],
      id: documentId,
      isPaid: map[FireStoreCoursePathFieldsName.isPaid] ?? true,
      title: map[FireStoreCoursePathFieldsName.title],
      instructor: map[FireStoreCoursePathFieldsName.instructor],
      image: map[FireStoreCoursePathFieldsName.imageUrl],
    );
  }
}
