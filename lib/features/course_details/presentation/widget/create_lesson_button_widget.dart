import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/term_switch_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CreateLessonButtonWidget extends StatelessWidget {
  const CreateLessonButtonWidget({
    super.key,
    required this.lessonTitleController,
    required this.videoUrlController,
    required this.lessonNumberController,
    required this.formKey,
    required this.path,
  });

  final TextEditingController lessonTitleController,
      videoUrlController,
      lessonNumberController;
  final GlobalKey<FormState> formKey;
  final CoursePathModel path;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonManagerCubit, LessonManagerState>(
      listener: (context, state) {
        if (state is CreateLessonSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Lesson created successfully ✅🎉",
            animationType: DialogAnimationType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is CreateLessonSuccessState ||
            state is LessonManagerInitial) {
          return CustomButton(
            text: "Create",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final lessonModel = CourseModel(
                  id: documentIdFromLocalData(),
                  tittle: lessonTitleController.text,
                  number: lessonNumberController.text.isEmpty
                      ? 0
                      : int.parse(lessonNumberController.text),
                  videoUrl: videoUrlController.text,
                  term: context.read<TermSwitcherCubit>().state
                      ? FireStoreLessonFieldsName.secondTerm
                      : FireStoreLessonFieldsName.firstTerm,

                  attachments: [],
                );
                context.read<LessonManagerCubit>().createLesson(
                  lessonModel,
                  path,
                );
              }
            },
          );
        } else if (state is CreateLessonFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
