import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class PasswordScreenBody extends StatefulWidget {
  const PasswordScreenBody({super.key});

  @override
  State<PasswordScreenBody> createState() => _PasswordScreenBodyState();
}

class _PasswordScreenBodyState extends State<PasswordScreenBody> {
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.password.tr(),
            style: AppStyles.textStyle16w400Grey(context),
          ),
          const SizedBox(height: 10),
          CustomTextFieldWidget(
            hintText: "••••••••",
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
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
