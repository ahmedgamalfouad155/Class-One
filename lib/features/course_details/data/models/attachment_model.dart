import 'package:sinna/core/constants/constants.dart';

class AttachmentModel {
  String pdfUrl;
  String pdfTitle;

  AttachmentModel({required this.pdfUrl, required this.pdfTitle});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FireStoreLessonFieldsName.pdfUrl: pdfUrl,
      FireStoreLessonFieldsName.pdfTitle: pdfTitle,
    };
  }

  factory AttachmentModel.fromMap(Map<String, dynamic> map) {
    return AttachmentModel(
      pdfUrl: map[FireStoreLessonFieldsName.pdfUrl] as String,
      pdfTitle: map[FireStoreLessonFieldsName.pdfTitle] as String,
    );
  }

  void operator [](int other) {}
}
