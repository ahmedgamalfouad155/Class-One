import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/subject_cubit/subject_state.dart';
import 'package:sinna/features/explore/presentation/manager/user_info_cubit/user_info_cubit.dart';
import 'package:sinna/features/explore/presentation/manager/user_info_cubit/user_info_state.dart';
import 'package:sinna/features/explore/presentation/screens/widgets/name_of_subject_item_widget.dart';

class ListOfSubjectsWidget extends StatelessWidget {
  const ListOfSubjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccessState) {
          final path = CoursePathModel(
            country: convert[state.userModel.country],
            university: convert[state.userModel.university],
            faculty: convert[state.userModel.faculty],
            program: convert[state.userModel.program],
            stage: convert[state.userModel.stage],
          );
          return Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 20),
            child: BlocBuilder<SubjectCubit, SubjectState>(
              bloc: context.read<SubjectCubit>()..getSubjects(path),
              builder: (context, state) {
                if (state is SubjectLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SubjectFailureState) {
                  return Text(state.errMessage);
                } else if (state is SubjectSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<UserInfoCubit>().getUserInfo();
                      context.read<SubjectCubit>().getSubjects(path);
                    },
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.subjects.length,
                      itemBuilder: (context, index) {
                        return NameOfSubjectItemWidget(
                          onTap: () {
                            path.update(
                              subject: state.subjects[index].id,
                              subjectName: state.subjects[index].subjectName,
                              subjectDoctor:
                                  state.subjects[index].subjectDoctor,
                              subjectImage: state.subjects[index].subjectImage,
                            );
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kTermScreen, extra: path);
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
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
