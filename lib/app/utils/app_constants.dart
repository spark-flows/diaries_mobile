/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.
library;

// coverage:ignore-file
abstract class AppConstants {
  static String isUserLoggedIn = 'isUserLoggedIn';
  static String userIdLocal = 'userIdLocal';
  static String userEmailLocal = 'userEmailLocal';
  static String userCookieSession = 'userCookieSession';
  static String userFNameLocal = 'userFNameLocal';
  static String userLNameLocal = 'userLNameLocal';
  static String userGenderLocal = 'userGenderLocal';
  static const String loader = 'assets/images/loader.json';
}
