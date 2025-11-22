import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_controller.dart';
import 'package:diaries/app/widgets/custom_full_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewConceptScreen extends StatelessWidget {
  const ViewConceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PDevelopmentController>(
      initState: (state) {},
      builder: (controller) {
        final element = controller.getOneConcept;
        return Scaffold(
          backgroundColor: ColorsValue.textFieldBg,
          appBar: AppBarWidget(
            backgroundColor: ColorsValue.textFieldBg,
            onTapBack: () {
              Get.back();
            },
            title: "Concept Page",
            isCenter: true,
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
                        Text("Concept Name", style: Styles.txtBlackColorW40012),
                        Text("Concept No.", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          element?.name ?? " - ",
                          style: Styles.txtBlackColorW60012,
                        ),
                        Text(
                          element?.conceptno ?? " - ",
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),

                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start Date", style: Styles.txtBlackColorW40012),
                        Text("End Date", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Utility.getFormattedTime(
                            element?.startDate.toString() ?? " - ",
                            'dd-MM-yyyy',
                          ),
                          style: Styles.txtBlackColorW60012,
                        ),
                        Text(
                          Utility.getFormattedTime(
                            element?.endDate.toString() ?? " - ",
                            'dd-MM-yyyy',
                          ),
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Text("Designer Name", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight6,
                    Text(
                      element?.designer?.name ?? " - ",
                      style: Styles.txtBlackColorW60012,
                    ),
                    Dimens.boxHeight10,
                  ],
                ),
              ),
              Dimens.boxHeight10,
              Text('Product Details'),
              Dimens.boxHeight8,
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
                        Text("Sr. No", style: Styles.txtBlackColorW40012),
                        Text("Category", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Flora", style: Styles.txtBlackColorW60012),
                        Text(
                          element?.category?.name ?? " - ",
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),

                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("G.W", style: Styles.txtBlackColorW40012),
                        Text("D.W", style: Styles.txtBlackColorW40012),
                      ],
                    ),
                    Dimens.boxHeight6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          element?.goldWt ?? '',
                          style: Styles.txtBlackColorW60012,
                        ),
                        Text(
                          element?.diamondWt ?? '',
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Style", style: Styles.txtBlackColorW40012),
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
                        Text(
                          element?.style?.name ?? " ",
                          style: Styles.txtBlackColorW60012,
                        ),
                        Text(
                          element?.designno ?? '',
                          style: Styles.txtBlackColorW60012,
                        ),
                      ],
                    ),
                    Dimens.boxHeight10,
                  ],
                ),
              ),
              Dimens.boxHeight10,
              Container(
                padding: Dimens.edgeInsets20,
                color: ColorsValue.whiteColor,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Remark", style: Styles.txtBlackColorW40012),
                    Text(
                      element?.remark1 ?? ' - ',
                      style: Styles.txtBlackColorW60012,
                    ),
                    Dimens.boxHeight10,
                  ],
                ),
              ),
              Dimens.boxHeight10,
              Container(
                padding: Dimens.edgeInsets10,
                color: ColorsValue.whiteColor,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Remark", style: Styles.txtBlackColorW40012),
                    Dimens.boxHeight10,
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: element?.images?.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder:
                                    (_) => ReferenceViewer(
                                      images:
                                          element?.images ??
                                          [
                                            // "https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg?_gl=1*1nbj9s1*_ga*MzE1MjI0OTAuMTc2Mzc0NjI2NA..*_ga_8JE65Q40S6*czE3NjM3NDYyNjQkbzEkZzAkdDE3NjM3NDYyNjQkajYwJGwwJGgw",
                                            // "https://media.istockphoto.com/id/481826798/photo/young-mahout-showing-off-india.jpg?s=2048x2048&w=is&k=20&c=zuAFLsN9W9nqEhNDfBoeSyo8vPbR88FHj2Pwmk2PIpU=",
                                            // "https://www.dreamstime.com/stock-photo-beautiful-view-nature-mountains-near-konigssee-lake-bavaria-germany-blue-sky-clouds-image97444419",
                                            // "https://images.pexels.com/photos/1054655/pexels-photo-1054655.jpeg?_gl=1*1nbj9s1*_ga*MzE1MjI0OTAuMTc2Mzc0NjI2NA..*_ga_8JE65Q40S6*czE3NjM3NDYyNjQkbzEkZzAkdDE3NjM3NDYyNjQkajYwJGwwJGgw",
                                            // "https://media.istockphoto.com/id/481826798/photo/young-mahout-showing-off-india.jpg?s=2048x2048&w=is&k=20&c=zuAFLsN9W9nqEhNDfBoeSyo8vPbR88FHj2Pwmk2PIpU=",
                                          ],
                                    ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Image.network(element?.images?[index] ?? ""),
                            ),
                          );
                        },
                      ),
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
  }
}
