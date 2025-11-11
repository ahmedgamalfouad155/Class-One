
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class AddAttachmentButtonWidget extends StatelessWidget {
  const AddAttachmentButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,

    required this.pdfTitle,
    required this.pdfUrl,
    required this.coursePathModel,
    required this.course,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final CoursePathModel coursePathModel;
  final CourseModel course;
  final TextEditingController pdfTitle;
  final TextEditingController pdfUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonManagerCubit, LessonManagerState>(
      listener: (context, state) {
        if (state is AddAttachmentSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Attachment added successfully ✅🎉",
          );
        }
      },
      builder: (context, state) {
        if (state is AddAttachmentLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddAttachmentSuccessState ||
            state is LessonManagerInitial) {
          return CustomButton(
            width: context.width / 2.5,
            text: "Add Attachment",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<LessonManagerCubit>().addAttachment(
                  course,
                  coursePathModel,
                  AttachmentModel(
                    pdfTitle: pdfTitle.text,
                    pdfUrl: pdfUrl.text,
                  ),
                );
              }
            },
          );
        } else if (state is AddAttachmentFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}


