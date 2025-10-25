import 'package:flutter/material.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart'; 
import 'package:sinna/features/auth/presentation/widgets/signup_name_and_email_and_password_fields_section_widget.dart';
import 'package:sinna/features/auth/presentation/widgets/signup_button_widget.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   final user = context.read<SignUpCubit>().state.user;
  //   nameController.text = user.name!;
  //   emailController.text = user.email!;
  // }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<SignUpCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [ 
              SignupNameAndEmailAndPaswordFieldsSectionWidget(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: "Back",
                    onPressed: () {
                      // cubit.previousPage();
                    },
                    width: context.width / 3,
                  ),
                  SignupButtonWidget(
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    formKey: formKey,
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
