import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/app/widgets/custom_calender.dart';
import 'package:diaries/app/widgets/custom_user_detail.dart';
import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PDevelopmentScreen extends StatelessWidget {
  const PDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PDevelopmentController>(
      initState: (state) {
        final controller = Get.find<PDevelopmentController>();
        controller.customerDevelopmentPagingController.addPageRequestListener((
          pageKey,
        ) async {
          await controller.postGetAllDevelopmentList(pageKey);
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.textFieldBg,
          appBar: AppBar(
            title: Text(
              'Product Development',
              style: Styles.appColorW50012.copyWith(
                fontSize: 18,
                color: ColorsValue.blackColor,
              ),
            ),
            backgroundColor: ColorsValue.textFieldBg,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Search',
                  controller: controller.searchTC,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  onChanged: (value) {
                    controller.debouncer.run(() {
                      Future.sync(() {});
                    });
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => const FilterCalendarSheet(),
                        );
                        // if (selectedDate != null) {
                        //   print('User selected: $selectedDate');
                        //   controller.customerOrderHistoryPagingController
                        //       .refresh();
                        // } else {
                        //   print('User canceled the date selection.');
                        //   controller.customerOrderHistoryPagingController
                        //       .refresh();
                        // }
                      },
                      child: Card(
                        elevation: 0,
                        color: ColorsValue.appBg,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: ColorsValue.textFieldBg),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                            right: 4,
                            top: 4,
                            bottom: 4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Select Date',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Dimens.boxWidth5,
                              SvgPicture.asset(
                                AssetConstants.calender_icon,
                                colorFilter: const ColorFilter.mode(
                                  Colors.black87,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh:
                        () => Future.sync(
                          () =>
                              controller.customerDevelopmentPagingController
                                  .refresh(),
                        ),
                    child: PagedListView<int, DevelopmentModelDoc>(
                      pagingController:
                          controller.customerDevelopmentPagingController,
                      builderDelegate:
                          PagedChildBuilderDelegate<DevelopmentModelDoc>(
                            noItemsFoundIndicatorBuilder: (context) {
                              return Center(
                                child: Text(
                                  "Order history not found...!",
                                  style: Styles.txtBlackColorW60014.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.twenty
                                            : Dimens.fourteen,
                                  ),
                                ),
                              );
                            },
                            firstPageErrorIndicatorBuilder: (context) {
                              return Center(
                                child: Text(
                                  "Failed to load order history",
                                  style: Styles.txtBlackColorW60014.copyWith(
                                    fontSize:
                                        Utility.isTablet()
                                            ? Dimens.twenty
                                            : Dimens.fourteen,
                                  ),
                                ),
                              );
                            },
                            firstPageProgressIndicatorBuilder:
                                (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            newPageProgressIndicatorBuilder:
                                (context) => const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                            itemBuilder: (context, item, index) {
                              return ProjectCard(
                                title: item.name ?? '',
                                status: item.status ?? '',
                                statusColor: Colors.pink,
                                date: item.startDate ?? DateTime.now(),
                                conceptNo: item.conceptno ?? '',
                                noOfDesign: item.designno ?? '',
                                startDate: item.startDate ?? DateTime.now(),
                                endDate: item.endDate ?? DateTime.now(),
                                designerName:
                                    item.designer?.name ?? 'Design Name',
                              );
                            },
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
