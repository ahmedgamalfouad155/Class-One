

import 'package:sinna/core/services/firestore_services.dart';

abstract class DeleteAccountService {
  Future<void> deleteAccount(String path);
}

class DeleteAccountServiceImpl extends DeleteAccountService { 
  final service = FirestoreServices.instance;
  @override
  Future<void> deleteAccount(String path) async {
    await service.deleteData(path: path);
  }
}
