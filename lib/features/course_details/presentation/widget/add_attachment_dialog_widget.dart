import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/add_attachment_button_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class AddingAttachmentDialogWidget extends StatefulWidget {
  const AddingAttachmentDialogWidget({
    super.key,
    required this.coursePathModel,
    required this.course,
  });
  final CoursePathModel coursePathModel;
  final CourseModel course;

  @override
  State<AddingAttachmentDialogWidget> createState() =>
      _AddingAttachmentDialogWidgetState();
}

class _AddingAttachmentDialogWidgetState
    extends State<AddingAttachmentDialogWidget> {
  final TextEditingController pdfTitle = TextEditingController();
  final TextEditingController pdfUrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    pdfTitle.dispose();
    pdfUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: context.appColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "Add Attachment",
          style: AppStyles.textStyle20W600(context),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter the user’s email to enroll them in this course.",
              style: AppStyles.textStyle16W600Grey(context),
            ),
            const SizedBox(height: 10),
            CustomTextFieldWidget(hintText: "File Name", controller: pdfTitle),
            const SizedBox(height: 10),
            CustomTextFieldWidget(
              hintText: "https://example.com/file.pdf",
              controller: pdfUrl,
            ),
          ],
        ),
        actions: [
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCancelTextWidget(),
              const SizedBox(width: 10),
              BlocProvider(
                create: (context) => LessonManagerCubit(),
                child: AddAttachmentButtonWidget(
                  formKey: _formKey,
                  coursePathModel: widget.coursePathModel,
                  course: widget.course,
                  pdfTitle: pdfTitle,
                  pdfUrl: pdfUrl,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
