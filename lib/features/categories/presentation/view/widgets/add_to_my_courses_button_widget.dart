import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:sinna/core/constants/images.dart';
import 'package:sinna/core/theme/colors.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/default_button_widget.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';
import 'package:sinna/features/categories/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_cubit.dart';
import 'package:sinna/features/categories/presentation/manager/add_to_my_courses_cubit/add_to_my_courses_state.dart';

class AddToMyCoursesButtonWidget extends StatelessWidget {
  const AddToMyCoursesButtonWidget({super.key, required this.coursePathModel});
  final CoursePathModel coursePathModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToMyCoursesCubit, AddToMyCoursesState>(
      listener: (context, state) {
        if (state is AddingCourseSuccessState) {
          CustomAnimatedDialog.show(
            context: context,
            message: "Course added successfully ✅🎉",
            icon: Lottie.asset(AppAinmation.done, width: 100),
          );
        }
      },
      builder: (context, state) {
        if (state is AddingCourseLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddingCourseFailureState) {
          return Text(state.errMessage);
        } else if (state is AddToMyCoursesInitial ||
            state is AddingCourseSuccessState) {
          return DefaultButtonWidget(
            text: "Add To My Courses",
            bacgrouncColor: context.appColors.white,
            textColor: context.appColors.blue,
            onPressed: () {
              // print(coursePathModel.country);
              // print(coursePathModel.university);
              // print(coursePathModel.faculty);
              // print(coursePathModel.stage);
              // print(coursePathModel.subject);
              // print(coursePathModel.term);

              context.read<AddToMyCoursesCubit>().addCouseToMyCourse(
                coursePathModel: coursePathModel,
              );
            },
            icon: LottieBuilder.asset(AppAinmation.addTo),
          );
        } else {
          return const Text("error");
        }
      },
    );
  }
}


