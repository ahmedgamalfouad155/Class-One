sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {}

final class LoginFailedState extends LoginState {
  final String error;
  LoginFailedState(this.error);
}

final class NotSameDeviceState extends LoginState {}
