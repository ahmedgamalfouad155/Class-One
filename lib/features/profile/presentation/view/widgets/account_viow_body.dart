import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/auth/presentation/view/widgets/university_info_step.dart';

class AccountViowBody extends StatelessWidget {
  const AccountViowBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => StepsCubit()),
              BlocProvider(create: (context) => SignUpCubit()),
            ],
            child: UniversityInfoStep(),
          ),
        ],
      ),
    );
  }
}
