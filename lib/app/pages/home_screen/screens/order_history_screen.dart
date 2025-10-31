import 'package:diaries/app/app.dart';
import 'package:diaries/app/widgets/custom_calender.dart';
import 'package:diaries/domain/models/orderHistory_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class OrderHistoyScreen extends StatelessWidget {
  const OrderHistoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        var controller = Get.find<HomeController>();
        controller.customerOrderHistoryPagingController.addPageRequestListener((
          pageKey,
        ) async {
          await controller.postOrderHistoryApi(pageKey);
        });
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBar(
            title: const Text('Order History'),
            backgroundColor: ColorsValue.appBg,
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
                  controller: controller.searchTextController,
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  onChanged: (value) {
                    controller.debouncer.run(
                      () {
                        Future.sync(
                          () {
                            return controller.customerOrderHistoryPagingController.refresh();
                          },
                        );
                      },
                    );
                  },
                ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () async {
                        final selectedDate = await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => const FilterCalendarSheet(),
                        );
                        if (selectedDate != null) {
                          print('User selected: $selectedDate');
                          controller.customerOrderHistoryPagingController.refresh();
                        } else {
                          print('User canceled the date selection.');
                          controller.customerOrderHistoryPagingController.refresh();
                        }
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
                  // Expanded(
                  //   child: RefreshIndicator(
                  //     onRefresh:
                  //         () => Future.sync(
                  //           () =>
                  //               controller.customerOrderHistoryPagingController
                  //                   .refresh(),
                  //         ),
                  //     child: PagedListView<int, CustomerOrderHistoryDoc>(
                  //       pagingController:
                  //           controller.customerOrderHistoryPagingController,
                  //       builderDelegate:
                  //           PagedChildBuilderDelegate<CustomerOrderHistoryDoc>(
                  //             noItemsFoundIndicatorBuilder: (context) {
                  //               return Center(
                  //                 child: Text(
                  //                   "Order history not found...!",
                  //                   style: Styles.txtBlackColorW60014.copyWith(
                  //                     fontSize:
                  //                         Utility.isTablet()
                  //                             ? Dimens.twenty
                  //                             : Dimens.fourteen,
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //             itemBuilder: (context, item, index) {
                  //               return OrderCard(
                  //                 name: item.customer.name,
                  //                 orderNo: item.orderNo,
                  //                 products:
                  //                     item.products
                  //                         .map((product) => product)
                  //                         .toList(),
                  //                 qty: item.qty,
                  //                 price: item.totalAmount,
                  //                 date: item.orderDate,
                  //               );
                  //             },
                  //           ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh:
                          () => Future.sync(
                            () =>
                                controller.customerOrderHistoryPagingController
                                    .refresh(),
                          ),
                      child: PagedListView<int, CustomerOrderHistoryDoc>(
                        pagingController:
                            controller.customerOrderHistoryPagingController,
                        builderDelegate:
                            PagedChildBuilderDelegate<CustomerOrderHistoryDoc>(
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
                                      padding: EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                              itemBuilder: (context, item, index) {
                                return OrderCard(
                                  name: item.customer.name,
                                  orderNo: item.orderNo,
                                  products:
                                      item.products
                                          .map((product) => product)
                                          .toList(),
                                  qty: item.qty,
                                  price: item.totalAmount,
                                  date: item.orderDate,
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

  void showFilterBottomSheet(BuildContext context) {}
}

class OrderCard extends StatelessWidget {
  final String name;
  final String orderNo;
  final List<Product> products;
  final int qty;
  final double price;
  final DateTime date;

  const OrderCard({
    super.key,
    required this.name,
    required this.orderNo,
    required this.products,
    required this.qty,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('dd-MM-yyyy').format(date),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Dimens.boxHeight8,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Order No. : ",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: orderNo,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Qty : $qty",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Dimens.boxHeight4,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Product : ${products.length}",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    "Price : \$${price.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          showTrailingIcon: false,
          children: [
            const Divider(thickness: 0.5, color: Colors.grey),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        color: ColorsValue.textFieldBg,
                        // padding: Dimens.edgeInsets20_00_20_10,
                        margin: Dimens.edgeInsetsBottom10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              dense: true,
                              visualDensity: VisualDensity(
                                vertical: Dimens.zero,
                                horizontal: Dimens.zero,
                              ),
                              contentPadding: Dimens.edgeInsets0,
                              minVerticalPadding: Dimens.zero,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sr.Job :- ${product.srjobno} (${product.qty}x)",
                                    style: Styles.txtBlackColorW70018,
                                  ),

                                  // InkWell(
                                  //   onTap: () async {
                                  //     // await dbHelper.deleteProduct(
                                  //     //   element.id,
                                  //     // );
                                  //     // controller.localProductList =
                                  //     //     await dbHelper.getAllProducts();
                                  //     // controller.update();
                                  //     // await productManager.deleteProduct(element.id);
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset(
                                  //         AssetConstants.remove_icon,
                                  //         height: 18,
                                  //       ),
                                  //       Dimens.boxWidth4,
                                  //       Text(
                                  //         'Remove',
                                  //         style: Styles.whiteColorW50010
                                  //             .copyWith(
                                  //               color: ColorsValue.redColor,
                                  //             ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: Dimens.edgeInsetsTop05,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // constraints: BoxConstraints(
                                      //   maxWidth:
                                      //       100,
                                      // ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Design No :- ",
                                            style: Styles.txtBlackColorW60014,
                                          ),
                                          Text(
                                        product.designno ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                            style: Styles.txtBlackColorW40014,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Dimens.boxWidth5,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Price :- ",
                                          style: Styles.txtBlackColorW60014,
                                        ),
                                        Text(
                                          "${product.price.toStringAsFixed(2)}\$",
                                          style: Styles.txtBlackColorW40014,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}