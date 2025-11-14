import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/utils/app_media.dart';
import 'package:sinna/features/course_details/presentation/widget/update_course_button_widget.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/manager/create_course_cubit/create_course_cubit.dart';
import 'package:sinna/features/profile/presentation/widgets/custom_bottom_sheet.dart';
import 'package:sinna/features/explore/presentation/widgets/apply_button_widget.dart';
import 'package:sinna/features/explore/presentation/widgets/course_title_and_image_section.dart';
import 'package:sinna/features/explore/presentation/widgets/instructors_info_section.dart';
import 'package:sinna/features/profile/presentation/widgets/title_in_buttom_sheet_widget.dart';

void createCourseBottomSheet(
  BuildContext context,
  CoursePathModel path, [
  bool? isEdit = false,
]) {
  final TextEditingController courseTitleController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  isEdit == true ? courseTitleController.text = path.title! : '';
  isEdit == true ? photoUrlController.text = path.image! : ''; 
  CustomBottomSheet.show(
    context: context,
    child: BlocProvider(
      create: (context) => RadioCubit(),
      child: SizedBox(
        height: context.height * 0.9,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleInButtomSheetWidget(title: "Create Course"),
                    const SizedBox(height: 20),
                    CourseTitleAndImageSection(
                      courseTitleController: courseTitleController,
                      photoUrlController: photoUrlController,
                    ),
                    const SizedBox(height: 24),
                    const InstructorsInfoSection(),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: BlocProvider(
                  create: (context) => CreateCourseCubit(),
                  child: Column(
                    children: [
                      Expanded(child: const SizedBox()),
                      isEdit == false
                          ? ApplyButtonWidget(
                              formKey: formKey,
                              photoUrlController: photoUrlController,
                              courseTitleController: courseTitleController,
                              path: path,
                            )
                          : UpdateCourseButtonWidget(
                              formKey: formKey,
                              photoUrlController: photoUrlController,
                              courseTitleController: courseTitleController,
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
