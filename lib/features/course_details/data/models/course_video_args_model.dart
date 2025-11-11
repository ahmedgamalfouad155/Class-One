import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseVideoArgs {
  final String lessonId;
  final CoursePathModel coursePathModel;

  CourseVideoArgs({
    required this.lessonId,
    required this.coursePathModel,
  });
}
