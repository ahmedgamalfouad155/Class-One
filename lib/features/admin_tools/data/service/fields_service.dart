import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/helper/normalize_firestore_name.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/admin_tools/data/models/field_model.dart';

abstract class FieldsService {
  Stream<List<FieldModel>> getFields();
  Future<void> addField(String specialization);
  Future<void> updateField(FieldModel fieldModel);
}

class FieldsServiceImpl extends FieldsService {
  @override
  Stream<List<FieldModel>> getFields() {
    return firestor.collectionsStram(
      path: FirestorePath.preferencesSpecialization(),
      builder: (data, documentId) => FieldModel.fromMap(data!, documentId),
    );
  }

  final firestor = FirestoreServices.instance;
  @override
  Future<void> addField(String specialization) async { 
    final id = generateFirestoreId(FireStoreCollectionsName.specialization);
    await firestor.setData(
      path: FirestorePath.specialiaztion(id),
      data: FieldModel(id: id, name: specialization).toMap(),
    );
  }

  @override
  Future<void> updateField(FieldModel fieldModel) async {
    await firestor.updatedata(
      path: FirestorePath.specialiaztion(fieldModel.id),
      data: fieldModel.toMap(),
    );
  }
}
