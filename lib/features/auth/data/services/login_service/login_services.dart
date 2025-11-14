import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';

abstract class LoginServices {
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<bool> checkUserExists(String email);
  Future<void> setUserData(UserInfoModel userData);
}

class LoginServceImpl implements LoginServices {
  final firestor = FirestoreServices.instance;
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;

      // ✅ تحقق من التفعيل
      if (user != null && !user.emailVerified) {
        // أعمل signOut علشان مايفضلش اليوزر داخل
        await FirebaseAuth.instance.signOut();
        throw Exception('يجب تأكيد البريد الإلكتروني قبل تسجيل الدخول');
      }
      return user;
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
  Future<bool> checkUserExists(String email) {
    return firestor.checkUserExists(email);
  }

  @override
  Future<void> setUserData(UserInfoModel userData) async {
    await firestor.setData(
      path: FirestorePath.users(userData.email!),
      data: userData.toMap(),
    );
    await _addAcadimyInfo(userData.email!);
  }

  Future<void> _addAcadimyInfo(String uid) async {
    final userAcademicModel = UserAcademicModel(
      institution: 'YrmK0xYmU5jHtjw937M6', 
      level: 'Year 1',
      specialization: 'bRsWPrl3BjyrV2Z0qhih',
    );
    await firestor.setData(
      path: FirestorePath.filter(uid),
      data: userAcademicModel.toMap(),
    );
  }
}
