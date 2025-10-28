import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinna/core/helper/get_device_id.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/auth/data/services/signup_service/signup_service.dart';
import 'package:sinna/features/auth/presentation/manager/signup_cubit/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  final SignupService authServices = SignupServiceImpl();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? deviceId;

  Timer? _emailCheckTimer; // ⏱️ متابعة التفعيل التلقائي

  Future<void> signUp({
    required String password,
    required UserInfoModel userBaseModel,
  }) async {
    emit(SignupLoadingState());
    deviceId = await getDeviceId();

    try {
      final user = await authServices.signUpWithEmailAndPassword(
        userBaseModel.email!,
        password,
      );

      if (user != null) {
        // ✉️ نرسل رابط التفعيل
        await user.sendEmailVerification();

        userBaseModel = userBaseModel.copyWith(
          uid: user.uid,
          deviceId: deviceId,
        );

        emit(SignupEmailSentState(userBaseModel));

        // 🕒 نبدأ المتابعة التلقائية كل 3 ثواني
        _startEmailVerificationCheck(user, userBaseModel);
      } else {
        emit(SignupFailedState('Signup failed'));
      }
    } catch (e) {
      final errorMsg = e.toString();

      // ✅ البريد مسجل مسبقًا ولكن غير مفعّل
      if (errorMsg.contains('لم يتم تفعيل الحساب')) {
        emit(
          SignupFailedState(
            'هذا البريد متسجل مسبقًا ولكن لم يتم تفعيله. برجاء تأكيد البريد الإلكتروني من الرسالة المرسلة.',
          ),
        );
      }
      // ⚠️ البريد مفعّل مسبقًا
      else if (errorMsg.contains('مستخدم بالفعل')) {
        emit(
          SignupFailedState(
            'هذا البريد مستخدم بالفعل. برجاء تسجيل الدخول بدلاً من إنشاء حساب جديد.',
          ),
        );
      } else {
        emit(SignupFailedState('حدث خطأ أثناء التسجيل: $errorMsg'));
      }
    }
  }

  /// 🔁 متابعة التفعيل التلقائي بالبريد
  void _startEmailVerificationCheck(
    User user,
    UserInfoModel userBaseModel,
  ) async {
    _emailCheckTimer?.cancel();

    _emailCheckTimer = Timer.periodic(const Duration(seconds: 3), (
      timer,
    ) async {
      await user.reload();
      final refreshedUser = firebaseAuth.currentUser;

      if (refreshedUser != null && refreshedUser.emailVerified) {
        timer.cancel();
        await authServices.setUserData(userBaseModel);
        emit(SignupSuccessState());
      }
    });
  }

  /// ✅ التأكيد اليدوي (زر "لقد أكدت بريدي الإلكتروني")
  Future<void> checkEmailVerificationManually(
    UserInfoModel userBaseModel,
  ) async {
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
        emit(
          SignupEmailNotVerifiedState(
            'Please verify your email before continuing.',
          ),
        );
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
