import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_cubit.dart';
import 'package:sinna/features/nav_bar/presentation/screens/widgets/nav_bar_screen_body.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: NavBarScreenBody(),
    );
  }
}
