import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

abstract class AddToMyCoursesServices {
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
  });
}

class AddToMyCoursesServicesImp extends AddToMyCoursesServices {
    final firestor = FirestoreServices.instance;


    @override
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
  }) async {
    final uid = AuthServicesImpl().currentUser!.uid;
    await firestor.setData(
      path: FirestorePath.courses(uid,coursePathModel.id!),
      data: coursePathModel.toMap(),
    );
  }
}
