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
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
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
              ? GridView.builder(
                  itemCount: state.courses.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final course = state.courses[index];
                    return SubjectItemWidget(
                      onTap: () {
                        if (course.isPaid!) {
                          GoRouter.of(context).push(
                            AppRouter.kUserCcourseDetailsScreen,
                            extra: course,
                          );
                        } else {
                          CustomAnimatedDialog.show(
                            context: context,
                            message:
                                  LocaleKeys.please_contact_support_to_unlock_this_course.tr(),
                            animationType: DialogAnimationType.warning,
                          );
                        }
                      },
                      subjectDoctor: course.instructor.toString(),
                      subjectName: course.title.toString(),
                    );
                  },
                )
              : CustomEmptyScreen(
                  image: context.read<ThemeCubit>().isDark
                      ? AppImages.emptyDashbordDark
                      : AppImages.emptyDashbordLight,
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
