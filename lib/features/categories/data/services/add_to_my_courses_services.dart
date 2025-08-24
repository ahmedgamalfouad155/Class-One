import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

abstract class AddToMyCoursesServices {
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
    required String email,
  });

  Future<bool> checkUserExists(String email);
}

class AddToMyCoursesServicesImp extends AddToMyCoursesServices {
  final firestor = FirestoreServices.instance;

  @override
  Future<void> addCourseToUserCouses({
    required CoursePathModel coursePathModel,
    required String email,
  }) async {
    await firestor.setData(
      path: FirestorePath.courses(email, coursePathModel.id!),
      data: coursePathModel.toMap(),
    );
  } 
  
  @override
  Future<bool> checkUserExists(String email) { 
    return firestor.checkUserExists(email);
  }
}
