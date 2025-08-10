import 'package:flutter/material.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/presentation/view/widgets/term_view_body.dart';

class TermView extends StatelessWidget {
  const TermView({super.key, required this.lessonPathModel});
  final LessonPathModel lessonPathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Terms Page")),
      body: TermViewBody(lessonPathModel: lessonPathModel),
    );
  }
}
