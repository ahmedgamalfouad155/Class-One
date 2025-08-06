import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/services/login_service/login_services.dart';
import 'package:sinna/features/auth/presentation/view/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final LoginServices loginServices = LoginServceImpl();
  
  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final user = await loginServices.loginWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailedState('Login failed'));
      }
    } catch (e) {
      emit(LoginFailedState(e.toString()));
    }
  }
}
