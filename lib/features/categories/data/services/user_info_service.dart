import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_model.dart';
import 'package:sinna/features/auth/data/services/auth_services_impl.dart';

abstract class UserInfoService {
  Future<UserModel> getUserInfo();
}


class UserInfoServiceImpl implements UserInfoService {
  final firestorServices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.uid;

  @override
  Future<UserModel> getUserInfo() async {
    return await firestorServices.getDocument(
      path: FirestorePath.users(uid),
      builder: (data, documentId) => UserModel.fromMap(data, documentId),
    );
  }
}
