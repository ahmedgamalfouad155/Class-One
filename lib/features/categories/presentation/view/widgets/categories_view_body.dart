import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/categories/data/models/lesson_path_model.dart';
import 'package:sinna/features/categories/data/services/firebase_lesson_pathes_services.dart';
import 'package:sinna/features/categories/presentation/manager/user_info_cubit/user_info_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/user_info_cubit/user_info_state.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoSuccessState) {
          final path = LessonPathModel(
            country: state.userModel.country,
            university: state.userModel.university,
            system: state.userModel.system,
            level: state.userModel.level,
          );
          final subjectPath = FirebaseLessonService.instance; 
          return FutureBuilder<List<String>>(
            future: subjectPath.getSubjects(path),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              final subjects = snapshot.data ?? [];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        path.update(subject: subjects[index]);
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kTermView, extra: path);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.appColors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text(subjects[index])),
                      ),
                    );
                  },
                ),
              );
            },
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
