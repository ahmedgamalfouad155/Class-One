import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/features/course_details/data/models/attachment_model.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';

class RemoveAttachmentIconWidget extends StatelessWidget {
  const RemoveAttachmentIconWidget({
    super.key,
    required this.course,
    required this.coursePathModel,
    required this.index,
  });
  final CourseModel course;
  final CoursePathModel coursePathModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonManagerCubit, LessonManagerState>(
      builder: (context, state) {
        if (state is RemoveAttachmentLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoveAttachmentSuccessState ||
            state is LessonManagerInitial) {
          return CustomSlidableAction(
            onPressed: (_) {
              context.read<LessonManagerCubit>().removeAttachment(
                    course,
                    coursePathModel,
                    AttachmentModel(
                      pdfTitle: course.attachments[index].pdfTitle,
                      pdfUrl: course.attachments[index].pdfUrl,
                    ),
                  );
            },
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: context.appColors.red,
                shape: BoxShape.circle,
              ),
              width: 30.w,
              height: 30.h,
              child: Icon(
                Icons.remove,
                color: context.appColors.white,
                size: 22,
              ),
            ),
          );
        }
        if (state is RemoveAttachmentFailureState) {
          return Text(state.errMessage);
        } else {
          return const Text("error");
        }
      },
    );
  }
}
