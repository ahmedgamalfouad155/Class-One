String documentIdFromLocalData() => DateTime.now().toIso8601String();

class FireStoreCollectionsName {
  static const String users = "users";
  static const String countries = "countries";
  static const String universities = "universities";
  static const String faculties = "faculties";
  static const String programs = "programs";
  static const String stages = "stages";
  static const String subjects = "subjects";
  static const String terms = "terms";
  static const String lessons = "lessons";
  static const String specializations = "specializations";
}

Map<String, String> convert = {
  "Egypt": "egypt",
  "Saudi Arabia": "saudi-arabia",
  "Mansoura University": "mansoura_university",
  "King Khalid University": "king_khalid_university",
  "Dentistry": "dentistry",
  "Nursing": "nursing",
  "Bachelor": "bachelors",
  "Master": "masters",
  "Piometry": "prometric",
  "Level 1": "level_1",
  "Level 2": "level_2",
  "Level 3": "level_3",
  "Level 4": "level_4",
  "Level 5 ": "level_5",
  "First": "first",
  "Second": "second",
  "Periodontology": "prothodontics",
  "Oral surgery": "oral_surgery",
  "Pedodontics": "periodontology",
  "Endodontics": "endodontics",
  "Operative": "operative",
  "Prothodontics": "pedodontics",
  "Orthodontics": "orthodontics",
};
