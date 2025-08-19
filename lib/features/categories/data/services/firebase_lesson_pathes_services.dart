import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sinna/core/constants/constants.dart';
import 'package:sinna/features/categories/data/models/course_path_model.dart';

class FirebaseLessonService {
  // 1️⃣ عمل instance ثابتة من نفس الكلاس
  static final FirebaseLessonService _instance =
      FirebaseLessonService._internal();

  // 2️⃣ Private constructor (عشان ما يتعملش new بره الكلاس)
  FirebaseLessonService._internal() : _firestore = FirebaseFirestore.instance;

  // 3️⃣ Getter للوصول للـ instance الوحيد
  static FirebaseLessonService get instance => _instance;

  final FirebaseFirestore _firestore;

  Future<List<String>> getSubjects(CoursePathModel path) async {
    final snapshot = await _firestore
        .collection(FireStoreCollectionsName.countries)
        .doc(path.country)
        .collection(FireStoreCollectionsName.universities)
        .doc(path.university)
        .collection(FireStoreCollectionsName.faculties)
        .doc(path.faculty)
        .collection(FireStoreCollectionsName.programs)
        .doc(path.program)
        .collection(FireStoreCollectionsName.stages)
        .doc(path.stage)
        .collection(FireStoreCollectionsName.subjects)
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }

  Future<List<String>> getTerms(CoursePathModel path) async {
    final snapshot = await _firestore
        .collection(path.country.toString())
        .doc(path.university)
        .collection('degree')
        .doc(path.program)
        .collection('level')
        .doc(path.stage)
        .collection('subjects')
        .doc(path.subject)
        .collection("term")
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }

  Future<List<String>> getDoctors(CoursePathModel path) async {
    final snapshot = await _firestore
        .collection(path.country.toString())
        .doc(path.university)
        .collection('degree')
        .doc(path.program)
        .collection('level')
        .doc(path.stage)
        .collection('subjects')
        .doc(path.subject)
        .collection("term")
        .doc(path.term)
        .collection("doctors")
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }
}
