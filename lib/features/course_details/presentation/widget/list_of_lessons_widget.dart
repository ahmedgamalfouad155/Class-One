import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_bottom_sheet.dart';
import 'package:sinna/features/course_details/presentation/widget/lesson_item_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class ListOfLessonsWidget extends StatelessWidget {
  const ListOfLessonsWidget({super.key, required this.sortedLessons, required this.coursePathModels});

  final List<CourseModel> sortedLessons;
  final CoursePathModel coursePathModels;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, int>(
      builder: (context, selectedIndex) {
        // 🟩 تحديد الترم الحالي بناءً على الفلتر
        final String currentTerm = selectedIndex == 0
            ? 'first term'
            : 'second term';

        // 🟩 تصفية الدروس بناءً على الترم المختار
        final filteredLessons = sortedLessons
            .where((lesson) => lesson.term.toLowerCase().contains(currentTerm))
            .toList();

        if (filteredLessons.isEmpty) {
          final isAdmin = context.read<AuthCubit>().emailAdmin;
          return Center(
            child: Column(
              children: [
                SizedBox(height: context.height / 7),
                CustomEmptyScreen(
                  image: AppImages.emptyDashbord,
                  title: "No lessons yet",
                  subTitle: "You can add one to get started",
                ),
                const SizedBox(height: 10),
                isAdmin
                    ? CustomButton(
                        width: context.width / 2,
                        text: "Create Lesson",
                        onPressed: () => createLessonBottomSheet(context , coursePathModels),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              LessonItemWidget(course: filteredLessons[index],
              coursePathModel: coursePathModels,
              ),
          itemCount: filteredLessons.length,
        );
      },
    );
  }
}
