import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sinna/core/constants/images.dart'; 
import 'package:sinna/core/widgets/custom_divider_widget.dart';
import 'package:sinna/core/widgets/custom_empty_screen.dart';
import 'package:sinna/core/widgets/custom_option_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/remove_attachment_icon_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/profile/presentation/manager/theme_cubit/theme_cubit.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ListOfAttachmentBottomSheetWidget extends StatelessWidget {
  const ListOfAttachmentBottomSheetWidget({
    super.key,
    required this.course,
    required this.coursePathModel,
  });
  final CourseModel course;
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    if (course.attachments.isEmpty) {
      return CustomEmptyScreen( 
        image: context.read<ThemeCubit>().isDark
            ? AppImages.emptyAttachmentDark
            : AppImages.emptyAttachmentLight,
        title: "",
        subTitle: LocaleKeys.this_lesson_has_no_attachments.tr(), 
      );
    }
    return ListView.separated(
      itemBuilder: (context, index) => Slidable(
        key: ValueKey(course.attachments[index].pdfUrl),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.20,
          children: [
            BlocProvider(
              create: (context) => LessonManagerCubit(),
              child: RemoveAttachmentIconWidget(
                course: course,
                index: index,
                coursePathModel: coursePathModel,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomOptionWidget(
              title: course.attachments[index].pdfTitle,
              onTap: () {},
            ),
            if (index != course.attachments.length - 1)
              const CustomDividerWidget(),
          ],
        ),
      ),

      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: course.attachments.length,
    );
  }
}
