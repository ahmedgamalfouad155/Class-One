import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/presentation/manager/steps_cubit/steps_cubit.dart';
import 'package:sinna/features/addmin/presentation/view/widgets/account_steps_section_widget.dart';

class AccountViowBody extends StatelessWidget {
  const AccountViowBody({super.key});
  @override
  Widget build(BuildContext context) { 
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => StepsCubit(),
              child: AccountStepsSectionWidget( 
              ),
            ), 
          ],
        ),
      ),
    );
  }
}
