import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';

class CourseModel {
  String id;
  String tittle;
  int number;
  String videoUrl;
  String term;
  List<AttachmentModel> attachments;

  CourseModel({
    required this.id,
    required this.tittle,
    required this.number,
    required this.videoUrl,
    required this.term,
    required this.attachments,
  });

  void update({
    String? id,
    String? tittle,
    int? number,
    String? videoUrl,
    String? term,
    List<AttachmentModel>? attachments,
  }) {
    if (id != null) this.id = id;
    if (tittle != null) this.tittle = tittle;
    if (number != null) this.number = number;
    if (videoUrl != null) this.videoUrl = videoUrl;
    if (term != null) this.term = term;
    if (attachments != null) this.attachments = attachments;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreLessonFieldsName.id: id,
      FireStoreLessonFieldsName.title: tittle,
      FireStoreLessonFieldsName.number: number,
      FireStoreLessonFieldsName.videoUrl: videoUrl,
      FireStoreLessonFieldsName.term: term,
      FireStoreLessonFieldsName.attachments: attachments
          .map((a) => a.toMap())
          .toList(),
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map, String documentId) {
    final attachmentsData =
        map[FireStoreLessonFieldsName.attachments] as List<dynamic>?;

    return CourseModel(
      id: documentId,
      tittle: map[FireStoreLessonFieldsName.title] as String,
      number: map[FireStoreLessonFieldsName.number] as int,
      videoUrl: map[FireStoreLessonFieldsName.videoUrl] as String,
      term: map[FireStoreLessonFieldsName.term] as String,
      attachments: attachmentsData != null
          ? attachmentsData
                .map(
                  (attachment) => AttachmentModel.fromMap(
                    attachment as Map<String, dynamic>,
                  ),
                )
                .toList()
          : [],
    );
  }
}
