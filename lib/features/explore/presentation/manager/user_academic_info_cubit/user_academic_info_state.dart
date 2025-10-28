import 'package:sinna/features/auth/data/models/user_academic_model.dart';

sealed class UserAcademicInfoState {}

final class UserAcademicInfoInitial extends UserAcademicInfoState {}

final class UserAcademicInfoLoadingState extends UserAcademicInfoState {}

final class UserAcademicInfoSuccessState extends UserAcademicInfoState {
  final UserAcademicModel userModel;
  UserAcademicInfoSuccessState(this.userModel);
}

final class UserAcademicInfoFailedState extends UserAcademicInfoState {
  final String error;
  UserAcademicInfoFailedState(this.error);
}
