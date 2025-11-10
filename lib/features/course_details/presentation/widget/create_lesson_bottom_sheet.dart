import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_button_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/second_semester_section.dart';
import 'package:sinna/features/course_details/presentation/widget/update_lesson_button_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void createLessonBottomSheet(
  BuildContext context,
  CoursePathModel path, [
  bool? isEdit = false,
  CourseModel? course,
]) {
  final TextEditingController lessonTitleController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  isEdit == true ? lessonTitleController.text = course!.tittle : '';
  isEdit == true ? videoUrlController.text = course!.videoUrl : '';

  CustomBottomSheet.show(
    context: context,

    child: SizedBox(
      height: context.height * 0.9,
      width: context.width,
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleInButtomSheetWidget(title: "Create Lesson"),
                  const SizedBox(height: 6),
                  CustomTextFieldWidget(
                    hintText: "Impression Techniques for Crowns",
                    controller: lessonTitleController,
                    vlaidationMessage: "Enter a valid lesson title.",
                  ),
                  const SizedBox(height: 16),
                  CustomTextFieldWidget(
                    hintText: "https://youtu.be/abcd1234",
                    controller: videoUrlController,
                    vlaidationMessage: "Enter a valid video link.",
                  ),
                  const SizedBox(height: 16),
                  SecondSemesterSection(),
                  const SizedBox(height: 10),
                  Text(
                    "When off, the lesson applies to the first semester or the full year if no second semester is set.",
                    style: AppStyles.textStyle12GreyW400(
                      context,
                    ).copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: BlocProvider(
                create: (context) => LessonManagerCubit(),
                child: Column(
                  children: [
                    Expanded(child: const SizedBox()),
                    isEdit == false
                        ? CreateLessonButtonWidget(
                            lessonTitleController: lessonTitleController,
                            videoUrlController: videoUrlController,
                            formKey: formKey,
                            path: path,
                          )
                        : UpdateLessonButtonWidget(
                            formKey: formKey,
                            lessonTitleController: lessonTitleController,
                            videoUrlController: videoUrlController,
                            course: course!,
                            path: path,
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
