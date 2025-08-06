import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_model.dart';
import 'package:sinna/features/auth/data/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServicesImpl implements AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  final firestor = FirestoreServices.instance;

  @override
  User? get currentUser => firebaseAuth.currentUser;

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
  Future<void> logOut() async => await firebaseAuth.signOut();

  @override
  Future<void> setUserData(UserModel userData) async => await firestor.setData(
    path: FirestorePath.users(userData.uid),
    data: userData.toMap(),
  );
}
