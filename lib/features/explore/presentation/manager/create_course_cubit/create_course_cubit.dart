import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/explore/data/models/course_info_model.dart';
import 'package:sinna/features/explore/data/models/course_path_model.dart';
import 'package:sinna/features/explore/data/services/create_courser_service.dart';

part 'create_course_state.dart';

class CreateCourseCubit extends Cubit<CreateCourseState> {
  CreateCourseCubit() : super(CreateCourseInitial());

  final CreateCourseService _createCourseService = CreateCourseServiceImpl();

  Future<void> createCourse(
    CourseInfoModel courseInfo,
    CoursePathModel path,
  ) async {
    emit(CreateCourseLoadingState());
    try {
      await _createCourseService.createCourse(courseInfo, path);
      emit(CreateCourseSuccessState());
    } catch (e) {
      emit(CreateCourseFailureState(e.toString()));
    }
  }

  Future<void> editCourse(
    CourseInfoModel courseInfo,
    CoursePathModel path,
  ) async {
    emit(EditCourseLoadingState());
    try {
      await _createCourseService.editCourse(courseInfo, path);
      emit(EditCourseSuccessState());
    } catch (e) {
      emit(EditCourseFailureState(e.toString()));
    }
  }
}
