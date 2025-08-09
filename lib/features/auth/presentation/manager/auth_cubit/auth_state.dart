class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailedState extends AuthState {
  final String error;
  LoginFailedState(this.error);
} 

final class LogoutLoadingState extends AuthState{}
final class LogoutFailedState extends AuthState {
  final String error; 
  LogoutFailedState(this.error);
}
