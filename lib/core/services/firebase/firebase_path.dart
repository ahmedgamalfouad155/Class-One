import 'package:sinna/core/constants/constants.dart';

class FirestorePath {
  static String users(String uid) => "${FireStoreCollectionsName.users}/$uid";
  static String myUsers() => "${FireStoreCollectionsName.users}/";

  static String myInstructors() => "${FireStoreCollectionsName.instructors}/";
  static String instructorsId(String id) =>
      "${FireStoreCollectionsName.instructors}/$id";

  static String myInstitutions() => "${FireStoreCollectionsName.institutions}/";
  static String institutionsId(String id) =>
      "${FireStoreCollectionsName.institutions}/$id";

  static String courses(String uid, String courseId) =>
      "${FireStoreCollectionsName.users}/$uid/${FireStoreCollectionsName.myCourses}/$courseId";
  static String myCourses(String uid) =>
      "${FireStoreCollectionsName.users}/$uid/${FireStoreCollectionsName.myCourses}/";

  static String filter(String uid) =>
      "${FireStoreCollectionsName.users}/$uid/${FireStoreCollectionsName.filter}/${FireStoreCollectionsName.filter}";

  static String newCoursesPath({
    required String specialization,
    required String institution,
    required String level,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/";

  static String createNewCourse({
    required String specialization,
    required String institution,
    required String level,
    required String course,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course";

  static String newLessonsPath({
    required String specialization,
    required String institution,
    required String level,
    required String course,
    required String lessonId,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course/${FireStoreCollectionsName.lessons}/$lessonId";

  static String newParticipantsPath({
    required String specialization,
    required String institution,
    required String level,
    required String course,
    required String participantId,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course/${FireStoreCollectionsName.participants}/$participantId";

  static String myParticipantsPath({
    required String specialization,
    required String institution,
    required String level,
    required String course,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course/${FireStoreCollectionsName.participants}";

  static String myLessons({
    required String specialization,
    required String institution,
    required String level,
    required String course,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course/${FireStoreCollectionsName.lessons}";

  static String preferencesSpecialization() =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/";
  static String preferencesInstitutions({required String specialization}) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}";

  static String specialiaztion(String specialization) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization";

  static String newInstitution({
    required String specializationId,
    required String institutionId,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specializationId/${FireStoreCollectionsName.institution}/$institutionId";

  // static String preferencesLevels({required String specialization}) =>
  // "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}";
}
