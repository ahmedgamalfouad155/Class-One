import 'package:flutter/material.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/screens/widget/course_info_widget.dart';
import 'package:sinna/features/my_courses/presentation/screens/widgets/list_of_user_course_widget.dart';

class UserCourseDetailsScreenBody extends StatelessWidget {
  const UserCourseDetailsScreenBody({super.key, required this.coursePathModel});
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
