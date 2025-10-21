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

String selectedUniversity = "Select University";
Map<String, String> convert = {
  "Mansoura University": "mansoura",
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

final List<String> specializationExpolreFilters = const [
  "None",
  'Orthodontics',
  'Prosthodontics',
  'Radiology',
];

final List<String> specializationBottomSheetFilters = const [
  "Dentistry",
  'Other',
];

final List<String> programBottomSheetFilters = const [
  "Academic",
  'Professional',
];

final List<String> dashboardFilters = const [
  "All",
  "Recently Saved",
  'Recently Played',
];

final List<String> terms = const ["First Term", "Second Term"];
