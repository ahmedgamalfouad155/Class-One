import 'package:flutter/widgets.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_button_widget.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_image_and_header_widget.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_name_and_email_and_password_fields_section_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
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
