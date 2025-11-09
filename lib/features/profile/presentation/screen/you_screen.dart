import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/widgets/custom_user_info_widget.dart';
import 'package:sinna/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/profile_screen_body.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserInfoCubit, UserInfoState>(
          builder: (context, state) {
            if (state is UserInfoLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is UserInfoSuccessState) {
              return CustomUserInfoWidget(
                name: state.userModel.name!,
                email: state.userModel.email!,
              );
            }
            if (state is UserInfoFailedState) {
              return Text(state.error);
            } else {
              return const Text("error");
            }
          },
        ),
      ),
      body: YouScreenBody(),
    );
  }
}
