import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/course_details/data/models/lesson_model.dart';
import 'package:sinna/features/course_details/presentation/manager/create_lesson/create_lesson_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class CreateLessonButtonWidget extends StatelessWidget {
  const CreateLessonButtonWidget({
    super.key,
    required this.lessonTitleController,
    required this.videoUrlController,
    required this.formKey,
    required this.path,
  });

  final TextEditingController lessonTitleController;
  final TextEditingController videoUrlController;
  final GlobalKey<FormState> formKey;
  final CoursePathModel path;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Expanded(child: const SizedBox()),
          BlocBuilder<CreateLessonCubit, CreateLessonState>(
            builder: (context, state) {
              if (state is CreateLessonSuccessState ||
                  state is CreateLessonInitial) {
                return CustomButton(
                  text: "Create",
                  onPressed: () { 
                    if (formKey.currentState!.validate()) {
                      final lessonModel = CourseModel(
                        id: documentIdFromLocalData(),
                        tittle: lessonTitleController.text,
                        number: 3,
                        videoUrl: videoUrlController.text,
                        term: 'first term',
                        pdfUrl: '',
                        pdfTitle: '', 
                      );
                      context.read<CreateLessonCubit>().createLesson(
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
          ),
        ],
      ),
    );
  }
}
