class StepsState {
  final String? country;
  final String? university;
  final String? faculty;
  final String? program;
  final String? level;
  final String? specialization;

  StepsState({
    this.country,
    this.university,
    this.faculty,
    this.program,
    this.level,
    this.specialization,
  });

  StepsState copyWith({
    String? country,
    String? university,
    String? faculty,
    String? program,
    String? level,
    String? specialization,
  }) {
    return StepsState(
      country: country ?? this.country,
      university: university ?? this.university,
      faculty: faculty ?? this.faculty,
      program: program ?? this.program,
      level: level ?? this.level,
      specialization: specialization ?? this.specialization,
    );
  }
}

Map<String, String> convert = {
  "Egypt": "egypt",
  "Saudi Arabia": "saudi-arabia",
  "Mansoura University": "saudi_arabia",
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

class StepsData {
  static final universities = {
    "Egypt": ["Mansoura University"],
    "Saudi Arabia": ["King Khalid University"],
  };

  static final faculties = {
    "Mansoura University": ["Dentistry", "Nursing"],
    "King Khalid University": ["Dentistry"],
  };

  static final programs = {
    "Dentistry": ["Bachelor", "Master"],
    "Nursing": ["Piometry"],
  };

  static final levels = {
    "Bachelor": ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5"],
    "Master": ["First", "Second"],
  };

  static final specializations = {
    "Second": [
      "Periodontology",
      "Oral surgery",
      "Pedodontics",
      "Endodontics",
      "Operative",
      "Prothodontics",
      "Orthodontics",
    ],
  };
}
