import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

abstract class CreateCourseService {
  Future<void> createCourse(CourseInfoModel courseInfo , CoursePathModel path);
}

class CreateCourseServiceImpl extends CreateCourseService {
    final firestor = FirestoreServices.instance;
  @override 
  Future<void> createCourse(CourseInfoModel courseInfo , CoursePathModel path) {
    
    return firestor.setData(
      path: FirestorePath.createNewCourse(
        specialization: path.specialization.toString(),
        institution: path.institution.toString(),
        level: path.level.toString(),
        course: courseInfo.id.toString(),
      ),
      data: courseInfo.toMap(),
    );
    
  }
}
