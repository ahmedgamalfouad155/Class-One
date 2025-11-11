import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/admin_tools/presentation/widgets/cancel_button_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/course_cubit/course_cubit.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class DeleteCourseDialogWidget extends StatelessWidget {
  const DeleteCourseDialogWidget({
    super.key,
    required this.coursePathModel,
    required this.cubit,
  });
  final CoursePathModel coursePathModel;
  final CourseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: context.appColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          "Delete Course",
          style: AppStyles.textStyle20W600(context),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "This action will permanently delete the course and cannot be undone.",
              style: AppStyles.textStyle16W600Grey(context),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCancelTextWidget(),
              const SizedBox(width: 10),
              CustomButton(
                width: context.width / 2.5,
                text: "Delete Course",
                onPressed: () {
                  cubit.deleteCourse(coursePathModel);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
