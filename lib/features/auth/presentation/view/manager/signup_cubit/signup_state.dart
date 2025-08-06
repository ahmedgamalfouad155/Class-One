import 'package:sinna/features/auth/data/models/user_model.dart';

class SignUpState {
  final UserModel user;

  SignUpState({UserModel? user}) : user = user ?? UserModel.empty();

  SignUpState copyWith({UserModel? user}) {
    return SignUpState(user: user ?? this.user);
  }
}

final class SignupLoadingState extends SignUpState {}

final class SignupSuccessState extends SignUpState {}

final class SignupFailedState extends SignUpState {
  final String error;
  SignupFailedState(this.error);
}
