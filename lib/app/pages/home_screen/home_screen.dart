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
                onTap: () {
                  RouteManagement.goToScannerScreen();
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
            //  [
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("SR No.", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("1", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Design No.",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Sr Job", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Collection",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Inward No", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Category", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Sub Category",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Size", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Metal Type",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Metal Color",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Gross Weight",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Metal Weight",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Purchase Fine",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Sale Fine", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Dimaond Ctw",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Diamond Pcs",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("CS Ctw", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("CS Pcs", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Misc Ctw", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Misc Pcs", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Staus", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Invoice No",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Customer", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("MRP", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("Location", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text("HUID", style: Styles.txtBlackColorW50014),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Product Type",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            //   Dimens.boxHeight10,
            //   Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Expanded(
            //         flex: 3,
            //         child: Text(
            //           "Certification",
            //           style: Styles.txtBlackColorW50014,
            //         ),
            //       ),
            //       Expanded(
            //         flex: 7,
            //         child: Text("REW123", style: Styles.txtGreyColorW40014),
            //       ),
            //     ],
            //   ),
            // ],
          ),
        );
      },
    );
  }
}
