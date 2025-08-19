
class SubjectInfoModel {
  final String id; 
  final String subjectName;
  final String subjectDoctor;
  final String subjectImage;

  SubjectInfoModel({
    required this.id,
    required this.subjectName,
    required this.subjectDoctor,
    required this.subjectImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'subject_name': subjectName,
      'subject_doctor': subjectDoctor,
      'subject_image': subjectImage,
    };
  }

  factory SubjectInfoModel.fromMap(Map<String, dynamic> map, String documentId) {
    return SubjectInfoModel(
      id: documentId,
      subjectName: map['subject_name'] as String,
      subjectDoctor: map['subject_doctor'] as String,
      subjectImage: map['subject_image'] as String,
    );
  } 
}
