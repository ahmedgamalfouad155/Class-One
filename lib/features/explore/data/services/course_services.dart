import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class CourseServices {
  Stream<List<CourseModel>> getCourses({
    required CoursePathModel coursePathModel,
  });
  Future<void> deleteCourse(CoursePathModel coursePathModel);
}

class CourseServicesImpl implements CourseServices {
  final firestor = FirestoreServices.instance;

  @override
  Stream<List<CourseModel>> getCourses({
    required CoursePathModel coursePathModel,
  }) {
    return firestor.collectionsStram(
      path: FirestorePath.myLessons(
        specialization: coursePathModel.specialization.toString(),
        institution: coursePathModel.institution.toString(),
        level: coursePathModel.level.toString(),
        course: coursePathModel.courseId.toString(),
      ),
      builder: (data, documentId) {
        return CourseModel.fromMap(data!, documentId);
      },
    );
  }
  
  @override
  Future<void> deleteCourse(CoursePathModel coursePathModel) { 
      return firestor.deleteData(
        path: FirestorePath.createNewCourse(
          specialization: coursePathModel.specialization.toString(),
          institution: coursePathModel.institution.toString(),
          level: coursePathModel.level.toString(),
          course: coursePathModel.courseId.toString(),
        ),
      );
  }
}
