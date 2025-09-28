import 'package:sinna/core/services/firebase/firestore_services.dart';

abstract class LevelServices {
  Future<List<String>> getLevels();
}

class LevelServicesImpl extends LevelServices {
  final firestor = FirestoreServices.instance;


  @override
  Future<List<String>> getLevels() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return ['Beginner', 'Intermediate', 'Advanced'];
    });
  }
}
