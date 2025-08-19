import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/categories/data/models/course_model.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

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
    print(coursePathModel.country.toString());
    print(coursePathModel.university.toString());
    print(coursePathModel.faculty.toString());
    print(coursePathModel.program.toString());
    print(coursePathModel.stage.toString());
    print(coursePathModel.subject.toString());
    print(coursePathModel.term.toString());
    return await firestor.getCollection(
      path: FirestorePath.coursePath(
        coursePathModel.country.toString(),
        coursePathModel.university.toString(),
        coursePathModel.faculty.toString(),
        coursePathModel.program.toString(),
        coursePathModel.stage.toString(),
        coursePathModel.subject.toString(),
        coursePathModel.term.toString(),
      ),
      builder: (data, documentId) {
        // print(documentId);
        return CourseModel.fromMap(data, documentId);
      },
    );
  }
}
