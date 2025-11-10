import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class LessonManagerService {
  Future<void> createLesson(CourseModel lessonModel, CoursePathModel path);
  Future<void> deleteLesson(CourseModel lessonModel, CoursePathModel path);
  Future<void> updateLesson(CourseModel lessonModel, CoursePathModel path);
  Future<void> addAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel,
  );
  Future<void> removeAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel,
  );
}

class LessonManagerServiceImpl extends LessonManagerService {
  final firestor = FirestoreServices.instance;
  @override
  Future<void> createLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
    await firestor.setData(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),
      data: lessonModel.toMap(),
    );
  }

  @override
  Future<void> deleteLesson(CourseModel lessonModel, CoursePathModel path) {
    return firestor.deleteData(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),
    );
  }

  @override
  Future<void> updateLesson(CourseModel lessonModel, CoursePathModel path) {
    return firestor.updatedata(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),

      data: lessonModel.toMap(),
    );
  }

  @override
  Future<void> addAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel,
  ) async {
    await firestor.updatedata(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),
      data: {
        FireStoreLessonFieldsName.attachments: FieldValue.arrayUnion([
          attachmentModel.toMap(),
        ]),
      },
    );
  }

  @override
  Future<void> removeAttachment(
    CourseModel lessonModel,
    CoursePathModel path,
    AttachmentModel attachmentModel,
  ) async {
    await firestor.updatedata(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),
      data: {
        FireStoreLessonFieldsName.attachments: FieldValue.arrayRemove([
          attachmentModel.toMap(),
        ]),
      },
    );
  }
}
