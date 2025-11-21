import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainProductDevelopment extends StatelessWidget {
  const MainProductDevelopment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PDevelopmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: 'Product Development'.tr,
            isCenter: true,
            isVisible: true,
            paddingBackArrow:
                Utility.isTablet() ? Dimens.edgeInsets5 : Dimens.edgeInsets10,
          ),
          body: SafeArea(
            child: GridView.builder(
              padding: Dimens.edgeInsets20_10_20_20,
              itemCount: controller.productDevelopmentList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Dimens.ten,
                crossAxisSpacing: Dimens.ten,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: controller.productDevelopmentList[index].onTap,
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
                          controller.productDevelopmentList[index].icon ?? "",
                          height: Dimens.fifty,
                          width: Dimens.fifty,
                          colorFilter: ColorFilter.mode(
                            ColorsValue.darkAppColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        Dimens.boxHeight20,
                        Text(
                          controller.productDevelopmentList[index].name ?? "",
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