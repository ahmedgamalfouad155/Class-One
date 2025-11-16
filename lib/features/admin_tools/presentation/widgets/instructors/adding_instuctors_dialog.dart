import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/instructor_title_and_sub_title_and_field_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class AddingInstructorDialog extends StatefulWidget {
  const AddingInstructorDialog({super.key});

  @override
  State<AddingInstructorDialog> createState() => _AddingInstructorDialogState();
}

class _AddingInstructorDialogState extends State<AddingInstructorDialog> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InstructorsCubit(),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: context.appColors.white,
        child: Form(
          key: _formKey,
          child: Container(
            width: context.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InstructorTitleAndSubTitleAndFieldWidget(
                  nameController: nameController,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomCancelTextWidget(),
                    const SizedBox(width: 10),
                    Expanded(
                      child: BlocConsumer<InstructorsCubit, InstructorsState>(
                        listener: (context, state) {
                          CustomAnimatedDialog.show(
                            context: context,
                            message:
                                "${LocaleKeys.instructor_added_successfully.tr()} ✅🎉",
                            animationType: DialogAnimationType.success,
                          );
                        },
                        builder: (context, state) {
                          if (state is InstructorAddingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is InstructorAddedSuccessState ||
                              state is InstructorsInitial) {
                            return CustomButton(
                              text: LocaleKeys.save.tr(),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<InstructorsCubit>()
                                      .addInstructor(nameController.text);
                                }
                              },
                            );
                          } else if (state is InstructorAddFailureState) {
                            return Text(state.errMessage);
                          } else {
                            return const Text("error");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
