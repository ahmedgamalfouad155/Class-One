import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart'; 
import 'package:sinna/features/admin_tools/presentation/manager/institutions_cubit/institutions_cubit.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/delete_institution_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/update_institution_button_widget.dart'; 

class UpdateingInstitutionDialog extends StatefulWidget {
  const UpdateingInstitutionDialog({super.key, required this.institution});
  final InstitutionModel institution;

  @override
  State<UpdateingInstitutionDialog> createState() =>
      _UpdateingInstitutionDialogState();
}

class _UpdateingInstitutionDialogState
    extends State<UpdateingInstitutionDialog> {
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
                "Edit Instructor",
                style: AppStyles.textStyle16W600(context),
              ),
              const SizedBox(height: 8),
              Text(
                "Change the instructor’s name below.",
                style: AppStyles.textStyle16W600Grey(context),
              ),
              const SizedBox(height: 12),
              CustomTextFieldWidget(
                hintText: "Instructor Name",
                controller: nameController,
              ),
              const SizedBox(height: 12),
              BlocProvider(
                create: (context) => InstitutionsCubit(),
                child: UpdateInstitutionButtonWidget(
                  formKey: _formKey,
                  widget: widget,
                  nameController: nameController,
                ),
              ),
              const SizedBox(height: 10),
              BlocProvider(
                create: (context) => InstitutionsCubit(),
                child: DeleteInstitutionButtonWidget(widget: widget),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: "Cancel",
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
