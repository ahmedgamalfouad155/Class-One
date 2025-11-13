import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
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
                // print(state.userModel.specialization);
                // print(state.userModel.institution);
                // print(state.userModel.level);
                final path = CoursePathModel(
                  specialization: normalizeFirestoreName(
                    state.userModel.specialization.toString(),
                  ),
                  institution: normalizeFirestoreName(
                    state.userModel.institution.toString(),
                  ),
                  level: normalizeFirestoreName(
                    state.userModel.level.toString(),
                  ),
                );
                return Column(
                  children: [
                    DiscoverAppBarWidget(path: path),
                    const SizedBox(height: 10),
                    ListOfSubjectsWidget(path: path),
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
