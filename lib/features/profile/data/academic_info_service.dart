import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class AcademicInfoService {
  Future<void> updateAcademicInfo(UserAcademicModel userAcademicModel);
}

class AcademicInfoServiceImpl extends AcademicInfoService {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;
  @override
  Future<void> updateAcademicInfo(UserAcademicModel userAcademicModel) { 
    return firestor.updatedata(
      path: FirestorePath.filter(uid!),
      data: userAcademicModel.toMap(),
    );
  }
}
