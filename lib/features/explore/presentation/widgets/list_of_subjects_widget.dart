import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_state.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/user_academic_info_cubit/user_academic_info_state.dart';
import 'package:sinna/features/explore/presentation/widgets/name_of_subject_item_widget.dart';

class ListOfSubjectsWidget extends StatelessWidget {
  const ListOfSubjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAcademicInfoCubit, UserAcademicInfoState>(
      builder: (context, state) {
        if (state is UserAcademicInfoSuccessState) {
          final path = CoursePathModel(
            specialization: convert[state.userModel.specialization],
            institution: convert[state.userModel.institution],
            level: convert[state.userModel.level],
          );
          return BlocBuilder<SubjectCubit, SubjectState>(
            bloc: context.read<SubjectCubit>()..getSubjects(path),
            builder: (context, state) {
              if (state is SubjectLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SubjectFailureState) {
                return Text(state.errMessage);
              } else if (state is SubjectSuccessState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<UserAcademicInfoCubit>().getUserInfo();
                    context.read<SubjectCubit>().getSubjects(path);
                  },
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.subjects.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return NameOfSubjectItemWidget(
                        onTap: () {
                          path.update(
                            courseId: state.subjects[index].id,
                            title: state.subjects[index].title,
                            instructor: state.subjects[index].instructor,
                            image: state.subjects[index].image,
                          );
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kCoursesScreen, extra: path);
                        },
                        subjectInfo: state.subjects[index],
                      );
                    },
                  ),
                );
              } else {
                return const Text("error");
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
