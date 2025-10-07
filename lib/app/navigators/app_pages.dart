import 'package:diaries/app/pages/home_screen/productDetail.dart';
import 'package:diaries/app/pages/pages.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<ScannerScreen>(
      name: _Paths.scannerScreen,
      transitionDuration: transitionDuration,
      page: ScannerScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AuthScreen>(
      name: _Paths.authScreen,
      transitionDuration: transitionDuration,
      page: AuthScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<RegisterScreen>(
      name: _Paths.registerScreen,
      transitionDuration: transitionDuration,
      page: RegisterScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ForgotScreen>(
      name: _Paths.forgotScreen,
      transitionDuration: transitionDuration,
      page: ForgotScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ResetPasswordScreen>(
      name: _Paths.resetPasswordScreen,
      transitionDuration: transitionDuration,
      page: ResetPasswordScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ProductDetailScreen>(
      name: _Paths.scannerDetailScreen,
      transitionDuration: transitionDuration,
      page: ProductDetailScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
