class FirestorePath {
  static String users(String uid) => "users/$uid";
  static String myUsers() => "users/";

  static String myInstructors() => "instructors/";
  static String instructorsId(String id) => "instructors/$id";

  static String myInstitutions() => "institutions/";
  static String institutionsId(String id) => "institutions/$id";

  static String courses(String uid, String courseId) =>
      "users/$uid/myCourses/$courseId";
  static String myCourses(String uid) => "users/$uid/myCourses/";

  static String filter(String uid) => "users/$uid/filter/filter";

  static String notifications(String notificationsId) =>
      "notifications/$notificationsId";

  static String myNotifications() => "notifications/";

  static String newCoursesPath({
    required String specialization,
    required String program,
    required String university,
    required String level,
  }) =>
      "courses/info/specialization/$specialization/program/$program/universities/$university/levels/$level/courses/";

  static String newLessonsPath({
    required String specialization,
    required String program,
    required String university,
    required String level,
    required String course,
  }) =>
      "courses/info/specialization/$specialization/program/$program/universities/$university/levels/$level/courses/$course/lessons/";
}
