import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseVideoArgs {
  final CourseModel course;
  final CoursePathModel coursePathModel;

  CourseVideoArgs({
    required this.course,
    required this.coursePathModel,
  });
}
