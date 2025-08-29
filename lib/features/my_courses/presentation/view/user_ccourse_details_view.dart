import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/my_courses/presentation/view/widgets/user_course_details_view_body.dart';

class UserCcourseDetailsView extends StatelessWidget {
  const UserCcourseDetailsView({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primaryBlue,
      appBar: AppBar(title: Text('My Course')),
      body: BlocProvider(
        create: (context) {
          return CourseCubit()..getLeson(coursePathModel: coursePathModel);
        },
        child: UserCourseDetailsViewBody(coursePathModel: coursePathModel),
      ),
    );
  }
}
