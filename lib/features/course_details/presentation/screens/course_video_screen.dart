import 'package:flutter/material.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/course_details/presentation/screens/widget/course_video_screen_body.dart';

class CourseVideoScreen extends StatelessWidget {
  const CourseVideoScreen({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CourseVideoScreenBody(course: course)),
    );
  }
}
