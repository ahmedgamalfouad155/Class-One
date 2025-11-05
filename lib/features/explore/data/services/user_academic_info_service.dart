import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class UserAcademicInfoService {
  Stream<UserAcademicModel> getUserInfo();
}

class UserAcademicInfoServiceImpl implements UserAcademicInfoService {
  final firestorServices = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;

  @override
  Stream<UserAcademicModel> getUserInfo() {
    return firestorServices.documentstream(
      path: FirestorePath.filter(uid!),
      builder: (data, documentId) {
        return UserAcademicModel.fromMap(data!,);
      },
    );
  }
}
