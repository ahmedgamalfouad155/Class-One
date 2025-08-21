import 'package:sinna/features/categories/data/models/course_path_model.dart';

sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}

final class MyCoursesLoadingState extends MyCoursesState {}

final class MyCoursesSuccessState extends MyCoursesState {
  final List<CoursePathModel> courses;
  MyCoursesSuccessState(this.courses);
}

final class MyCoursesFailureState extends MyCoursesState {
  final String errMessage;
  MyCoursesFailureState(this.errMessage);
}
