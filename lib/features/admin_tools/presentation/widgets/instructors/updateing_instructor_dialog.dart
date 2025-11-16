import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/data/models/instructor_model.dart';
import 'package:sinna/features/admin_tools/presentation/manager/instructors/instructors_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/delete_instructor_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/instructors/update_instructor_button_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class UpdateingInstructorDialog extends StatefulWidget {
  const UpdateingInstructorDialog({super.key, required this.institution});
  final InstructorModel institution;

  @override
  State<UpdateingInstructorDialog> createState() =>
      _UpdateingInstructorDialogState();
}

class _UpdateingInstructorDialogState extends State<UpdateingInstructorDialog> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.institution.name;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: context.appColors.white,
      child: Form(
        key: _formKey,
        child: Container(
          width: context.width * .9,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.edit_instructor.tr(),
                style: AppStyles.textStyle16W600(context),
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.change_the_instructor_s_name_below.tr(),
                style: AppStyles.textStyle16W600Grey(context),
              ),
              const SizedBox(height: 12),
              CustomTextFieldWidget(
                hintText: LocaleKeys.instructor_name.tr(),
                controller: nameController,
              ),
              const SizedBox(height: 12),
              BlocProvider(
                create: (context) => InstructorsCubit(),
                child: UpdateInstructorButtonWidget(
                  formKey: _formKey,
                  widget: widget,
                  nameController: nameController,
                ),
              ),
              const SizedBox(height: 10),
              BlocProvider(
                create: (context) => InstructorsCubit(),
                child: DeleteInstructorButtonWidget(widget: widget),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: LocaleKeys.cancel.tr(),
                onPressed: () => Navigator.pop(context),
                bacgrouncColor: context.appColors.greyMoonlight,
                textColor: context.appColors.black,
                borderSideColor: context.appColors.greyMoonlight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
