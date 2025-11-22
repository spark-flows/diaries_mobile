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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              RouteManagement.goToAddConceptScreen();
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(100),
            ),
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text(
              'Concept',
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
                        color: ColorsValue.greyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: ColorsValue.lineColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Filter', style: Styles.color010101W50014),
                              SizedBox(width: 6),
                              SvgPicture.asset(
                                AssetConstants.filter_icon,
                                width: 18,
                                height: 18,
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
                              Color getStatusColor() {
                                switch (item.status.toString().toLowerCase()) {
                                  case 'delivered':
                                    return const Color(0xFF468F73);
                                  case 'pending':
                                    return const Color(0xFFEBBD87);
                                  case 'cancel':
                                    return const Color(0xFFD80032);
                                  case 'processing':
                                    return const Color(0xFF6F42C1);
                                  default:
                                    return Colors.grey;
                                }
                              }

                              return GestureDetector(
                                onTap: () {
                                  RouteManagement.goToConceptDetailScreen(
                                    conceptId: item.id ?? "",
                                    isAllocated: false,
                                  );
                                },
                                child: ProjectCard(
                                  title: item.name ?? ' - ',
                                  status: item.status ?? ' - ',
                                  statusColor: getStatusColor(),
                                  date: item.startDate ?? DateTime.now(),
                                  conceptNo: item.conceptno ?? ' - ',
                                  noOfDesign: item.designno ?? ' - ',
                                  startDate: item.startDate ?? DateTime.now(),
                                  endDate: item.endDate ?? DateTime.now(),
                                  designerName:
                                      item.designer?.name ?? 'Design Name',
                                ),
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
