import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/user_info_cubit/user_info_cubit.dart';
import 'package:sinna/features/explore/presentation/view/widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserInfoCubit()),
          BlocProvider(create: (context) => SubjectCubit()),
        ],
        child: ExploreViewBody(),
      ),
    );
  }
}
