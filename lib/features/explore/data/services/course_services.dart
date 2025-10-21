import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class CourseServices {
  Future<List<CourseModel>> getCourses({
    required CoursePathModel coursePathModel,
  });
}

class CourseServicesImpl implements CourseServices {
  final firestor = FirestoreServices.instance;

  @override
  Future<List<CourseModel>> getCourses({
    required CoursePathModel coursePathModel,
  }) async { 
    return await firestor.getCollection(
      path: FirestorePath.newLessonsPath(
        specialization: coursePathModel.specialization.toString(),
        program: coursePathModel.program.toString(),
        university: coursePathModel.university.toString(),
        level: coursePathModel.level.toString(),
        course: coursePathModel.subject.toString(),
      ),
      builder: (data, documentId) { 
        return CourseModel.fromMap(data, documentId);
      },
    );
  }
}
