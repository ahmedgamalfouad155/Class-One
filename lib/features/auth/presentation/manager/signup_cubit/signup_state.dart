import 'package:sinna/features/auth/data/models/user_info_model.dart';

class SignUpState {}

final class SignupLoadingState extends SignUpState {}

final class SignupSuccessState extends SignUpState {}

final class SignupEmailSentState extends SignUpState {
  final UserInfoModel userBaseModel;
  SignupEmailSentState(this.userBaseModel);
}

final class SignupEmailNotVerifiedState extends SignUpState {
  final String message;
  SignupEmailNotVerifiedState(this.message);
}

final class SignupFailedState extends SignUpState {
  final String error;
  SignupFailedState(this.error);
}
