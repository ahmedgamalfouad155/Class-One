import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_state.dart';
import 'package:sinna/features/explore/presentation/widgets/discover_app_bar_widget.dart';
import 'package:sinna/features/explore/presentation/widgets/list_of_subjects_widget.dart';

class ExploreScreenBody extends StatelessWidget {
  const ExploreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: BlocBuilder<UserAcademicInfoCubit, UserAcademicInfoState>(
            builder: (context, state) {
              if (state is UserAcademicInfoSuccessState) {
                final path = CoursePathModel(
                  specialization: convert[state.userModel.specialization],
                  institution: convert[state.userModel.institution],
                  level: convert[state.userModel.level],
                );
                return Column(
                  children: [
                    DiscoverAppBarWidget( path: path),
                    const SizedBox(height: 10),
                    ListOfSubjectsWidget( path: path),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
