import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class ControlPanalService {
  Future<List<CoursePathModel>> getUserCourses(String email);
  Future<bool> checkUserExists(String email);
  Future<void> editUserPaid(String email, bool isPaid , String id);
}

class ControlPanalServiceImpl extends ControlPanalService {
  final firestor = FirestoreServices.instance;
  @override
  Future<List<CoursePathModel>> getUserCourses(String email) async {
    return firestor.getCollection(
      path: FirestorePath.myCourses(email),
      builder: (data, documentId) {
        return CoursePathModel.fromMap(data, documentId);
      },
    );
  }

  @override
  Future<bool> checkUserExists(String email) async {
    return firestor.checkUserExists(email);
  }

  @override
  Future<void> editUserPaid(String email, bool isPaid , String id) async {
    await firestor.updatedata(
      path: FirestorePath.courses(email, id),
      data: {"isPaid": isPaid},
    );
  }
}
