import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';

abstract class SubjectService {
  Future<List<CourseInfoModel>> getSubjects(CoursePathModel path);
}

class SubjectServiceImpl extends SubjectService {
  final firestor = FirestoreServices.instance;
  @override
  Future<List<CourseInfoModel>> getSubjects(CoursePathModel path) {
    return firestor.getCollection(
      path: FirestorePath.newCoursesPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
      ),
      builder: (data, documentId) {
        return CourseInfoModel.fromMap(data, documentId);
      },
    );
  }
}
