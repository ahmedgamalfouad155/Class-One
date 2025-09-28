import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/screens/widget/courses_screen_body.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primaryBlue,
      appBar: AppBar(title: Text('Course details')),
      body: BlocProvider(
        create: (context) {
          // print(coursePathModel.id);
          return CourseCubit()..getLeson(coursePathModel: coursePathModel);
        },
        child: CoursesScreenBody(coursePathModel: coursePathModel),
      ),
    );
  }
}
