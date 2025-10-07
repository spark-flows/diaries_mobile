import 'package:diaries/app/app.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsetsBottom50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      !Utility.isTablet()
                          ? Dimens.edgeInsets20_00_20_00
                          : Dimens.edgeInsets30_00_30_00,
                  child: CustomButton(
                    onPressed: () {
                      if (controller.loginKey.currentState!.validate()) {
                        Utility.showLoader();
                        controller.postLoginApi();
                      }
                    },
                    text: 'Sign Up'.tr,
                    textStyle: Styles.whiteColorW80018.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.eighteen,
                    ),
                    backgroundColor: ColorsValue.appColor,
                    heightBtn: Utility.isTablet() ? Dimens.sixty : Dimens.fifty,
                  ),
                ),
                Dimens.boxHeight5,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: Styles.txtGreyColorW40014,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          style: Styles.appColorW70016,
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  RouteManagement.goToRegisterScreen();
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: Form(
              key: controller.loginKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  SvgPicture.asset(
                    AssetConstants.ic_login,
                    height: Get.width / 1.5,
                  ),
                  Dimens.boxHeight30,
                  Center(
                    child: Text(
                      'Sign In',
                      style: Styles.txtBlackColorW70022.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.thirty
                                : Dimens.twentyTwo,
                      ),
                    ),
                  ),
                  Dimens.boxHeight6,
                  Center(
                    child: Text(
                      'Welcome please your account Details'.tr,
                      style: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet() ? Dimens.twenty : Dimens.twelve,
                      ),
                    ),
                  ),
                  Dimens.boxHeight30,
                  Padding(
                    padding:
                        !Utility.isTablet()
                            ? Dimens.edgeInsets20_00_20_00
                            : Dimens.edgeInsets30_00_30_00,
                    child: CustomTextFormField(
                      controller: controller.mobileController,
                      isTitle: true,
                      titleStyle: Styles.txtBlackColorW70014.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.twenty
                                : Dimens.fourteen,
                      ),
                      hintStyle: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                      hintText: 'Enter Username'.tr,
                      title: 'Username'.tr,
                      fillColor: ColorsValue.textFieldBg,
                      filled: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Username'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  Dimens.boxHeight10,
                  Padding(
                    padding:
                        !Utility.isTablet()
                            ? Dimens.edgeInsets20_00_20_00
                            : Dimens.edgeInsets30_00_30_00,
                    child: CustomTextFormField(
                      controller: controller.passwordController,
                      isTitle: true,
                      titleStyle: Styles.txtBlackColorW70014.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.twenty
                                : Dimens.fourteen,
                      ),
                      hintStyle: Styles.txtGreyColorW50012.copyWith(
                        fontSize:
                            Utility.isTablet()
                                ? Dimens.eighteen
                                : Dimens.fourteen,
                      ),
                      hintText: 'Enter Password'.tr,
                      title: 'Password'.tr,
                      fillColor: ColorsValue.textFieldBg,
                      filled: true,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Password'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                  Dimens.boxHeight20,
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Forgot your Sign in details? ',
                        style: Styles.txtGreyColorW40014,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Get help logging in.',
                            style: Styles.appColorW70016,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    RouteManagement.goToForgotScreen();
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
