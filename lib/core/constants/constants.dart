import 'package:easy_localization/easy_localization.dart';
import 'package:sinna/generated/locale_keys.g.dart';

String documentIdFromLocalData() => DateTime.now().toIso8601String();

class AppConstants {
  static const String hiveBoxName = "settings";
  static const String translationsPath = 'assets/translations';
  static const String appTitle = "Class One";
}

class FireStoreCollectionsName {
  static const String users = "users";
  static const String myCourses = "my_courses";
  static const String filter = "filter";
  static const String courses = "courses";
  static const String instructors = "instructors";
  static const String institutions = "institutions";
  static const String institution = "institution";
  static const String levels = "levels";
  static const String lessons = "lessons";
  static const String specialization = "specialization";
  static const String coursesInfoSpecialization = "courses/info/specialization";
}

class FireStoreUserInfoFieldsName {
  static const String uid = "uid";
  static const String name = "name";
  static const String email = "email";
  static const String deviceId = "device_id";
}

class FireStoreFilterFieldsName {
  static const String institution = "institution";
  static const String level = "level";
  static const String specialization = "specialization";
}

class FireStoreCourseInfoFieldsName {
  static const String id = "id";
  static const String title = "title";
  static const String instructor = "instructor";
  static const String imageUurl = "image_url";
}

class FireStoreLessonFieldsName {
  static const String hours = "hours";
  static const String id = "id";
  static const String ninutes = "ninutes";
  static const String number = "number";
  static const String pdfTitle = "pdf_title";
  static const String pdfUrl = "pdf_url";
  static const String subtitle = "subtitle";
  static const String term = "term";
  static const String title = "title";
  static const String videoUrl = "video_url";
}

class FireStoreCoursePathFieldsName {
  static const String institution = "institution";
  static const String specialization = "specialization";
  static const String level = "level";
  static const String coursrId = "course_id";
  static const String term = "term";
  static const String id = "id";
  static const String isPaid = "is_paid";
  static const String title = "title";
  static const String instructor = "instructor";
  static const String imageUrl = "image_url";
}

class FireStoreInstructorFieldsName {
  static const String id = "id";
  static const String name = "name";
}

class FireStoreInstitutionFieldsName {
  static const String id = "id";
  static const String name = "name";
}

String selectedUniversity = "Select University";
Map<String, String> convert = {
  "Mansoura University": "mansoura_university",
  "King Khalid University": "king_khalid_university",
  "Academic": "academic",
  "Dentistry": "dentistry",
  "Professional": "professional",
  "Nursing": "nursing",
  "Bachelor": "bachelors",
  "Master": "masters",
  "Piometry": "prometric",
  "Year 1": "year_1",
  "Year 2": "year_2",
  "Year 3": "year_3",
  "Year 4": "year_4",
  "Year 5 ": "year_5",

  "Periodontology": "prothodontics",
  "Oral surgery": "oral_surgery",
  "Pedodontics": "periodontology",
  "Endodontics": "endodontics",
  "Operative": "operative",
  "Prothodontics": "pedodontics",
  "Orthodontics": "orthodontics",
};

final List<String> specializationBottomSheetFilters = const [
  "Dentistry",
  'Other',
];

final List<String> programBottomSheetFilters = const [
  "Academic",
  'Professional',
];

final List<String> terms = [
  LocaleKeys.first_term.tr(),
  LocaleKeys.second_term.tr(),
];
