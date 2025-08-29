import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/profile/presentation/manager/control_panal_cubit/control_panal_cubit.dart';
import 'package:sinna/features/profile/presentation/view/widgets/control_panal_view_body.dart';

class ControlPanalView extends StatelessWidget {
  const ControlPanalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Control Panal')),
      body: BlocProvider(
        create: (context) => ControlPanalCubit(),
        child: ControlPanalViewBody(),
      ),
    );
  }
}
