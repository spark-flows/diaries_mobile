import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final DateTime date;
  final String conceptNo;
  final String noOfDesign;
  final DateTime startDate;
  final DateTime endDate;
  final String designerName;

  const ProjectCard({
    super.key,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.date,
    required this.conceptNo,
    required this.noOfDesign,
    required this.startDate,
    required this.endDate,
    required this.designerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsValue.whiteColor,
        borderRadius: BorderRadius.circular(1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Styles.color33415570014),
              Row(
                children: [
                  Text("Status :-", style: Styles.txtBlackColorW60014),
                  Dimens.boxWidth10,
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: Dimens.edgeInsets06_04_06_04,
                      child: Text(status, style: Styles.colorF8FAFCW50010),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Dimens.boxHeight6,
          Row(
            children: [
              Icon(
                Icons.calendar_month,
                size: 18,
                color: ColorsValue.txtGreyColor,
              ),
              Dimens.boxWidth5,
              Text(
                DateFormat('dd-MM-yyyy').format(date),
                style: Styles.txtGreyColorW60014,
              ),
            ],
          ),
          Dimens.boxHeight12,
          SvgPicture.asset(AssetConstants.custom_divider_icon),
          Dimens.boxHeight12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoText("Concept No. :", conceptNo),
              _infoText("No. Of Design :", noOfDesign),
            ],
          ),
          Dimens.boxHeight12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoText(
                "Start Date :",
                DateFormat('dd-MM-yyyy').format(startDate),
              ),
              _infoText("End Date :", DateFormat('dd-MM-yyyy').format(endDate)),
            ],
          ),
          Dimens.boxHeight12,
          _infoText("Designer Name :", designerName),
        ],
      ),
    );
  }

  /// Small Reusable Text Row
  Widget _infoText(String title, String value) {
    return RichText(
      text: TextSpan(
        text: "$title ",
        style: Styles.txtBlackColorW60014,
        children: [TextSpan(text: value, style: Styles.txtGreyColorW40014)],
      ),
    );
  }
}
