import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class CourseParticipantsServices {
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
    required String email,
  });
  Stream<List<UserInfoModel>> getParticipants(CoursePathModel coursePathModel);
  Future<bool> checkUserExists(String email);
  Future<void> removeParticipantFromCourse(
    String email,
    CoursePathModel coursePathModel,
  );
}

class CourseParticipantsServicesImp extends CourseParticipantsServices {
  final firestor = FirestoreServices.instance;

  @override
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
    required String email,
  }) async {
    await firestor.setData(
      path: FirestorePath.courses(email, coursePathModel.courseId!),
      data: coursePathModel.toMap(),
    );
    _addParticipantToCourse(email, coursePathModel);
  }

  @override
  Future<bool> checkUserExists(String email) {
    return firestor.checkUserExists(email);
  }

  void _addParticipantToCourse(
    String email,
    CoursePathModel coursePathModel,
  ) async {
    final userInfo = await firestor.getDocument(
      path: FirestorePath.users(email),
      builder: (data, documentId) {
        return UserInfoModel.fromMap(data, documentId);
      },
    );
    await firestor.setData(
      path: FirestorePath.newParticipantsPath(
        specialization: coursePathModel.specialization.toString(),
        institution: coursePathModel.institution.toString(),
        level: coursePathModel.level.toString(),
        course: coursePathModel.courseId.toString(),
        participantId: email.toString(),
      ),
      data: userInfo.toMap(),
    );
  }

  @override
  Stream<List<UserInfoModel>> getParticipants(CoursePathModel coursePathModel) {
    return firestor.collectionsStram(
      path: FirestorePath.myParticipantsPath(
        specialization: coursePathModel.specialization.toString(),
        institution: coursePathModel.institution.toString(),
        level: coursePathModel.level.toString(),
        course: coursePathModel.courseId.toString(),
      ),
      builder: (data, documentId) {
        return UserInfoModel.fromMap(data!, documentId);
      },
    );
  }

  @override
  Future<void> removeParticipantFromCourse(
    String email,
    CoursePathModel coursePathModel,
  ) async {
    await firestor.deleteData(
      path: FirestorePath.courses(email, coursePathModel.courseId!),
    );
    return firestor.deleteData(
      path: FirestorePath.newParticipantsPath(
        specialization: coursePathModel.specialization.toString(),
        institution: coursePathModel.institution.toString(),
        level: coursePathModel.level.toString(),
        course: coursePathModel.courseId.toString(),
        participantId: email.toString(),
      ),
    );
  }
}
