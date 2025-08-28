class SignUpState {}

final class SignupLoadingState extends SignUpState {}

final class SignupSuccessState extends SignUpState {}

final class SignupFailedState extends SignUpState {
  final String error;
  SignupFailedState(this.error);
}
