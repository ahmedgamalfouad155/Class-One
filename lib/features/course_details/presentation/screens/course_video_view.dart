import 'package:flutter/material.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/course_details/presentation/widget/course_video_view_body.dart';

class CourseVideoView extends StatelessWidget {
  const CourseVideoView({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Watching Course")),
      body: CourseVideoViewBody(course: course),
    );
  }
}
