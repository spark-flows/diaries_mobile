import 'package:diaries/app/app.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadCardButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final List<String> images;

  const UploadCardButton({
    super.key,
    required this.title,
    this.onTap,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: DottedBorder(
          radius: Radius.circular(Dimens.twelve),
          color: ColorsValue.color94A3B8,
          child:
              images.isEmpty
                  ? Container(
                    height: Get.height / 9.3,
                    width: Get.width,
                    decoration: BoxDecoration(color: ColorsValue.textFieldBg),
                    child: Padding(
                      padding: EdgeInsets.all(Dimens.twelve),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AssetConstants.export_icon),
                          Dimens.boxWidth10,
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Styles.color969FB340016,
                          ),
                        ],
                      ),
                    ),
                  )
                  : Container(
                    decoration: BoxDecoration(color: ColorsValue.textFieldBg),
                    child: Row(
                      children: [
                        Container(
                          margin: Dimens.edgeInsets6,
                          height: Get.height / 9.2,
                          width:Get.width / 4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              final element = images[index];
                              return Container(
                                width: Get.width / 4,
                                child: Image.network(element),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: Get.height / 9.3,
                            width: Get.height / 3,
                            decoration: BoxDecoration(
                              color: ColorsValue.textFieldBg,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(Dimens.twelve),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(AssetConstants.export_icon),
                                  Dimens.boxWidth10,
                                  Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: Styles.color969FB340016,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        ),
      ),
    );
  }
}
