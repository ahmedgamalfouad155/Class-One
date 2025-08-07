import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_country_and_university_and_system_and_levels_section.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_image_and_header_widget.dart';

class UniversityInfoStep extends StatefulWidget {
  const UniversityInfoStep({super.key});

  @override
  State<UniversityInfoStep> createState() => _UniversityInfoStepState();
}

class _UniversityInfoStepState extends State<UniversityInfoStep> {
  final countryController = TextEditingController();
  final universityController = TextEditingController();
  final systemController = TextEditingController();
  final levelsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    countryController.dispose();
    universityController.dispose();
    systemController.dispose();
    levelsController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final user = context.read<SignUpCubit>().state.user;
    countryController.text = user.country;
    universityController.text = user.university;
    systemController.text = user.system;
    levelsController.text = user.level;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    final user = context.watch<SignUpCubit>().state.user;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SignupImageAndHeaderWidget(),
              SignupCountryAndUniversityAndSystemAndLevelsFieldsSection(
                countryController: countryController,
                universityController: universityController,
                systemController: systemController,
                levelsController: levelsController,
              ),
              CustomButton(
                text: "Next",
                onPressed: () {
                  final updatedUser = user.copyWith(
                    country: countryController.text,
                    university: universityController.text,
                    system: systemController.text,
                    level: levelsController.text,
                  );
                  cubit.updateUser(updatedUser);
                  if (formKey.currentState!.validate()) {
                    cubit.nextPage();
                  }
                },
                width: AppMedia.width(context) / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
