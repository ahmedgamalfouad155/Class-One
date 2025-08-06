import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/features/auth/data/models/user_model.dart';

abstract class AuthServices {
  
  User? get currentUser;
  Future<User?> loginWithEmailAndPassword(String email, String password);
  Future<User?> signUpWithEmailAndPassword(String email, String password); 
  Future<void> logOut(); 
  Future<void> setUserData(UserModel userData); 

}


