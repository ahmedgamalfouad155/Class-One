import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';

abstract class SignupService {
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  Future<void> setUserData(UserInfoModel userData);
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
      // ✅ نحاول إنشاء الحساب
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // 🔥 الحالة: البريد مستخدم بالفعل
      if (e.code == 'email-already-in-use') {
        // نحاول الحصول على المستخدم الحالي لمعرفة حالته
        final existingUser = firebaseAuth.currentUser;

        if (existingUser != null && !existingUser.emailVerified) {
          // 📧 الإيميل مسجل ولكن غير مفعّل
          throw Exception(
            'تم التسجيل بهذا البريد من قبل، لكن لم يتم تفعيل الحساب. يرجى تأكيد البريد الإلكتروني.',
          );
        } else {
          // ⚠️ البريد مفعّل بالفعل
          throw Exception('هذا البريد الإلكتروني مستخدم بالفعل.');
        }
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
  Future<void> setUserData(UserInfoModel userData) async {
    await firestor.setData(
      path: FirestorePath.users(userData.email!),
      data: userData.toMap(),
    );
    await _addAcadimyInfo(userData.email!);
  }

  Future<void> _addAcadimyInfo(String uid) async {
    final userAcademicModel = UserAcademicModel(
      institution: 'Mansoura University', 
      level: 'Year 1',
      specialization: 'Dentistry',
    );
    await firestor.setData(
      path: FirestorePath.filter(uid),
      data: userAcademicModel.toMap(),
    );
  }
}
