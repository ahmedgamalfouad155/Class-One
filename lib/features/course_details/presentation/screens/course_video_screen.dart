import 'package:flutter/material.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/course_details/presentation/widget/course_video_screen_body.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseVideoScreen extends StatelessWidget {
  const CourseVideoScreen({
    super.key,
    required this.course,
    this.coursePathModel,
  });

  final CourseModel course;
  final CoursePathModel? coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CourseVideoScreenBody(course: course ,coursePathModel: coursePathModel)),
    );
  }
}
