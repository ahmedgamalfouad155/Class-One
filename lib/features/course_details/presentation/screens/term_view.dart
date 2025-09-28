import 'package:flutter/material.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/widget/term_view_body.dart';

class TermView extends StatelessWidget {
  const TermView({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms")),
      body: TermViewBody(lessonPathModel: coursePathModel),
    );
  }
}
