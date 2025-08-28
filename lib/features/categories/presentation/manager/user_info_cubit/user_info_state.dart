
import 'package:sinna/features/auth/data/models/user_academic_model.dart';

sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}
final class UserInfoLoadingState extends UserInfoState {}

final class UserInfoSuccessState extends UserInfoState {
  final UserAcademicModel userModel;
  UserInfoSuccessState(this.userModel);
}

final class UserInfoFailedState extends UserInfoState {
  final String error;
  UserInfoFailedState(this.error);
}
