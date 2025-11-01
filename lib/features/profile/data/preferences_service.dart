import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';

abstract class PreferencesService {
  Future<List<String>> getSpecialty();
  Future<List<String>> getInstitutions({required String specialization});
  Future<List<String>> getLevels();
}

class PreferencesServiceImpl extends PreferencesService {
  final firestor = FirestoreServices.instance;
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
      path: FirestorePath.preferencesInstitutions(specialization: specialization),
      builder: (data, documentId) => documentId,
    );
  }

  @override
  Future<List<String>> getLevels() { 
    throw UnimplementedError();
  }
}
