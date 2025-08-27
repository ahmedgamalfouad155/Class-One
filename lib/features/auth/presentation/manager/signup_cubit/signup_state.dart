import 'package:sinna/features/auth/data/models/user_academic_model.dart';

class SignUpState {
  final UserAcademicModel user;

  SignUpState({UserAcademicModel? user}) : user = user ?? UserAcademicModel.empty();

  SignUpState copyWith({UserAcademicModel? user}) {
    return SignUpState(user: user ?? this.user);
  }
}

final class SignupLoadingState extends SignUpState {}

final class SignupSuccessState extends SignUpState {}

final class SignupFailedState extends SignUpState {
  final String error;
  SignupFailedState(this.error);
}
