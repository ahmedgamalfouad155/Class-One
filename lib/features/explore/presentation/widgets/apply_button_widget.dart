import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/cubit/radio_cubit/radio_cubit.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/widgets/custom_animated_dialod.dart';
import 'package:sinna/core/widgets/custom_buton.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/presentation/manager/create_course_cubit/create_course_cubit.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';
import 'package:sinna/generated/locale_keys.g.dart';

class ApplyButtonWidget extends StatelessWidget {
  const ApplyButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.courseTitleController,
    required this.photoUrlController,
    required this.path,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController courseTitleController;
  final TextEditingController photoUrlController;
  final CoursePathModel path;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RadioCubit>(),
      child: BlocConsumer<CreateCourseCubit, CreateCourseState>(
        listener: (context, state) {
          if (state is CreateCourseSuccessState) {
            CustomAnimatedDialog.show(
              context: context,
              message: " ${LocaleKeys.course_created_successfully.tr()} ✅🎉",
              animationType: DialogAnimationType.success,
            );
          }
        },
        builder: (context, state) {
          if (state is CreateCourseLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CreateCourseFailureState) {
            return Text(state.errMessage);
          } else if (state is CreateCourseInitial ||
              state is CreateCourseSuccessState) {
            return CustomButton(
              text: LocaleKeys.create.tr(),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final courseInfo = CourseInfoModel(
                    id: generateFirestoreId(FireStoreCollectionsName.courses),
                    title: courseTitleController.text.trim(),
                    instructor: context.read<RadioCubit>().state!,
                    image: photoUrlController.text.trim(),
                  );
                  context.read<CreateCourseCubit>().createCourse(
                    courseInfo,
                    path,
                  );
                }
              },
            );
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}
