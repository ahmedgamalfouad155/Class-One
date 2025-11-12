import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';

abstract class InstitutionService {
  Stream<List<String>> getInstitutions({required String specialization});
  Future<void> addInstitution({
    required String specialization,
    required String institution,
    required InstitutionModel institutionModel,
  });
  Future<void> deleteInstitution(String id);
  Future<void> updateInstitution(InstitutionModel institutionModel);
}

class InstitutionServiceImpl extends InstitutionService {
  final firestore = FirestoreServices.instance;

  @override
  Stream<List<String>> getInstitutions( {required String specialization}) {
    return firestore.collectionsStram(
      path: FirestorePath.preferencesInstitutions(specialization: specialization),
      builder: (data, documentId) {
        return  documentId;
      },
    );
  }

  @override
  Future<void> addInstitution({
    required String specialization,
    required String institution,
    required InstitutionModel institutionModel,
  }) async {
    await firestore.setData(
      path: FirestorePath.newINstitution(specialization, institution),
      data: institutionModel.toMap(),
    );
  }

  @override
  Future<void> updateInstitution(InstitutionModel institutionModel) {
    return firestore.updatedata(
      path: FirestorePath.institutionsId(institutionModel.id),
      data: institutionModel.toMap(),
    );
  }

  @override
  Future<void> deleteInstitution(String id) {
    return firestore.deleteData(path: FirestorePath.institutionsId(id));
  }
}
