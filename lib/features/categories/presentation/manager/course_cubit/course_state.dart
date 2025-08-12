import 'package:sinna/features/categories/data/models/course_model.dart';

sealed class CourseState {}

final class CourseInitial extends CourseState {}

final class CourseLoadingState extends CourseState {}

final class CourseSuccessState extends CourseState {
  final List<CourseModel> courses;
  CourseSuccessState(this.courses);
}

final class CourseFailureState extends CourseState {
  final String errMessage;

  CourseFailureState(this.errMessage);
}

