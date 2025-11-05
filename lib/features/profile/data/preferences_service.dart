import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/auth/data/services/auth_service/auth_services.dart';

abstract class PreferencesService {
  Future<List<String>> getSpecialty();
  Future<List<String>> getInstitutions({required String specialization});
  Future<List<String>> getLevels();

  Future<void> updateSpecialty(String specialty);
  Future<void> updateInstitutions(String institutions);
  Future<void> updateLevels(String levels);
}

class PreferencesServiceImpl extends PreferencesService {
  final firestor = FirestoreServices.instance;
  final uid = AuthServicesImpl().currentUser!.email;
  @override
  Future<List<String>> getSpecialty() {
    return firestor.getCollection(
      path: FirestorePath.preferencesSpecialization(),
      builder: (data, documentId) => documentId,
    );
  }

  @override
  Future<List<String>> getInstitutions({required String specialization}) {
    return firestor.getCollection(
      path: FirestorePath.preferencesInstitutions(
        specialization: specialization,
      ),
      builder: (data, documentId) => documentId,
    );
  }

  @override
  Future<List<String>> getLevels() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateSpecialty(String specialty) {
    return firestor.updatedata(
      path: FirestorePath.filter(uid!),
      data: {FireStoreFilterFieldsName.specialization: specialty},
    );
  }

  @override
  Future<void> updateLevels(String levels) {
      return firestor.updatedata(
      path: FirestorePath.filter(uid!),
      data: {FireStoreFilterFieldsName.level: levels},
    );
  }

  @override
  Future<void> updateInstitutions(String institutions) {
      return firestor.updatedata(
      path: FirestorePath.filter(uid!),
      data: {FireStoreFilterFieldsName.institution: institutions},
    );
  }
}
