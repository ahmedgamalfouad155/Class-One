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

  static String notifications(String notificationsId) =>
      "notifications/$notificationsId";

  static String myNotifications() => "notifications/";

  static String newCoursesPath({
    required String specialization,
    required String institution,
    required String level,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/";
  static String newLessonsPath({
    required String specialization,
    required String institution,
    required String level,
    required String course,
  }) =>
      "${FireStoreCollectionsName.coursesInfoSpecialization}/$specialization/${FireStoreCollectionsName.institution}/$institution/${FireStoreCollectionsName.levels}/$level/${FireStoreCollectionsName.courses}/$course/${FireStoreCollectionsName.lessons}/";
}
