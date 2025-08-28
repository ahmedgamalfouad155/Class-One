
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';

class DeletingAccountCubit {
  final _service = FirestoreServices.instance;
  final _auth = FirebaseAuth.instance;

  Future<bool> deleteAccount(String email, String password) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return false;

      // ✅ reauthenticate
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user.reauthenticateWithCredential(credential);

      // ✅ احذف الداتا من Firestore
      await _service.deleteData(path: FirestorePath.users(email));

      // ✅ احذف الحساب من FirebaseAuth
      await user.delete();

      return true;
    } catch (e) {
      debugPrint("❌ Error deleting account: $e");
      return false;
    }
  }
}
