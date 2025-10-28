import 'package:firebase_auth/firebase_auth.dart';

  abstract class ForgetPasswordService {
  Future<void> sendResetEmail(String email); 
}

class ForgetPasswordServiceImpl extends ForgetPasswordService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<void> sendResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseError(e));
    } catch (_) {
      throw Exception("An unexpected error occurred. Please try again.");
    }
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return "No user found for that email.";
      case 'invalid-email':
        return "The email address is invalid.";
      case 'missing-email':
        return "Please enter your email address.";
      default:
        return "Failed to send reset email. Please try again.";
    }
  }
}
