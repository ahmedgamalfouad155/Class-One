import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/models/user_academic_model.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class StepsService {
  Future<void> addAcadimyInfo(UserAcademicModel userAcademicModel);
}

class StepsServiceImpl extends StepsService {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;
  @override
  Future<void> addAcadimyInfo(UserAcademicModel userAcademicModel) async {
    await firestor.updatedata(
      path: FirestorePath.users(uid!),
      data: userAcademicModel.toMap(),
    );
  }
}
