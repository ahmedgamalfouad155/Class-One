import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/final_ui/manager/phone_auth_cubit.dart';
import 'package:sinna/features/final_ui/widgets/otp_screen_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PhoneAuthCubit(),
        child: OtpScreenBody(),
      ),
    );
  }
}
