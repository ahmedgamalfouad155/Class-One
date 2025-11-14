import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/admin_tools/data/models/institution_model.dart';

abstract class InstitutionService {
  Stream<List<InstitutionModel>> getInstitutions({
    required String specialization,
  });
  Future<void> addInstitution({
    required String specializationid,
    required String institution,
  });
  // Future<void> deleteInstitution({
  //   required String specializationId,
  //   required String institutionId,
  // });
  Future<void> updateInstitution(
    String specializationId,
    InstitutionModel institutionModel,
  );
}

class InstitutionServiceImpl extends InstitutionService {
  final firestore = FirestoreServices.instance;

  @override
  Stream<List<InstitutionModel>> getInstitutions({
    required String specialization,
  }) {
    return firestore.collectionsStram(
      path: FirestorePath.preferencesInstitutions(
        specialization: specialization,
      ),
      builder: (data, documentId) {
        return InstitutionModel.fromMap(data!, documentId);
      },
    );
  }

  @override
  Future<void> addInstitution({
    required String specializationid,
    required String institution,
  }) async {
    final id = generateFirestoreId(FireStoreCollectionsName.institution);
    await firestore.setData(
      path: FirestorePath.newInstitution(
        specializationId: specializationid,
        institutionId: id,
      ),
      data: InstitutionModel(id: id, name: institution).toMap(),
    );
  }

  @override
  Future<void> updateInstitution(
    String specializationId,
    InstitutionModel institutionModel,
  ) {
    return firestore.updatedata(
      path: FirestorePath.newInstitution(
        specializationId: specializationId,
        institutionId: institutionModel.id,
      ),
      data: institutionModel.toMap(),
    );
  }

  // @override
  // Future<void> deleteInstitution({
  //   required String specializationId,
  //   required String institutionId,
  // }) {
  //   return firestore.deleteData(path: FirestorePath.newInstitution(
  //     specializationId: specializationId,
  //     institutionId: institutionId,
  //   ));
  // }
}
