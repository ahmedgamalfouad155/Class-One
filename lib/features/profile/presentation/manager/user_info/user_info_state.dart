part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

final class UserInfoLoadingState extends UserInfoState {}

final class UserInfoSuccessState extends UserInfoState {
  final UserInfoModel userModel;
  UserInfoSuccessState(this.userModel);
}

final class UserInfoFailedState extends UserInfoState {
  final String error;
  UserInfoFailedState(this.error);
}

  final class UserInfoUpdateLoadingState extends UserInfoState {}
  
final class UserInfoUpdateSuccessState extends UserInfoState {}

  final class UserInfoUpdateFailedState extends UserInfoState {
  final String error;
  UserInfoUpdateFailedState(this.error);
}

