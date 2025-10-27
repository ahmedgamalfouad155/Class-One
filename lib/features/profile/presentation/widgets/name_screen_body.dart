import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class NameScreenBody extends StatefulWidget {
  const NameScreenBody({super.key});

  @override
  State<NameScreenBody> createState() => _NameScreenBodyState();
}

class _NameScreenBodyState extends State<NameScreenBody> {
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = 'Ahmed Gamal';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name", style: AppStyles.textStyle16w400Grey(context)),
          const SizedBox(height: 10),
          CustomTextFieldWidget(
            hintText: "Ahmed Gamal",
            controller: nameController,
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: LocaleKeys.change.tr(),
              onPressed: () {},
              width: context.width / 4,
            ),
          ),
        ],
      ),
    );
  }
}
