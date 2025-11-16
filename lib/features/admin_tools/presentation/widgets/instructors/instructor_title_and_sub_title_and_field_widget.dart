import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class InstructorTitleAndSubTitleAndFieldWidget extends StatelessWidget {
  const InstructorTitleAndSubTitleAndFieldWidget({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          LocaleKeys.create_instructor.tr(),
          style: AppStyles.textStyle16W600(context),
        ),
        const SizedBox(height: 8),
        Text(
          LocaleKeys.add_new_instructor_profile_to_assign_courses.tr(),
          style: AppStyles.textStyle16W600Grey(context),
        ),
        const SizedBox(height: 12),
        CustomTextFieldWidget(
          hintText: LocaleKeys.instructor_name.tr(),
          controller: nameController,
          vlaidationMessage: LocaleKeys.enter_valid_instructor_name.tr(),
        ),
      ],
    );
  }
}
