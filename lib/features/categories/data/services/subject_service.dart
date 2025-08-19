import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/data/models/subject_info_model.dart';

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
        country: "egypt",
        university: "mansoura_university",
        faculty: "dentistry",
        program: "bachelors",
        stage: "level_1", 
      ),
      builder: (data, documentId) { 
        return SubjectInfoModel.fromMap(data,documentId);
      },
    );
  }
}
