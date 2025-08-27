import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
import 'package:sinna/features/auth/data/services/signup_service/signup_service.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final PageController pageController = PageController();
  final SignupService authServices = SignupServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void updateUser(UserAcademicModel user) {
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

  Future<void> signUp(
    String password,
    UserBaseModel userBaseModel,
    UserAcademicModel userAcademicModel,
  ) async {
    emit(SignupLoadingState());
    try {
      final user = await authServices.signUpWithEmailAndPassword(
        userBaseModel.email ?? '',
        password,
      );

      if (user != null) {
        userBaseModel = userBaseModel.copyWith(uid: user.email);

        await authServices.setUserData(userBaseModel, userAcademicModel);
        emit(SignupSuccessState());
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }

  /// ✅ Dispose للـ PageController
  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
