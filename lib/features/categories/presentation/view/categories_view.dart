import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/presentation/manager/leason_cubit/leason_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LeasonCubit(),
        child: CategoriesViewBody(),
      ),
    );
  }
}
