import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/addmin/presentation/manager/account_cubit/account_cubit.dart';
import 'package:sinna/features/addmin/presentation/view/widgets/account_viow_body.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Account")),
      body: BlocProvider(
        create: (context) => AccountCubit(),
        child: AccountViowBody(),
      ),
    );
  }
}
