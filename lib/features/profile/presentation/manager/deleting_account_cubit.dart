import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:sinna/features/profile/data/delete_account_service.dart';

class DeletingAccountCubit {
  final _deleteService = DeleteAccountService.instance;
  final _auth = FirebaseAuth.instance;

  Future<bool> deleteAccount(String email, String password) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return false; 
      final credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await user.reauthenticateWithCredential(credential); 
      await _deleteService.deleteUserWithSubcollections(email: email); 
      await user.delete(); 
      return true;
    } catch (e) { 
      return false;
    }
  }
}
