import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/delete_lesson_icon_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/popup_menu_course_video_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CourseVideoAppBarWidget extends StatelessWidget {
  const CourseVideoAppBarWidget({
    super.key,
    required this.course,
    this.coursePathModel,
  });
  final CourseModel course;
  final CoursePathModel? coursePathModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        const Spacer(),
        BlocProvider(
          create: (context) => LessonManagerCubit(),
          child: DeleteLessonIconWidget(
            course: course,
            coursePathModel: coursePathModel,
          ),
        ),
        PopupMenuCourseVideoWidget(
          coursePathModels: coursePathModel!,
          course: course,
        ),
      ],
    );
  }
}
