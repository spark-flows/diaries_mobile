import 'package:diaries/app/theme/colors_value.dart';
import 'package:diaries/app/theme/dimens.dart';
import 'package:flutter/material.dart';
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Status :-",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorsValue.txtBlackColor,
                    ),
                  ),
                  Dimens.boxWidth10,
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: Dimens.edgeInsets10_06_10_06,
                      child: Text(
                        status,
                        style: TextStyle(
                          color: ColorsValue.colorF8FAFC,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.calendar_month, size: 18),
              const SizedBox(width: 5),
              Text(
                DateFormat('dd-MM-yyyy').format(date),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Divider with dots
          Row(children: const [Expanded(child: Divider(thickness: 1))]),

          const SizedBox(height: 12),

          /// Concept & No. of Design
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoText("Concept No. :", conceptNo),
              _infoText("No. Of Design :", noOfDesign),
            ],
          ),
          const SizedBox(height: 12),
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

          const SizedBox(height: 12),

          /// Designer Name
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
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
