import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/course_video_screen_body.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseVideoScreen extends StatelessWidget {
  const CourseVideoScreen({
    super.key,
      required this.lessonId,
    this.coursePathModel,
  });

  final String lessonId;
  final CoursePathModel? coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LessonManagerCubit(),
          child: CourseVideoScreenBody( 
            coursePathModel: coursePathModel,
            lessonId: lessonId,
          ),
        ),
      ),
    );
  }
}
