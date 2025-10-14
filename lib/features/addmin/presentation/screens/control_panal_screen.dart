// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sinna/core/theme/colors.dart';
// import 'package:sinna/features/addmin/presentation/manager/control_panal_cubit/control_panal_cubit.dart';
// import 'package:sinna/features/addmin/presentation/screens/widgets/control_panal_view_body.dart';

// class ControlPanalScreen extends StatelessWidget {
//   const ControlPanalScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Control Panal',
//           style: TextStyle(color: context.appColors.black),
//         ),
//       ),
//       body: BlocProvider(
//         create: (context) => ControlPanalCubit(),
//         child: ControlPanalScreenBody(),
//       ),
//     );
//   }
// }
