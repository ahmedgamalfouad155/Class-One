import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/get_device_id.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';
import 'package:sinna/features/auth/data/services/signup_service/signup_service.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final SignupService authServices = SignupServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? deviceId;

  Timer? _emailCheckTimer; // ⏱️ لمتابعة التفعيل التلقائي

  
  Future<void> signUp({
    required String password,
    required UserBaseModel userBaseModel,
  }) async {
    emit(SignupLoadingState());
    deviceId = await getDeviceId();

    try {
      final user = await authServices.signUpWithEmailAndPassword(
        userBaseModel.email!,
        password,
      );

      if (user != null) {
        await user.sendEmailVerification();

        userBaseModel = userBaseModel.copyWith(
          uid: user.uid,
          deviceId: deviceId,
        );

        emit(SignupEmailSentState(  userBaseModel));

        // نبدأ متابعة التفعيل التلقائي (كل 3 ثواني)
        _startEmailVerificationCheck(user, userBaseModel);
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      emit(SignupFailedState(e.toString()));
    }
  }

  /// 🔁 متابعة التفعيل التلقائي بالبريد
  void _startEmailVerificationCheck(
      User user, UserBaseModel userBaseModel) async {
    _emailCheckTimer?.cancel();

    _emailCheckTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await user.reload();
      final refreshedUser = firebaseAuth.currentUser;

      if (refreshedUser != null && refreshedUser.emailVerified) {
        timer.cancel();

        await authServices.setUserData(userBaseModel);

        emit(SignupSuccessState());
      }
    });
  }

  /// ✅ دالة للتأكيد اليدوي (مثلاً عند ضغط زر "لقد أكدت بريدي الإلكتروني")
  Future<void> checkEmailVerificationManually(
      UserBaseModel userBaseModel) async {
        deviceId = await getDeviceId();
    try {
      final user = firebaseAuth.currentUser;
      await user?.reload();

      if (user != null && user.emailVerified) {
        userBaseModel = userBaseModel.copyWith(
          uid: user.email,
          deviceId: deviceId,
        );
        await authServices.setUserData(userBaseModel);

        emit(SignupSuccessState());
      } else {
        emit(SignupEmailNotVerifiedState(
            'Please verify your email before continuing.'));
      }
    } catch (e) {
      emit(SignupFailedState('Error checking email verification: $e'));
    }
  }

  @override
  Future<void> close() {
    _emailCheckTimer?.cancel();
    return super.close();
  }
}
 // ahmedgfouad2020@gmail.com
