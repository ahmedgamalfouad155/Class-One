import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/customs_box_decoratino.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/delete_account_dialog_widget.dart';
import 'package:sinna/features/profile/presentation/screen/widgets/profile_option_widget.dart';

class OtherSection extends StatelessWidget {
  const OtherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Other", style: AppStyles.textStyle16w400Grey(context)),
        const SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: CustomsBoxDecoration().profileDecoration(context),
          child: Column(
            children: [
              ProfileOptionWidget(
                title: "delete account",
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => const DeleteAccountDialogWidget(),
                  );
                },
              ),
              CustomDividerWidget(isHeight: false),
              ProfileOptionWidget(
                title: "Logout",
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                  (context).go(AppRouter.kLogInScreen);
                },
              ),
              CustomDividerWidget(isHeight: false),
              ProfileOptionWidget(title: "Other", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
