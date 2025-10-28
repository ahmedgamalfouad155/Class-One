import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_info_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class UserInfoService {
  Stream<UserInfoModel> getUserInfo();
  Future<void> updateUserName(String name);
}

class UserInfoServiceImpl extends UserInfoService {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;
    @override
  Stream<UserInfoModel> getUserInfo() {
    return firestor.documentstream(
      path: FirestorePath.users(uid!),
      builder: (data, documentId) {
        return UserInfoModel.fromMap(data!, documentId);
      },
    );
  }

  @override
  Future<void> updateUserName(String name) async {
    await firestor.updatedata(
      path: FirestorePath.users(uid!),
      data: {"name": name},
    );
  }
}
