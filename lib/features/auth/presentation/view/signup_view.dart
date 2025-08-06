import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/view/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/view/manager/signup_cubit/signup_state.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_page_view/personal_info_step.dart';
import 'package:sinna/features/auth/presentation/view/widgets/signup_page_view/university_info_step.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          final cubit = context.read<SignUpCubit>();
          return Scaffold(
            body: PageView(
              controller: cubit.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [UniversityInfoStep(), PersonalInfoStep()],
            ),
          );
        },
      ),
    );
  }
}
