import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/categories/presentation/manager/user_info_cubit/user_info_cubit.dart';
import 'package:sinna/features/categories/presentation/view/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories Page")),
      body: BlocProvider(
        create: (context) => UserInfoCubit(),
        child: CategoriesViewBody(),
      ),
    );
  }
}
