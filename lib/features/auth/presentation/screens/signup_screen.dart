// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
// import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
// import 'package:sinna/features/auth/presentation/view/widgets/personal_info_step.dart';
// import 'package:sinna/features/auth/presentation/view/widgets/university_info_step.dart';

// class SignUpView extends StatelessWidget {
//   const SignUpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => SignUpCubit(),
//       child: Builder(
//         builder: (context) {
//           final cubit = context.read<SignUpCubit>();
//           return Scaffold(
//             body: PageView(
//               controller: cubit.pageController,
//               physics: const NeverScrollableScrollPhysics(),
//               children: [
//                 BlocProvider(
//                   create: (_) => StepsCubit(),
//                   child: UniversityInfoStep(),
//                 ),
//                 const PersonalInfoStep(),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:sinna/features/auth/presentation/widgets/signup_screen_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAddingPhoneScreen);
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: SignupScreenBody(),
      ),
    );
  }
}
