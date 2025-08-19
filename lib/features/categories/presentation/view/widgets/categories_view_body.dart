import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/subject_cubit/subject_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/subject_cubit/subject_state.dart';
import 'package:sinna/features/categories/presentation/manager/user_info_cubit/user_info_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/user_info_cubit/user_info_state.dart';
import 'package:sinna/features/categories/presentation/view/widgets/name_of_subject_item_widget.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

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
            padding: const EdgeInsets.all(12.0),
            child: BlocBuilder<SubjectCubit, SubjectState>(
              bloc: context.read<SubjectCubit>()..getSubjects(path),
              builder: (context, state) {
                if (state is SubjectLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SubjectFailureState) {
                  return Text(state.errMessage);
                } else if (state is SubjectSuccessState) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: .9,
                        ),
                    itemCount: state.subjects.length,
                    itemBuilder: (context, index) {
                      return NameOfSubjectItemWidget(
                        onTap: () { 
                          path.update(subject: state.subjects[index].id);
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kTermView, extra: path);
                        },
                        subjectInfo: state.subjects[index],
                      );
                    },
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

/*
 final lesonCubit = BlocProvider.of<LeasonCubit>(context);
    lesonCubit.getLeson(
      country: 'egypt',
      university: "mansoura",
      system: "Bachelors",
      level: "level one",
      subject: "science",
      term: "first term",
      doctor: "Dr Ezzat",
    );

*/
