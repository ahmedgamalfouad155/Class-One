

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_bottom_sheet.dart';
import 'package:sinna/features/course_details/presentation/widget/participants_bootom_sheet.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/widgets/create_course_bottom_sheet.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class PopupMenuCourseWidget extends StatelessWidget {
  const PopupMenuCourseWidget({super.key, required this.coursePathModels});
  final CoursePathModel coursePathModels;

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
          case 'edit':
            createCourseBottomSheet(context, coursePathModels, true);

            break;

          case 'add_lesson':
            createLessonBottomSheet(context, coursePathModels);
            break;

          case 'participants':
            participantsBottomSheet(context, coursePathModels);
            break;
        }
      },

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit',
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child:  Text(  LocaleKeys.edit_course.tr(), style: TextStyle(fontSize: 14)),
          ),
        ),
        const PopupMenuDivider(height: 1),
         PopupMenuItem(
          value: 'add_lesson',
          child: Text(  LocaleKeys.add_lesson.tr(), style: TextStyle(fontSize: 14)),
        ),
        const PopupMenuDivider(height: 1),
         PopupMenuItem(
          value: 'participants',
          child: Text(  LocaleKeys.participants.tr() , style: TextStyle(fontSize: 14)),
        ),
      ],
    );
  }
}
