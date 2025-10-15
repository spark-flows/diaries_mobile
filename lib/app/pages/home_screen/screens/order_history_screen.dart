import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderHistoyScreen extends StatelessWidget {
  const OrderHistoyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(
              title: Text('Order History'),
              backgroundColor: ColorsValue.appBg,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: Scaffold(
              backgroundColor: ColorsValue.appBg,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      onChanged: (value) {
                        controller.update();
                      },
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Card(
                          elevation: 0,
                          color: ColorsValue.appBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(color: ColorsValue.textFieldBg),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4,right: 4,top: 4,bottom: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
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
                                  colorFilter: ColorFilter.mode(
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return OrderCard(
                            name: "Sagar Miyani",
                            orderNo: "py-166-2025",
                            products: ["1/4862...", "2/4862...", "3/4862..."],
                            qty: 10,
                            price: 500,
                            date: DateTime(2025, 5, 25),
                          );
                        },
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

class OrderCard extends StatelessWidget {
  final String name;
  final String orderNo;
  final List<String> products;
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
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    text: const TextSpan(
                      text: "Product : ",
                      style: TextStyle(
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
              children: products
                  .map(
                    (product) {
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
                                        "Sr.Job :- srjobno (8x)",
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
                                        Text(
                                          "Design No. :- designno",
                                          style: Styles.txtBlackColorW60014,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Price :- ",
                                              style: Styles.txtBlackColorW60014,
                                            ),
                                            Text(
                                              "price\$",
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
                    },
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
