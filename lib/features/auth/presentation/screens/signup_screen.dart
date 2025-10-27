import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/widgets/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: SignupScreenBody(),
      ),
    );
  }
}

// ahmedgfouad2020@gmail.com
