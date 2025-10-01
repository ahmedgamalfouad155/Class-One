import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/presentation/manager/password_visibility_cubit.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, state) {
        return TextFormField(
          obscureText: state,
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: context.appColors.blue,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'pleaseEnterYour $hintText';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),

            hintText: hintText,
            hintStyle: AppStyles.textStyle16W600Grey(
              context,
            ).copyWith(color: context.appColors.greyNavBar),
            fillColor: context.appColors.greyBackgroundTextFiled,
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                state ? Icons.visibility : Icons.visibility_off,
                color: context.appColors.blue,
              ),
              onPressed: () {
                context.read<PasswordVisibilityCubit>().toggleVisibility();
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        );
      },
    );
  }
}
