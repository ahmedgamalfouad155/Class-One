import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/special_cubit/filter_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/lesson_item_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';

class ListOfLessonsWidget extends StatelessWidget {
  const ListOfLessonsWidget({super.key, required this.sortedLessons});

  final List<CourseModel> sortedLessons;

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
          return const Center(
            child: Text(
              'No lessons available for this term',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) =>
              LessonItemWidget(course: filteredLessons[index]),
          itemCount: filteredLessons.length,
        );
      },
    );
  }
}
