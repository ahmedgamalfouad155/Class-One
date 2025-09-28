import 'package:flutter/widgets.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/signup_button_widget.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/signup_image_and_header_widget.dart';
import 'package:sinna/features/auth/presentation/screens/widgets/signup_name_and_email_and_password_fields_section_widget.dart';

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
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SignupImageAndHeaderWidget(),
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
