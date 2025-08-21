import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_cubit.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_state.dart';
import 'package:sinna/features/my_courses/presentation/view/widgets/subject_item_widget.dart';

class MyCoursesViewBody extends StatelessWidget {
  const MyCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      builder: (context, state) {
        if (state is MyCoursesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyCoursesFailureState) {
          return Text(state.errMessage);
        } else if (state is MyCoursesSuccessState) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: .9,
            ),
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              return SubjectItemWidget(
                onTap: () { 
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kCoursesView, extra: state.courses[index]);
                },
                subjectDoctor: state.courses[index].subjectDoctor.toString(),
                subjectName: state.courses[index].subjectName.toString(),
              );
            },
          );
        } else {
          return const Text("error");
        }
      },
    );
  }
}
