import 'package:diaries/app/app.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UploadCardButton extends StatelessWidget {
  final String title;
  const UploadCardButton(
      {super.key,
      required this.title,});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
        },
        child: DottedBorder(
          radius: Radius.circular(Dimens.twelve),
          color: ColorsValue.color94A3B8,
          child: Container(
            height: Get.height / 9.3,
            width: Get.width,
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
      ),
    );
  }
}

