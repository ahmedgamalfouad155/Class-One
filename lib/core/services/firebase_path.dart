class FirestorePath {
  static String coursePath(
    String country,
    String university,
    String faculty,
    String program,
    String stage,
    String subject,
    String term,
  ) =>
      "countries/$country/universities/$university/faculties/$faculty/programs/$program/stages/$stage/subjects/$subject/terms/$term/lessons/";

  static String subjectsPath({
    required String country,
    required String university,
    required String faculty,
    required String program,
    required String stage,
  }) =>
      "countries/$country/universities/$university/faculties/$faculty/programs/$program/stages/$stage/subjects/";

  static String courses(String uid, String cartId) =>
      "users/$uid/myCourses/$cartId";
  static String myCourses(String uid) => "users/$uid/myCourses/";

  static String products() => "products/";
  static String categories() => "categories/";
  static String users(String uid) => "users/$uid";
  static String favoriteProduct(String uid, String productId) =>
      "users/$uid/favorite/$uid/products/$productId";
  static String myFavoriteProduct(String uid) =>
      "users/$uid/favorite/$uid/products/";

  static String favoritePlanet(String uid, String planetId) =>
      "users/$uid/favorite/$uid/planets/$planetId";
  static String myFavoritePlanet(String uid) =>
      "users/$uid/favorite/$uid/planets/";

  static String garden(String uid, String planetId) =>
      "users/$uid/garden/$planetId";
  static String myGarden(String uid) => "users/$uid/garden/";

  static String planetAlarm(String uid, String planetId, String alarmId) =>
      "users/$uid/garden/$planetId/alarms/$alarmId";
  static String myPlanetAlarm(String uid, String productId) =>
      "users/$uid/garden/$productId/alarms/";

  static String addresses(String uid, String addressId) =>
      "users/$uid/addresses/$addressId";
  static String myAddresses(String uid) => "users/$uid/addresses/";
}
