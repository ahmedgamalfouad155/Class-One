import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/login_cubit/login_state.dart';
import 'package:sinna/generated/locale_keys.g.dart';

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
          (context).go(AppRouter.kNavBarScreen);
        } else if (state is NotSameDeviceState) {
          return CustomAnimatedDialog.show(
            context: context,
            message:
                "هذا الميل مسجل علي جهاز اخر بالغعل يجب تسجيل الخروج من الجهاز الاخر اولا ثم المحاوله مره اخري ",
            animationType: DialogAnimationType.warning,
          );
        }
        if (state is LoginFailedState) {
          return CustomAnimatedDialog.show(
            context: context,
            message: state.error,
            animationType: DialogAnimationType.error,
          );
        }
      },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return CircularProgressIndicator();
        } else if (state is LoginInitial ||
            state is LoginSuccessState ||
            state is LoginFailedState ||
            state is NotSameDeviceState) {
          return CustomButton(
            text: LocaleKeys.sign_in.tr(),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                loginCubit.login(emailController.text, passwordController.text);
              }
            },
          );
        } else {
          return const Text("error");
        }
      },
    );
  }
}
