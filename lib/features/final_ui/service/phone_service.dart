import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';

abstract class PhoneAuthService {
  /// إرسال الكود لرقم الموبايل
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSent,
    required Function(FirebaseAuthException e) verificationFailed,
    Function(PhoneAuthCredential credential)? verificationCompleted,
    Function(String verificationId)? codeAutoRetrievalTimeout,
  });

  /// تسجيل الدخول باستخدام الكود اللي وصله للمستخدم
  Future<User?> signInWithSmsCode({
    required String verificationId,
    required String smsCode,
  });

  /// حفظ بيانات المستخدم في Firestore
  Future<void> setUserData(UserInfoModel userData);
}

class PhoneAuthServiceImpl extends PhoneAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firestor = FirestoreServices.instance;

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId) codeSent,
    required Function(FirebaseAuthException e) verificationFailed,
    PhoneVerificationCompleted? verificationCompleted,
    Function(String verificationId)? codeAutoRetrievalTimeout,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verificationCompleted!,
      verificationFailed: verificationFailed,
      codeSent: (verificationId, resendToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        if (codeAutoRetrievalTimeout != null) {
          codeAutoRetrievalTimeout(verificationId);
        }
      },
    );
  }

  @override
  Future<User?> signInWithSmsCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw Exception("فشل تسجيل الدخول: ${e.message}");
    }
  }

  @override
  Future<void> setUserData(UserInfoModel userData) async {
    // await firestor.setData(
    // path: FirestorePath.users(userData.phone!), // هنا نخزن بالـ phone بدل email
    // data: userData.toMap(),
    // );
  }
}
