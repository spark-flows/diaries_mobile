import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/profile_screen/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      initState: (state) {
        var controller = Get.find<ProfileController>();
        controller.getProfileApi();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Profile'.tr,
            isVisible: true,
            isCenter: true,
          ),
          body:
              Utility.profileData != null
                  ? ListView(
                    physics: ClampingScrollPhysics(),
                    padding:
                        Utility.isTablet()
                            ? Dimens.edgeInsets30
                            : Dimens.edgeInsets20,
                    children: [
                      // Container(
                      //   height:
                      //       Utility.isTablet()
                      //           ? Dimens.hundredFifty
                      //           : Dimens.hundred,
                      //   width:
                      //       Utility.isTablet()
                      //           ? Dimens.hundredFifty
                      //           : Dimens.hundred,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(
                      //       Dimens.fiveHundred,
                      //     ),
                      //   ),
                      //   child: Image.asset(
                      //     AssetConstants.usera,
                      //     fit: BoxFit.fitHeight,
                      //   ),
                      // ),
                      Text(
                        "Name",
                        style: Styles.txtBlackColorW70014.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.fourteen,
                        ),
                      ),
                      Dimens.boxHeight5,
                      Container(
                        padding:
                            Utility.isTablet()
                                ? Dimens.edgeInsets20_15_20_15
                                : Dimens.edgeInsets20_15_20_15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.textFieldBg,
                        ),
                        child: Text(
                          Utility.profileData?.userData?.name ?? "",
                          style: Styles.txtBlackColorW70014.copyWith(
                            fontSize:
                                Utility.isTablet()
                                    ? Dimens.twenty
                                    : Dimens.fourteen,
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Text(
                        "Email",
                        style: Styles.txtBlackColorW70014.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.fourteen,
                        ),
                      ),
                      Dimens.boxHeight5,
                      Container(
                        padding:
                            Utility.isTablet()
                                ? Dimens.edgeInsets20_15_20_15
                                : Dimens.edgeInsets20_15_20_15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.textFieldBg,
                        ),
                        child: Text(
                          Utility.profileData?.userData?.email ?? "",
                          style: Styles.txtBlackColorW70014.copyWith(
                            fontSize:
                                Utility.isTablet()
                                    ? Dimens.twenty
                                    : Dimens.fourteen,
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Text(
                        "Mobile Number",
                        style: Styles.txtBlackColorW70014.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.fourteen,
                        ),
                      ),
                      Dimens.boxHeight5,
                      Container(
                        padding:
                            Utility.isTablet()
                                ? Dimens.edgeInsets20_15_20_15
                                : Dimens.edgeInsets20_15_20_15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.textFieldBg,
                        ),
                        child: Text(
                          Utility.profileData?.userData?.mobile ?? "",
                          style: Styles.txtBlackColorW70014.copyWith(
                            fontSize:
                                Utility.isTablet()
                                    ? Dimens.twenty
                                    : Dimens.fourteen,
                          ),
                        ),
                      ),
                      Dimens.boxHeight20,
                      Text(
                        "Branch",
                        style: Styles.txtBlackColorW70014.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.fourteen,
                        ),
                      ),
                      Dimens.boxHeight5,
                      Container(
                        padding:
                            Utility.isTablet()
                                ? Dimens.edgeInsets20_15_20_15
                                : Dimens.edgeInsets20_15_20_15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          color: ColorsValue.textFieldBg,
                        ),
                        child: Text(
                          "${Utility.profileData?.userData?.branchid?.name}, ${Utility.profileData?.userData?.branchid?.location ?? ""}",
                          style: Styles.txtBlackColorW70014.copyWith(
                            fontSize:
                                Utility.isTablet()
                                    ? Dimens.twenty
                                    : Dimens.fourteen,
                          ),
                        ),
                      ),
                      Dimens.boxHeight30,
                      CustomButton(
                        onPressed: () {
                          controller.showLogoutDialog(context);
                        },
                        heightBtn:
                            Utility.isTablet()
                                ? Dimens.sixty
                                : Dimens.fourtyFive,
                        text: "Logout",
                        backgroundColor: ColorsValue.redColor,
                        widthBtn:
                            Utility.isTablet()
                                ? Dimens.hundredTwenty
                                : Dimens.hundred,
                        textStyle: Styles.whiteColorW60016.copyWith(
                          fontSize:
                              Utility.isTablet()
                                  ? Dimens.twenty
                                  : Dimens.sixteen,
                        ),
                      ),
                    ],
                  )
                  : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
