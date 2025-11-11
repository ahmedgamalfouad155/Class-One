import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/term_switch_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class UpdateLessonButtonWidget extends StatelessWidget {
  const UpdateLessonButtonWidget({
    super.key,
    required this.formKey,
    required this.lessonTitleController,
    required this.videoUrlController,
    required this.lessonNumberController,
    required this.course,
    required this.path,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController lessonTitleController,
      videoUrlController,
      lessonNumberController;
  final CourseModel course;
  final CoursePathModel path;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonManagerCubit, LessonManagerState>(
      listener: (context, state) {
        if (state is UpdateLessonSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Lesson updated successfully ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateLessonLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UpdateLessonSuccessState ||
            state is LessonManagerInitial) {
          return CustomButton(
            text: "update lesson",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final lessonModel = course;
                lessonModel.update(
                  tittle: lessonTitleController.text,
                  videoUrl: videoUrlController.text,
                  term: context.read<TermSwitcherCubit>().state
                      ? FireStoreLessonFieldsName.secondTerm
                      : FireStoreLessonFieldsName.firstTerm,
                  number: lessonNumberController.text.isEmpty
                      ? 0
                      : int.parse(lessonNumberController.text),
                );
                context.read<LessonManagerCubit>().updateLesson(
                  lessonModel,
                  path,
                );
              }
            },
          );
        } else if (state is UpdateLessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
