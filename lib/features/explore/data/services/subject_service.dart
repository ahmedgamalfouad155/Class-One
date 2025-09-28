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
    // print(path.country);
    // print(path.university);
    return firestor.getCollection(
      path: FirestorePath.subjectsPath(
        country: path.country.toString(),
        university: path.university.toString(),
        faculty: path.faculty.toString(),
        program: path.program.toString(),
        stage: path.stage.toString(),
      ),
      builder: (data, documentId) {
        return SubjectInfoModel.fromMap(data, documentId);
      },
    );
  }
}
