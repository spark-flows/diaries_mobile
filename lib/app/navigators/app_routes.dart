part of 'app_pages.dart';

abstract class Routes {
  static const splashScreen = _Paths.splashScreen;
  static const homeScreen = _Paths.homeScreen;
  static const authScreen = _Paths.authScreen;
  static const registerScreen = _Paths.registerScreen;
  static const forgotScreen = _Paths.forgotScreen;
  static const resetPasswordScreen = _Paths.resetPasswordScreen;
  static const scannerScreen = _Paths.scannerScreen;
}

abstract class _Paths {
  static const splashScreen = '/splashScreen';
  static const homeScreen = '/homeScreen';
  static const authScreen = '/authScreen';
  static const registerScreen = '/registerScreen';
  static const forgotScreen = '/forgotScreen';
  static const resetPasswordScreen = '/resetPasswordScreen';
  static const scannerScreen = '/scannerScreen';
}
