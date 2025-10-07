// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:convert';

import 'package:diaries/app/app.dart';
import 'package:diaries/domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this.authPresenter);

  AuthPresenter authPresenter;

  // var firebaseMessaging = FirebaseMessaging.instance;

  String? fcmToken;

  @override
  onInit() async {
    super.onInit();
    // await firebaseMessaging.getToken().then((token) async {
    //   fcmToken = token;
    // });
  }

  ///========================================== AuthScreen =========================================

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> postLoginApi() async {
    var response = await authPresenter.postLoginApi(
      username: mobileController.text,
      password: passwordController.text,
      fcmToken: fcmToken ?? "",
      isLoading: false,
    );
    if (response?.data != null) {
      RouteManagement.goToHomeScreen();
      Utility.closeLoader();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  ///========================================== RegisterScreen =========================================

  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController nameRegisterController = TextEditingController();
  TextEditingController mobileRegisterController = TextEditingController();
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  TextEditingController confirmPasswordRegisterController =
      TextEditingController();

  bool isReValid = false;
  var dailReCode = '+91';

  Future<void> postRegisterApi() async {
    var response = await authPresenter.postRegisterApi(
      name: nameRegisterController.text,
      email: emailRegisterController.text,
      countrycode: dailReCode,
      mobile: mobileRegisterController.text,
      password: passwordRegisterController.text,
      roleid: "",
      isLoading: true,
    );
    if (response?.statusCode == 200) {
      Get.back();
      Utility.snacBar(
        jsonDecode(response?.data ?? "")["Message"],
        ColorsValue.appColor,
      );
      clearRegister();
    } else {
      Utility.errorMessage(jsonDecode(response?.data ?? "")["Message"]);
    }
    update();
  }

  clearRegister() {
    nameRegisterController.clear();
    mobileRegisterController.clear();
    emailRegisterController.clear();
    passwordRegisterController.clear();
    confirmPasswordRegisterController.clear();
  }

  ///========================================== ForgotScreen =========================================

  GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
  TextEditingController emailForgotController = TextEditingController();

  ForgotData? forgotData = ForgotData();

  Future<void> postForgotApi() async {
    var response = await authPresenter.postForgotApi(
      email: emailForgotController.text,
      isLoading: false,
    );
    forgotData = null;
    if (response?.data != null) {
      forgotData = response?.data;
      Get.find<Repository>().saveValue(LocalKeys.branchid, response?.data);
      Utility.closeLoader();
      RouteManagement.goToResetPasswordScreen(response?.data);
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
    update();
  }

  ///========================================== AuthScreen =========================================

  GlobalKey<FormState> resetKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> postResetApi() async {
    var response = await authPresenter.postResetApi(
      content: forgotData?.content ?? "",
      iv: forgotData?.iv ?? "",
      password: confirmPasswordController.text,
      isLoading: false,
    );
    if (response?.data != null) {
      Utility.closeLoader();
      Utility.snacBar(
        jsonDecode(response?.data.toString() ?? "")['Message'],
        ColorsValue.appColor,
      );
      RouteManagement.goToAuthScreen();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(
        jsonDecode(response?.data.toString() ?? "")['Message'],
      );
    }
    update();
  }
}
