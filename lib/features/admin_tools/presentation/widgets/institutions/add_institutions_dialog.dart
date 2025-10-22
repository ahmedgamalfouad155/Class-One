import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/institutions/institutions_title_and_sub_title_and_field_section.dart';

class AddInstitutionsDialog extends StatefulWidget {
  const AddInstitutionsDialog({super.key});

  @override
  State<AddInstitutionsDialog> createState() => _AddInstitutionsDialogState();
}

class _AddInstitutionsDialogState extends State<AddInstitutionsDialog> {
  final TextEditingController institutionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    institutionController.dispose();
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
              InstitutionsTitleAndSubTitleAndFieldSection(
                institutionController: institutionController,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CancelButtonWidget(),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      text: "Save",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
