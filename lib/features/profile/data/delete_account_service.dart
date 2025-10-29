import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';

class DeleteAccountService {
  DeleteAccountService._();
  static final instance = DeleteAccountService._();

  final _fireStore = FirebaseFirestore.instance;
  final _firestoreService = FirestoreServices.instance;

  Future<void> deleteUserWithSubcollections({required String email}) async {
    try {
      final userDocRef = _fireStore.doc(FirestorePath.users(email));
      final subcollections = [
        FireStoreCollectionsName.myCourses,
        FireStoreCollectionsName.filter,
      ];

      for (final sub in subcollections) {
        final subColRef = userDocRef.collection(sub);
        final snapshots = await subColRef.get();
        for (final doc in snapshots.docs) {
          await doc.reference.delete();
        }
      }
      await _firestoreService.deleteData(path: FirestorePath.users(email));
    } catch (e) {
      rethrow;
    }
  }
}
