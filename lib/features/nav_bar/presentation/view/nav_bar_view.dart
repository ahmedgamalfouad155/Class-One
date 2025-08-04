import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/nav_bar/presentation/manager/nav_bar_cubit/navbar_cubit.dart';
import 'package:sinna/features/nav_bar/presentation/view/widgets/nav_bar_view_body.dart';

class NavBarView extends StatelessWidget { 

  const NavBarView({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: NavBarViewBody(), 
    );
  }
}
