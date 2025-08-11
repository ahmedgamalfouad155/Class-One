import 'package:flutter/material.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/view/widgets/course_info_widget.dart';
import 'package:sinna/features/categories/presentation/view/widgets/list_of_courses_widget.dart';

class CoursesViewBody extends StatelessWidget {
  const CoursesViewBody({super.key, required this.lessonPathModel});
  final CoursePathModel lessonPathModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CourseInfoWidget(lessonPathModel: lessonPathModel),
          const SizedBox(height: 20),
          ListOfCoursesWidget(),
        ],
      ),
    );
  }
}
