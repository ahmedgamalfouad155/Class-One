import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginServices {
  Future<User?> loginWithEmailAndPassword(String email, String password);
}

class LoginServceImpl implements LoginServices {
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('لا يوجد مستخدم بهذا البريد الإلكتروني');
        case 'wrong-password':
          throw Exception('كلمة المرور غير صحيحة');
        case 'invalid-email':
          throw Exception('البريد الإلكتروني غير صالح');
        case 'invalid-credential':
          throw Exception('كلمة المرور أو البريد الإلكتروني غير صحيح');
        default:
          throw Exception('حدث خطأ أثناء تسجيل الدخول: ${e.message}');
      }
    }
  }
}
