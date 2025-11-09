import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/course_participants_cubit/course_participants_state.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AddParticipantDialogWidget extends StatefulWidget {
  const AddParticipantDialogWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  State<AddParticipantDialogWidget> createState() =>
      _AddParticipantDialogWidgetState();
}

class _AddParticipantDialogWidgetState
    extends State<AddParticipantDialogWidget> {
  final TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseParticipantsCubit(),
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: context.appColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "Add Participant",
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
            CustomTextFieldWidget(
              hintText: "example@domain.com",
              controller: emailController,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  bacgrouncColor: context.appColors.greyMoonlight,
                  borderSideColor: context.appColors.greyMoonlight,
                  textColor: context.appColors.black,
                  text: "Cancel",
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 10),
              BlocConsumer<CourseParticipantsCubit, CourseParticipantsState>(
                listener: (context, state) {
                  if (state is AddingCourseToPaticipantsSuccessState) {
                    CustomAnimatedDialog.show(
                      context: context,
                      message: "Course added successfully ✅🎉",
                    );
                  }
                  if (state is AddingCourseToPaticipantsFailureState) {
                    CustomAnimatedDialog.show(
                      context: context,
                      message: state.errMessage,
                      animationType: DialogAnimationType.warning,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AddingCourseToPaticipantsLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CourseParticipantsInitial ||
                      state is AddingCourseToPaticipantsSuccessState ||
                      state is AddingCourseToPaticipantsFailureState) {
                    return Expanded(
                      child: CustomButton(
                        text: LocaleKeys.add.tr(),
                        onPressed: () {
                          context
                              .read<CourseParticipantsCubit>()
                              .addCouseToMyCourse(
                                coursePathModel: widget.coursePathModel,
                                email: emailController.text,
                              );
                        },
                      ),
                    );
                  } else {
                    return const Text("error");
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//ahmedgfouad2020@gmail.com
