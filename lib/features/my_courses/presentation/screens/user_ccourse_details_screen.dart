import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/my_courses/presentation/screens/widgets/user_course_details_screen_body.dart';

class UserCcourseDetailsScreen extends StatelessWidget {
  const UserCcourseDetailsScreen({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: context.appColors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) {
          return CourseCubit()..getLeson(coursePathModel: coursePathModel);
        },
        child: UserCourseDetailsScreenBody(coursePathModel: coursePathModel),
      ),
    );
  }
}
