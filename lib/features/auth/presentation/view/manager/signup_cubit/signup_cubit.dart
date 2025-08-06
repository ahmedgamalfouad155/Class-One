import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_model.dart';
import 'package:sinna/features/auth/data/services/signup_service/signup_service.dart';
import 'package:sinna/features/auth/presentation/view/manager/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  PageController pageController = PageController();
  final SignupService authServices = SignupServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void updateUser(UserModel user) {
    emit(state.copyWith(user: user));
  }

  void nextPage() {
    if (pageController.hasClients) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Future<void> signUp(String password, UserModel userModel) async {
    emit(SignupLoadingState());
    try {
      final user = await authServices.signUpWithEmailAndPassword(
        userModel.email,
        password,
      );
      if (user != null) {
        emit(SignupSuccessState());
        userModel = userModel.copyWith(uid: user.uid); 
        await authServices.setUserData(userModel); 
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }
}
