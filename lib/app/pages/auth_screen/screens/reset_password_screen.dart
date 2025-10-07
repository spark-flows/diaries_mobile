import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      initState: (state) {
        var controller = Get.find<AuthController>();
        controller.forgotData = null;
        controller.forgotData = Get.arguments;
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          body: Form(
            key: controller.resetKey,
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                SvgPicture.asset(
                  AssetConstants.ic_reset_password,
                  height: Get.width,
                ),
                Padding(
                  padding: Dimens.edgeInsets20_00_20_00,
                  child: Text(
                    'Reset Password',
                    style: Styles.txtBlackColorW70022.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.thirty : Dimens.twentyTwo,
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
                    controller: controller.newPasswordController,
                    isTitle: true,
                    titleStyle: Styles.txtBlackColorW70014.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                    ),
                    hintStyle: Styles.txtGreyColorW50012.copyWith(
                      fontSize:
                          Utility.isTablet()
                              ? Dimens.eighteen
                              : Dimens.fourteen,
                    ),
                    hintText: 'Enter New Password'.tr,
                    title: 'New Password'.tr,
                    fillColor: ColorsValue.textFieldBg,
                    filled: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter New Password'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                Dimens.boxHeight20,
                Padding(
                  padding:
                      !Utility.isTablet()
                          ? Dimens.edgeInsets20_00_20_00
                          : Dimens.edgeInsets30_00_30_00,
                  child: CustomTextFormField(
                    controller: controller.confirmPasswordController,
                    isTitle: true,
                    titleStyle: Styles.txtBlackColorW70014.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                    ),
                    hintStyle: Styles.txtGreyColorW50012.copyWith(
                      fontSize:
                          Utility.isTablet()
                              ? Dimens.eighteen
                              : Dimens.fourteen,
                    ),
                    hintText: 'Enter Confirm Password'.tr,
                    title: 'Confirm Password'.tr,
                    fillColor: ColorsValue.textFieldBg,
                    filled: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Confirm Password'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                Dimens.boxHeight50,
                Padding(
                  padding:
                      !Utility.isTablet()
                          ? Dimens.edgeInsets20_00_20_20
                          : Dimens.edgeInsets30_00_30_30,
                  child: CustomButton(
                    onPressed: () {
                      if (controller.resetKey.currentState!.validate()) {
                        controller.postResetApi();
                      }
                    },
                    text: 'Reset Password'.tr,
                    textStyle: Styles.whiteColorW80018.copyWith(
                      fontSize:
                          Utility.isTablet() ? Dimens.twenty : Dimens.eighteen,
                    ),
                    backgroundColor: ColorsValue.appColor,
                    heightBtn: Utility.isTablet() ? Dimens.sixty : Dimens.fifty,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
