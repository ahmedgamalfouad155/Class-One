import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        try {
          await _auth.signInWithCredential(credential);
          emit(PhoneAuthVerified());
        } catch (e) {
          emit(PhoneAuthError(e.toString()));
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(PhoneAuthError(e.message ?? "Verification failed"));
      },
      codeSent: (String verificationId, int? resendToken) {
        emit(PhoneAuthCodeSent(verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    emit(PhoneAuthLoading());

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await _auth.signInWithCredential(credential);
      emit(PhoneAuthVerified());
    } catch (e) {
      emit(PhoneAuthError("Invalid code"));
    }
  }
}
