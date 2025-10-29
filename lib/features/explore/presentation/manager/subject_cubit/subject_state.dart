import 'package:sinna/features/explore/data/models/course_info_model.dart';

sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}

final class SubjectLoadingState extends SubjectState {}

final class SubjectSuccessState extends SubjectState {
  final List<CourseInfoModel> subjects;
  SubjectSuccessState(this.subjects);
}

final class SubjectFailureState extends SubjectState {
  final String errMessage;
  SubjectFailureState(this.errMessage);
}
