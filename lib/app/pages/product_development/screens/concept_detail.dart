import 'package:diaries/app/navigators/navigators.dart';
import 'package:diaries/app/pages/product_development/product_development_controller.dart';
import 'package:diaries/app/theme/theme.dart';
import 'package:diaries/app/utils/utils.dart';
import 'package:diaries/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConceptDetailScreen extends StatelessWidget {
  const ConceptDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PDevelopmentController>(
      initState: (state) {
        final controller = Get.find<PDevelopmentController>();
      },
      builder: (controller) {
        return GetBuilder<PDevelopmentController>(
          builder: (controller) {
            return Scaffold(
              backgroundColor: ColorsValue.textFieldBg,
              appBar: AppBarWidget(
                backgroundColor: ColorsValue.textFieldBg,
                onTapBack: () {
                  Get.back();
                },
                title: " Test User ",
                isCenter: true,
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: Dimens.edgeInsetsRight10,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AssetConstants.edit_icon),
                          Dimens.boxWidth5,
                          Text("Edit"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: Dimens.edgeInsets20,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        heightBtn: Dimens.fourtyFive,
                        radius: Dimens.six,
                        onPressed: () {
                          RouteManagement.goToViewConceptScreen();
                        },
                        text: 'View Concept',
                        isBorder: true,
                        borderColor: ColorsValue.txtBlackColor,
                        textStyle: Styles.txtBlackColorW60016,
                        backgroundColor: ColorsValue.transparent,
                        leading: SvgPicture.asset(AssetConstants.eyes_icon),
                      ),
                    ),
                    Dimens.boxWidth20,
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height:
                              Utility.isTablet()
                                  ? Dimens.fiftyFive
                                  : Dimens.fourtyFive,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: ColorsValue.appColor,
                            borderRadius: BorderRadius.circular(Dimens.ten),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetConstants.download_icon),
                              Dimens.boxWidth10,
                              Text(
                                'Download',
                                style: Styles.whiteColorW50014.copyWith(
                                  fontSize:
                                      Utility.isTablet()
                                          ? Dimens.twenty
                                          : Dimens.fourteen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView(
                padding: Dimens.edgeInsets20_10_20_20,
                physics: ClampingScrollPhysics(),
                children: [
                  Dimens.boxHeight20,
                  Container(
                    padding: Dimens.edgeInsets20,
                    color: ColorsValue.whiteColor,
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date", style: Styles.txtBlackColorW40012),
                            Text("Status", style: Styles.txtBlackColorW40012),
                          ],
                        ),
                        Dimens.boxHeight6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: Dimens.six,
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.calendar_icon,
                                  height: Dimens.twelve,
                                ),
                                Text(
                                  Utility.getFormatedTime(
                                    '2025-11-16T06:32:04.000Z',
                                    'dd-MM-yyyy',
                                  ),
                                  style: Styles.txtBlackColorW60012,
                                ),
                              ],
                            ),
                            Container(
                              padding: Dimens.edgeInsets06_04_06_04,
                              decoration: BoxDecoration(
                                color: ColorsValue.appColor,
                                borderRadius: BorderRadius.circular(
                                  Dimens.four,
                                ),
                              ),
                              child: Text(
                                'Pending',
                                style: Styles.whiteColorW50010,
                              ),
                            ),
                          ],
                        ),
                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Concept No.",
                              style: Styles.txtBlackColorW40012,
                            ),
                            Text(
                              "No. Of Design",
                              style: Styles.txtBlackColorW40012,
                            ),
                          ],
                        ),
                        Dimens.boxHeight6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("01", style: Styles.txtBlackColorW60012),
                            Text("10", style: Styles.txtBlackColorW60012),
                          ],
                        ),

                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Start Date",
                              style: Styles.txtBlackColorW40012,
                            ),
                            Text("End Date", style: Styles.txtBlackColorW40012),
                          ],
                        ),
                        Dimens.boxHeight6,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "25-05-2025",
                              style: Styles.txtBlackColorW60012,
                            ),
                            Text(
                              '25-05-2025',
                              style: Styles.txtBlackColorW60012,
                            ),
                          ],
                        ),
                        Dimens.boxHeight10,
                        Text(
                          "Designer Name",
                          style: Styles.txtBlackColorW40012,
                        ),
                        Dimens.boxHeight6,
                        Text(
                          "Designer Name",
                          style: Styles.txtBlackColorW60012,
                        ),
                        Dimens.boxHeight10,
                        Text("Remark ", style: Styles.txtBlackColorW40012),
                        Dimens.boxHeight6,
                        Text(
                          "Designer Name",
                          style: Styles.txtBlackColorW60012,
                        ),
                        Dimens.boxHeight10,
                        Text("Remark 02 ", style: Styles.txtBlackColorW40012),
                        Dimens.boxHeight6,
                        Text(
                          "Designer Name",
                          style: Styles.txtBlackColorW60012,
                        ),
                        Dimens.boxHeight10,
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
