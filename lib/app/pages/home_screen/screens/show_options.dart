import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SelectOptionsScreen extends StatelessWidget {
  const SelectOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'HomeScreen'.tr,
            isCenter: true,
            isVisible: false,
            paddingBackArrow:
                Utility.isTablet() ? Dimens.edgeInsets5 : Dimens.edgeInsets10,
            actions: [
              GestureDetector(
                onTap: () {
                  RouteManagement.goToProfileScreen();
                },
                child: Image.asset(
                  AssetConstants.usera,
                  height: Utility.isTablet() ? Dimens.sixty : Dimens.fourty,
                ),
              ),
              Dimens.boxWidth10,
            ],
          ),
          body: SafeArea(
            child: GridView.builder(
              padding: Dimens.edgeInsets20_10_20_20,
              itemCount: controller.homeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimens.ten,
                crossAxisSpacing: Dimens.ten,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: controller.homeList[index].onTap,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsValue.appColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(Dimens.fourteen),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          controller.homeList[index].icon ?? "",
                          height: Dimens.fifty,
                          width: Dimens.fifty,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.darkAppColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        Dimens.boxHeight20,
                        Text(
                          controller.homeList[index].name ?? "",
                          style: Styles.whiteColorW70014.copyWith(
                            color: ColorsValue.darkAppColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
