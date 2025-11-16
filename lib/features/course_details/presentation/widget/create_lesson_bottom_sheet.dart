import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sinna/core/theme/styles.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/core/widgets/custom_text_field_widget.dart';
import 'package:sinna/features/course_details/presentation/manager/lesson_manager/lesson_manager_cubit.dart';
import 'package:sinna/features/course_details/presentation/manager/term_switch_cubit.dart';
import 'package:sinna/features/course_details/presentation/widget/create_lesson_button_widget.dart';
import 'package:sinna/features/course_details/presentation/widget/second_semester_section.dart';
import 'package:sinna/features/course_details/presentation/widget/update_lesson_button_widget.dart';
import 'package:sinna/features/explore/data/models/course_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';
import 'package:sinna/generated/locale_keys.g.dart';

void createLessonBottomSheet(
  BuildContext context,
  CoursePathModel path, [
  bool? isEdit = false,
  CourseModel? course,
]) {
  final TextEditingController lessonTitleController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();
  final TextEditingController lessonNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  isEdit == true ? lessonTitleController.text = course!.tittle : '';
  isEdit == true ? videoUrlController.text = course!.videoUrl : '';
  isEdit == true ? lessonNumberController.text = course!.number.toString() : '';

  CustomBottomSheet.show(
    context: context,

    child: SizedBox(
      height: context.height * 0.9,
      width: context.width,
      child: Form(
        key: formKey,
        child: BlocProvider(
          create: (context) => TermSwitcherCubit(
            initialValue: isEdit == true && course!.term == 'second term',
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleInButtomSheetWidget(
                      title: isEdit == false
                          ? LocaleKeys.create_lesson.tr()
                          : LocaleKeys.update_lesson.tr(),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      LocaleKeys.lesson_title.tr(),
                      style: AppStyles.textStyle16W600Grey(context),
                    ),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      hintText: "e.g., Cleaning and Shaping",
                      controller: lessonTitleController,
                      vlaidationMessage: LocaleKeys.enter_valid_lesson_title
                          .tr(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      LocaleKeys.video_url.tr(),
                      style: AppStyles.textStyle16W600Grey(context),
                    ),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      hintText: "https://youtu.be/abcd1234",
                      controller: videoUrlController,
                      vlaidationMessage: LocaleKeys.enter_valid_video_link.tr(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      LocaleKeys.lesson_number.tr(),
                      style: AppStyles.textStyle16W600Grey(context),
                    ),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      hintText: LocaleKeys.lesson_number.tr(),
                      controller: lessonNumberController,
                      vlaidationMessage: LocaleKeys.enter_valid_lesson_number
                          .tr(),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      LocaleKeys.semester.tr(),
                      style: AppStyles.textStyle16W600Grey(context),
                    ),
                    const SizedBox(height: 6),
                    const SecondSemesterSection(),
                    const SizedBox(height: 10),
                    Text(
                      LocaleKeys
                          .when_off_the_lesson_applies_to_the_first_semester_or_the_full_year_if_no_second_semester_is_set
                          .tr(),
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
                              lessonNumberController: lessonNumberController,
                              formKey: formKey,
                              path: path,
                            )
                          : UpdateLessonButtonWidget(
                              formKey: formKey,
                              lessonTitleController: lessonTitleController,
                              videoUrlController: videoUrlController,
                              lessonNumberController: lessonNumberController,
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
    ),
  );
}
