import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:sinna/features/auth/presentation/widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: ForgetPasswordScreenBody(),
      ),
    );
  }
}
