import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/cubit/special_cubit/special_cubit.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_filters_widget.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_cubit.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_state.dart';
import 'package:sinna/features/my_courses/presentation/screens/widgets/subject_item_widget.dart';

class MyCoursesScreenBody extends StatelessWidget {
  const MyCoursesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => FilterCubit(),
              child: CustomFiltersWidget(
                filters: dashboardFilters,
                layoutType: SpecialLayoutType.wrap,
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<MyCoursesCubit, MyCoursesState>(
              builder: (context, state) {
                if (state is MyCoursesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MyCoursesFailureState) {
                  return Text(state.errMessage);
                } else if (state is MyCoursesSuccessState) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: .8,
                        ),
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      return SubjectItemWidget(
                        onTap: () {
                          if (state.courses[index].isPaid!) {
                            GoRouter.of(context).push(
                              AppRouter.kUserCcourseDetailsScreen,
                              extra: state.courses[index],
                            );
                          } else {
                            CustomAnimatedDialog.show(
                              context: context,
                              message:
                                  "Please contact with support to unlock this course",
                              animationType: DialogAnimationType.warning,
                            );
                          }
                        },
                        subjectDoctor: state.courses[index].subjectDoctor
                            .toString(),
                        subjectName: state.courses[index].subjectName
                            .toString(),
                      );
                    },
                  );
                } else {
                  return const Text("error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
