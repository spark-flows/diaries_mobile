import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  static void goToHomeScreen() => Get.offAllNamed<void>(Routes.homeScreen);

  static void goToAuthScreen() => Get.offAllNamed<void>(Routes.authScreen);

  static void goToRegisterScreen() => Get.toNamed<void>(Routes.registerScreen);

  static void goToResetPasswordScreen(ForgotData? forgotData) =>
      Get.toNamed<void>(Routes.resetPasswordScreen, arguments: forgotData);

  static void goToForgotScreen() => Get.toNamed<void>(Routes.forgotScreen);

  static void goToScannerScreen() => Get.toNamed<void>(Routes.scannerScreen);
  
  static void goToScannerDetailScreen(ProductDetailData element) =>
      Get.toNamed<void>(Routes.scannerDetailScreen,arguments: element);

  static void goToAddNewCustomerScreen() => Get.toNamed<void>(Routes.addCustomerScreen);

  static void goToCartScreen() => Get.toNamed<void>(Routes.cartScreen);
  static void goToOrderHistoryScreen() => Get.toNamed<void>(Routes.orderHistoryScreen);

}
