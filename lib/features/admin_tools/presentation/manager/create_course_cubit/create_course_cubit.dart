import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'create_course_state.dart';

class CreateCourseCubit extends Cubit<CreateCourseState> {
  CreateCourseCubit() : super(CreateCourseInitial());

  // البيانات الأساسية من صفحة Setup
  String? specialization;
  String? program;
  String? university;
  String? level;

  // البيانات من صفحة Info
  String? courseTitle;
  String? photoUrl;

  void setSetupData({
    required String specialization,
    required String program,
    required String university,
    required String level,
  }) {
    this.specialization = specialization;
    this.program = program;
    this.university = university;
    this.level = level;
    emit(CreateCourseSetupUpdated());
    emit(CreateCourseGoToNextTabState(1));
  }

  void setInfoData({
    required String courseTitle,
    required String photoUrl,
  }) {
    this.courseTitle = courseTitle;
    this.photoUrl = photoUrl;
    emit(CreateCourseInfoUpdated());
  }
}
