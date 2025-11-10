import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_bottom_sheet.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class PopupMenuCourseVideoWidget extends StatelessWidget {
  const PopupMenuCourseVideoWidget({
    super.key,
    required this.coursePathModels,
    required this.course,
  });
  final CoursePathModel coursePathModels;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      color: context.appColors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: const Offset(0, 40),
      onSelected: (value) {
        switch (value) {
          case 'edit_lesson':
            createLessonBottomSheet(context, coursePathModels, true, course);

            break;

          case 'attachments':
            // createLessonBottomSheet(context, coursePathModels);
            break;
        }
      },

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit_lesson',
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: const Text('Edit Lesson', style: TextStyle(fontSize: 14)),
          ),
        ),
        const PopupMenuDivider(height: 1),
        const PopupMenuItem(
          value: 'attachments',
          child: Text('Attachments', style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
