import 'package:flutter/material.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/presentation/view/widgets/instractor_view_body.dart';

class InstractorView extends StatelessWidget {
  const InstractorView({super.key, required this.lessonPathModel});
  final LessonPathModel lessonPathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Instractor Page")),
      body: InstractorViewBody(lessonPathModel: lessonPathModel),
    );
  }
}
