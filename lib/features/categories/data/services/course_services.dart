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
  }) async => await firestor.getCollection(
    path: FirestorePath.coursePath(
      coursePathModel.country.toString(),
      coursePathModel.university.toString(),
      coursePathModel.system.toString(),
      coursePathModel.level.toString(),
      coursePathModel.subject.toString(),
      coursePathModel.term.toString(),
      coursePathModel.doctor.toString(),
    ),
    builder: (data, documentId) => CourseModel.fromMap(data, documentId),
  );
}
