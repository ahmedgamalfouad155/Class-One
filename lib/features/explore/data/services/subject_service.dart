import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';

abstract class SubjectService {
  Stream<List<CourseInfoModel>> getSubjects(CoursePathModel path);
}

class SubjectServiceImpl extends SubjectService {
  final firestor = FirestoreServices.instance;
  @override
  Stream<List<CourseInfoModel>> getSubjects(CoursePathModel path) {
    return firestor.collectionsStram(
      path: FirestorePath.newCoursesPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
      ),
      builder: (data, documentId) {
        return CourseInfoModel.fromMap(data!, documentId);
      },
    );
  }
}
