import 'package:firebase_auth/firebase_auth.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';

abstract class AuthServices {
  
  User? get currentUser; 
   Future<void> logOut(); 

}


class AuthServicesImpl implements AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  final firestor = FirestoreServices.instance;

  @override
  User? get currentUser => firebaseAuth.currentUser; 
  
  @override
  Future<void> logOut() async{
   await firebaseAuth.signOut();
  }
}