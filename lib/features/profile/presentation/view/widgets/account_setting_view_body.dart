import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/core/widgets/custom_text_form_field_widget.dart';
import 'package:sinna/features/auth/presentation/manager/password_visibility_cubit.dart';
import 'package:sinna/features/profile/presentation/view/widgets/dialog_and_bottom_sheet_fun/change_password_dialog.dart';

class AccountSettingViewBody extends StatelessWidget {
  const AccountSettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Image.asset(AppImages.avatar),
          const SizedBox(height: 5),
          Text(
            "Ahmed Gamal",
            style: AppStyles.textStyle18Bold(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            "ahmedgamal@gmail.com",
            style: AppStyles.textStyle14W600(context).copyWith(
              fontWeight: FontWeight.w600,
              color: context.appColors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.grey),
              ),
              CustomTextFieldWidget(hintText: "Ahmed Gamal"),
              const SizedBox(height: 16),
              Text(
                "Password",
                style: AppStyles.textStyle16W600(
                  context,
                ).copyWith(color: context.appColors.grey),
              ),
              BlocProvider(
                create: (context) => PasswordVisibilityCubit(),
                child: CustomTextFormFieldWidget(hintText: "• • • • • • • •"),
              ),
            ],
          ),
          const SizedBox(height: 32),
          CustomButton(
            text: "Change",
            onPressed: () => showChangePasswordDialog(context),
          ),
        ],
      ),
    );
  }
}
