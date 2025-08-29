import 'package:sinna/features/categories/data/models/course_path_model.dart';

sealed class ControlPanalState {}

final class ControlPanalInitial extends ControlPanalState {}

final class DisplanyingUserCoursesLoadingState extends ControlPanalState {}

final class DisplanyingUserCoursesSuccessState extends ControlPanalState {
  final List<CoursePathModel> courses;
  DisplanyingUserCoursesSuccessState(this.courses);
}

final class DisplanyingUserCoursesFailureState extends ControlPanalState {
  final String errMessage;
  DisplanyingUserCoursesFailureState(this.errMessage);
}
