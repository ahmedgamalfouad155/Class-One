import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).logout();
          },
          child: Text("Logout", style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
