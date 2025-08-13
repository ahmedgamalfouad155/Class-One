import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_image_and_header_widget.dart';
import 'package:sinna/features/auth/presentation/view/widgets/steps_section_widget.dart';

class UniversityInfoStep extends StatelessWidget {
  const UniversityInfoStep({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    final user = context.watch<SignUpCubit>().state.user;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignupImageAndHeaderWidget(),
            StepsSectionWidget(signUpCubit: signUpCubit, user: user),
            CustomButton(
              text: "Next",
              onPressed: () {
                signUpCubit.updateUser(user);
                if (user.country.isNotEmpty &&
                    user.university.isNotEmpty &&
                    user.system.isNotEmpty &&
                    user.level.isNotEmpty) {
                  signUpCubit.nextPage();
                }
              },
              width: AppMedia.width(context) / 2,
            ),
          ],
        ),
      ),
    );
  }
}
