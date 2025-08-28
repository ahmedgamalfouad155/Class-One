import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_base_model.dart';

abstract class SignupService {
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> setUserData(UserBaseModel userData);
}

class SignupServiceImpl extends SignupService {
  final firebaseAuth = FirebaseAuth.instance;
  final firestor = FirestoreServices.instance;

  @override
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('هذا البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'weak-password') {
        throw Exception('كلمة المرور ضعيفة جدًا');
      } else if (e.code == 'invalid-email') {
        throw Exception('البريد الإلكتروني غير صالح');
      } else {
        throw Exception('فشل التسجيل: ${e.message}');
      }
    }
  }

  @override
  Future<void> setUserData(UserBaseModel userData) async {
    await firestor.setData(
      path: FirestorePath.users(userData.email!),
      data: userData.toMap(),
    );
  }
}
