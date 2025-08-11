import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/lesson_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/courses_view_body.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primaryBlue,
      appBar: AppBar(title: Text('Course details')),
      body: BlocProvider(
        create: (context) {
          return LessonCubit()..getLeson(lessonPathModel: coursePathModel);
        },
        child: CoursesViewBody(lessonPathModel: coursePathModel),
      ),
    );
  }
}
