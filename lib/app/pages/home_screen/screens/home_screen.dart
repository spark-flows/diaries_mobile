import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {},
            title: 'Diaries',
            isVisible: false,
            isCenter: true,
            actions: [
              GestureDetector(
                onTap: () async {
                  // controller.pickAnyFile();
                  // List<String> urls = [
                  //   'https://chatgpt.com/',
                  //   'https://www.freepik.com/free-vector/people-connecting-web-network-diagram-background_225668598.htm#fromView=keyword&page=1&position=0&uuid=a3ebe0aa-a01c-478e-bad2-2429d1693176&query=Network+png',
                  // ];
                  // controller.shareProductUrls(urls);
                  await controller.getProductApi(srjobno: '1/2751');
                  // RouteManagement.goToScannerScreen();
                },
                child: Lottie.asset(AssetConstants.scanner),
              ),
            ],
          ),
          body: ListView(
            padding: Dimens.edgeInsets20_10_20_20,
            physics: ClampingScrollPhysics(),
            children: [
              Lottie.asset(AssetConstants.scan),
              Center(
                child: Text(
                  "Scan to unlock jewellery info",
                  style: Styles.txtBlackColorW70020,
                  textAlign: TextAlign.center,
                ),
              ),
              Dimens.boxHeight20,
              Center(
                child: Text(
                  "Scan the QR code on your jewellery tag to instantly access complete details — including metal purity, carat weight, certifications, pricing, and authenticity verification — all in one place.",
                  style: Styles.txtGreyColorW40014,
                  textAlign: TextAlign.center,
                ),
              ),
              Dimens.boxHeight30,
              CustomButton(
                heightBtn: Dimens.fifty,
                onPressed: () {
                  RouteManagement.goToScannerScreen();
                },
                text: "Scan Now",
                textStyle: Styles.whiteColorW60016,
                backgroundColor: ColorsValue.appColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
