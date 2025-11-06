import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart'; 
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class CreateLessonService {
  Future<void> createLesson(CourseModel lessonModel, CoursePathModel path);
}

class CreateLessonServiceImpl extends CreateLessonService {
  final firestor = FirestoreServices.instance;
  @override
  Future<void> createLesson(
    CourseModel lessonModel,
    CoursePathModel path,
  ) async {
   
    await firestor.setData(
      path: FirestorePath.newLessonsPath(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: path.courseId.toString(),
        lessonId: lessonModel.id.toString(),
      ),
      data: lessonModel.toMap(),
    );
  }
}
