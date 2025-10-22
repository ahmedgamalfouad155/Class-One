import 'package:sinna/core/services/firebase/firebase_path.dart';
import 'package:sinna/core/services/firebase/firestore_services.dart';
import 'package:sinna/features/admin_tools/data/models/instructor_model.dart';

abstract class InstructorService {
  Stream<List<InstructorModel>> getInstructors();
  Future<void> addInstructor(InstructorModel instructorModel);
  Future<void> deleteInstructor(String id);
  Future<void> updateInstructor(InstructorModel instructorModel);
}

class InstructorServiceImpl extends InstructorService {
  final firestor = FirestoreServices.instance;

  @override
  Stream<List<InstructorModel>> getInstructors() {
    return firestor.collectionsStram(
      path: FirestorePath.myInstructors(),
      builder: (data, documentId) {
        return InstructorModel.fromMap(data!, documentId);
      },
    );
  }

  @override
  Future<void> addInstructor(InstructorModel instructorModel) async {
    await firestor.setData(
      path: FirestorePath.instructorsId(instructorModel.id),
      data: instructorModel.toMap(),
    );
  }

  @override
  Future<void> updateInstructor(InstructorModel instructorModel) {
    return firestor.updatedata(
      path: FirestorePath.instructorsId(instructorModel.id),
      data: instructorModel.toMap(),
    );
  }

  @override
  Future<void> deleteInstructor(String id) {
    return firestor.deleteData(path: FirestorePath.instructorsId(id));
  }
}
