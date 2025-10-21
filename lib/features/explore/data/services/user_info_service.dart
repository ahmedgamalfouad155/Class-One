import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class UserInfoService {
  Future<UserAcademicModel> getUserInfo();
}

class UserInfoServiceImpl implements UserInfoService {
  final firestorServices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;

  @override
  Future<UserAcademicModel> getUserInfo() async {
    return await firestorServices.getDocument(
      path: FirestorePath.filter(uid!),
      builder: (data, documentId) { 
        return UserAcademicModel.fromMap(data);
      },
    );
  }
}
