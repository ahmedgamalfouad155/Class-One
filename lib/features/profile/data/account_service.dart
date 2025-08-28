import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';

abstract class AccountService {
  Future<void> updateAccount(String uid, UserAcademicModel userModel);
}

class AccountServiceImpl extends AccountService {
  final firestor = FirestoreServices.instance;  

  @override
  Future<void> updateAccount(String uid, UserAcademicModel userModel) async { 
    await firestor.updatedata(
      path: FirestorePath.users(uid),
      data: userModel.toMap(),
    );
  }
}
