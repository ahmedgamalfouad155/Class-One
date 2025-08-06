import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/view/manager/login_cubit/login_cubit.dart';
import 'package:sinna/features/auth/presentation/view/manager/login_cubit/login_state.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          (context).go(AppRouter.kNavBarView);
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return CircularProgressIndicator();
        } else if (state is LoginInitial || state is LoginSuccessState) {
          return CustomButton(
            text: "Login",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                loginCubit.login(emailController.text, passwordController.text);
              }
            },
          );
        } else if (state is LoginFailedState) {
          return Text(state.error);
        } else {
          return Text("error");
        }
      },
    );
  }
}
