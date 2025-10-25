import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/router/app_router.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_cubit.dart';
import 'package:sinna/features/my_courses/presentation/manager/cubit/my_courses_state.dart';
import 'package:sinna/features/my_courses/presentation/widgets/subject_item_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ListOfMyCoursesWidget extends StatelessWidget {
  const ListOfMyCoursesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesCubit, MyCoursesState>(
      bloc: context.read<MyCoursesCubit>()..getMyCourses(),
      builder: (context, state) {
        if (state is MyCoursesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MyCoursesFailureState) {
          return Text(state.errMessage);
        } else if (state is MyCoursesSuccessState) {
          return state.courses.isNotEmpty
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                      subjectDoctor: state.courses[index].instructor.toString(),
                      subjectName: state.courses[index].title.toString(),
                    );
                  },
                )
              : CustomEmptyScreen(
                  image: AppImages.emptyDashbord,
                  title: LocaleKeys.empty_dashboard.tr(),
                  subTitle: LocaleKeys.explore_courses.tr(),
                );
        } else {
          return const Text("error");
        }
      },
    );
  }
}
