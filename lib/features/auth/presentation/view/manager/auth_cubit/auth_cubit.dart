import 'package:sinna/features/auth/data/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authServices) : super(AuthInitial());

  final AuthServices authServices;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final user = await authServices.loginWithEmailAndPassword(
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

  Future<void> signUp(String email, String password, String name) async {
    emit(SignupLoadingState());
    try {
      final user = await authServices.signUpWithEmailAndPassword(
        email,
        password,
      );
      if (user != null) {
        emit(SignupSuccessState());
        // final userData = UserModel.copyWith(name: name, uid: user.uid, email: email);
        // await authServices.setUserData(userData);
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }

  void authState() {
    final user = authServices.currentUser;
    if (user != null) {
      emit(LoginSuccessState());
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await authServices.logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(LogoutFailedState(e.toString()));
    }
  } 
}
