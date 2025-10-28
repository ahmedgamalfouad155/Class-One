import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/services/forget_passowrd_service/forget_password_service.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordService _forgetPasswordService =
      ForgetPasswordServiceImpl();

  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  Future<void> sendResetEmail(String email) async {
    emit(ForgetPasswordLoading());
    try {
      await _forgetPasswordService.sendResetEmail(email);
      emit(ForgetPasswordSuccess("Reset link sent successfully to $email"));
    } catch (e) {
      emit(ForgetPasswordFailure(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
