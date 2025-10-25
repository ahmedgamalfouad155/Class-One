import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/auth/presentation/widgets/signup_button_widget.dart';
import 'package:sinna/features/auth/presentation/widgets/signup_name_and_email_and_password_fields_section_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class SignupScreenBody extends StatefulWidget {
  const SignupScreenBody({super.key});

  @override
  State<SignupScreenBody> createState() => _SignupScreenBodyState();
}

class _SignupScreenBodyState extends State<SignupScreenBody> {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                LocaleKeys.start_with_basic_information.tr(),
                style: AppStyles.textStyle32(context),
              ),
              const SizedBox(height: 20),
              SignupNameAndEmailAndPaswordFieldsSectionWidget(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
              ),
              const SizedBox(height: 20),
              SignupButtonWidget(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                formKey: formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
