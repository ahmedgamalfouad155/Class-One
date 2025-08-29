import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

abstract class MyCourseesServices {
  Stream<List<CoursePathModel>> getMyCourses();
}

class MyCourseesServicesImp extends MyCourseesServices {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;

  @override
  Stream<List<CoursePathModel>> getMyCourses() {
    return firestor.collectionsStram(
      path: FirestorePath.myCourses(uid!),
      builder: (data, documentId) {
        return CoursePathModel.fromMap(data!, documentId);
      },
    );
  }
}
