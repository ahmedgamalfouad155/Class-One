import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';

abstract class FieldsService {
  Stream<List<String>> getFields();
  Future<void> addField(String field);
}

class FieldsServiceImpl extends FieldsService {
  @override
  Stream<List<String>> getFields() {
    return firestor.collectionsStram(
      path: FirestorePath.preferencesSpecialization(),
      builder: (data, documentId) => documentId,
    );
  }
  final firestor = FirestoreServices.instance;
  @override
  Future<void> addField(String field) async {
    await firestor.setData(
      path: FirestorePath.specialiaztion(field),
      data: {FireStoreCollectionsName.specialization: field},
    );
  }
}
