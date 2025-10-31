import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class FilterCalendarSheet extends StatelessWidget {
  const FilterCalendarSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Get.back(),
                ),
              ],
            ),

            // Calendar
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controller.focusedDay,
              selectedDayPredicate: (day) => isSameDay(controller.selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                controller.selectedDay = selectedDay;
                controller.focusedDay = focusedDay;
                controller.update();
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color(0xFFB89154),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
            ),
            Dimens.boxHeight16,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      controller.selectedDay = null;
                      controller.update();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Utility.isTablet() ? Dimens.fiftyFive : Dimens.fourty,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorsValue.whiteColor,
                        borderRadius: BorderRadius.circular(Dimens.ten),
                        border: Border.all(
                          color: ColorsValue.blackColor,
                          width: Dimens.one,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Dimens.boxWidth5,
                          Text(
                            'Clear Filters'.tr,
                            style: Styles.txtBlackColorW50014.copyWith(
                              fontSize: Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                              color: ColorsValue.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Dimens.boxWidth20,
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      Get.back(result: controller.selectedDay);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: Utility.isTablet() ? Dimens.fiftyFive : Dimens.fourty,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorsValue.appColor,
                        borderRadius: BorderRadius.circular(Dimens.ten),
                      ),
                      child: Text(
                        'Apply',
                        style: Styles.whiteColorW50014.copyWith(
                          fontSize: Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Dimens.boxHeight16,
          ],
        ),
      );
    });
  }
}
