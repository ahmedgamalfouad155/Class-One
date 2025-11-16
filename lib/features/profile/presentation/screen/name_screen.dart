import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/features/profile/presentation/manager/user_info/user_info_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/name_screen_body.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.name.tr(),
          style: AppStyles.textStyle20W600(context),
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => UserInfoCubit(),
        child: NameScreenBody(),
      ),
    );
  }
}
