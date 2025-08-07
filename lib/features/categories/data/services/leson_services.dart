import 'package:sinna/core/services/firebase_path.dart';
import 'package:sinna/core/services/firestore_services.dart';
import 'package:sinna/features/categories/data/models/leson_model.dart';

abstract class LesonServices {
  Future<List<LesonModel>> getLesons({
    required String country,
    required String university,
    required String system,
    required String level,
    required String subject,
    required String term,
    required String doctor,
  });
}

class LesonServicesImpl implements LesonServices {
  final firestor = FirestoreServices.instance;
  @override
  Future<List<LesonModel>> getLesons({
    required String country,
    required String university,
    required String system,
    required String level,
    required String subject,
    required String term,
    required String doctor,
  }) async => await firestor.getCollection(
    path: FirestorePath.data(
      country,
      university,
      system,
      level,
      subject,
      term,
      doctor,
    ),
    builder: (data, documentId) => LesonModel.fromMap(data, documentId),
  );
}
