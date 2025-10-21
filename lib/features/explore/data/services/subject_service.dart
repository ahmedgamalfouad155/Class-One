import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/models/subject_info_model.dart';

abstract class SubjectService {
  Future<List<SubjectInfoModel>> getSubjects(CoursePathModel path);
}

class SubjectServiceImpl extends SubjectService {
  final firestor = FirestoreServices.instance;
  @override
  Future<List<SubjectInfoModel>> getSubjects(CoursePathModel path) {
    return firestor.getCollection(
      path: FirestorePath.newCoursesPath(
        specialization: path.specialization.toString(),
        program: path.program.toString(),
        university: path.university.toString(),
        level: path.level.toString(),
      ),
      builder: (data, documentId) {
        return SubjectInfoModel.fromMap(data, documentId);
      },
    );
  }
}
