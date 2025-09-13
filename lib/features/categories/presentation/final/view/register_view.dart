import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/presentation/final/manager/phone_auth_cubit.dart';
import 'package:sinna/features/categories/presentation/final/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: RegisterViewBody(),
      ),
    );
  }
}
