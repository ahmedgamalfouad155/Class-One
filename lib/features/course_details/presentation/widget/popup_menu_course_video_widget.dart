import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/course_details/presentation/widget/attachments_bottom_sheet.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_bottom_sheet.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/generated/locale_keys.g.dart';

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
            attachmentsBottomSheet(context, coursePathModels, course);
            break;
        }
      },

      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'edit_lesson',
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Text(
              LocaleKeys.update_lesson.tr(),
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        const PopupMenuDivider(height: 1),
         PopupMenuItem(
          value: 'attachments',
          child: Text(
            LocaleKeys.attachments.tr(),
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
