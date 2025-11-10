import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/delete_lesson_dialog_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class DeleteLessonIconWidget extends StatelessWidget {
  const DeleteLessonIconWidget({
    super.key,
    required this.course,
    this.coursePathModel,
  });
  final CourseModel course;
  final CoursePathModel? coursePathModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonManagerCubit, LessonManagerState>(
      listener: (context, state) {
        if (state is DeleteLessonSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is DeleteLessonSuccessState ||
            state is LessonManagerInitial) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => DeleteLessonDialogWidget(
                  course: course,
                  coursePathModel: coursePathModel!,
                  cubit: context.read<LessonManagerCubit>(),
                ),
              );
            },
            child: Icon(Icons.delete_outline_outlined),
          );
        } else if (state is DeleteLessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
