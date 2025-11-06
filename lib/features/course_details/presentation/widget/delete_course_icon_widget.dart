import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_state.dart';
import 'package:sinna/features/course_details/presentation/widget/delete_course_dialog_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class DeleteCourseIconWidget extends StatelessWidget {
  const DeleteCourseIconWidget({super.key, required this.coursePathModel});

  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is CourseDeleteSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is CourseDeleteLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CourseDeleteSuccessState ||
            state is CourseInitial) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => DeleteCourseDialogWidget(
                  coursePathModel: coursePathModel,
                  cubit: context.read<CourseCubit>(),
                ),
              );
            },
            child: Icon(Icons.delete_outline_outlined),
          );
        } else if (state is CourseFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
