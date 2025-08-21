import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

abstract class MyCourseesServices {
  Future<List<CoursePathModel>> getMyCourses();
}

class MyCourseesServicesImp extends MyCourseesServices {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Future<List<CoursePathModel>> getMyCourses() async {
    return await firestor.getCollection(
      path: FirestorePath.myCourses(uid),
      builder: (data, documentId) { 
        return CoursePathModel.fromMap(data, documentId);
      },
    );
  }
}
