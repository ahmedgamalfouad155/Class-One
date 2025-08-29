import 'package:flutter/material.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/view/widgets/course_info_widget.dart';
import 'package:sinna/features/my_courses/presentation/view/widgets/list_of_user_course_widget.dart';

class UserCourseDetailsViewBody extends StatelessWidget {
  const UserCourseDetailsViewBody({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CourseInfoWidget(coursePathModel: coursePathModel),
          const SizedBox(height: 20),
          ListOfUserCourseWidget(isPaied: coursePathModel.isPaid!),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
