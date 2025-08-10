import 'package:sinna/features/categories/data/models/leson_model.dart';

sealed class LessonState {}

final class LessonInitial extends LessonState {}

final class LessonLoadingState extends LessonState {}

final class LessonSuccessState extends LessonState {
  final List<LessonModel> lesson;
  LessonSuccessState(this.lesson);
}

final class LessonFailureState extends LessonState {
  final String errMessage;

  LessonFailureState(this.errMessage);
}
