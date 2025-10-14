import 'package:diaries/app/app.dart';
import 'package:diaries/app/widgets/CRUD_sqflite.dart';
import 'package:diaries/app/widgets/custom_price_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final dbHelper = ProductDbHelper();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        final controller = Get.find<HomeController>();
        controller.localProductList = await dbHelper.getAllProducts();
        controller.update();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              RouteManagement.goToHomeScreen();
            },
            title: "Cart",
            isCenter: true,
          ),
          bottomNavigationBar:
              controller.localProductList.isEmpty
                  ? SizedBox.shrink()
                  : buildOrderSummaryCard(
                    jobList: controller.localProductList,
                    discountPercent:
                        int.tryParse(controller.discountController.text) ?? 0,
                    pricePerJob: 69,
                    onOrderNow: () {},
                    onDiscountClick: () {},
                  ),
          body: SafeArea(
            child:
                controller.localProductList.isEmpty
                    ? Center(child: Text("Cart is Empty"))
                    : ListView.builder(
                      itemCount: controller.localProductList.length,
                      padding: Dimens.edgeInsets0.copyWith(left: 10, right: 10),
                      itemBuilder: (context, index) {
                        final element = controller.localProductList[index];
                        return GestureDetector(
                          onTap: () {
                            // RouteManagement.goToSalesAnalyticsDetailsScreen(element.id);
                          },
                          child: Container(
                            color: ColorsValue.textFieldBg,
                            padding: Dimens.edgeInsets20_00_20_10,
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
                                        "Sr.Job :- ${element.srjobno}",
                                        style: Styles.txtBlackColorW70018,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await dbHelper.deleteProduct(
                                            element.id,
                                          );
                                          controller.localProductList =
                                              await dbHelper.getAllProducts();
                                          controller.update();
                                          // await productManager.deleteProduct(element.id);
                                        },
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AssetConstants.remove_icon,
                                              height: 18,
                                            ),
                                            Dimens.boxWidth4,
                                            Text(
                                              'Remove',
                                              style: Styles.whiteColorW50010
                                                  .copyWith(
                                                    color: ColorsValue.redColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Padding(
                                    padding: Dimens.edgeInsetsTop05,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Design No. :- ${element.designno}",
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
                                              "${element.price.toStringAsFixed(2)}\$",
                                              style: Styles.txtBlackColorW40014,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () async {
                                        if (element.quantity > 1) {
                                          element.quantity--;
                                        }
                                        controller.update();
                                        final existing = element;
                                        await dbHelper.updateProduct(
                                          existing.copyWith(
                                            quantity: element.quantity,
                                          ),
                                        );
                                        controller.update();
                                      },
                                      // onPressed: controller.decrement(element.quantity),
                                    ),
                                    Text(
                                      '${element.quantity}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () async {
                                        element.quantity++;
                                        controller.update();
                                        final existing = element;
                                        await dbHelper.updateProduct(
                                          existing.copyWith(
                                            quantity: element.quantity,
                                          ),
                                        );
                                        controller.update();
                                      },
                                      // controller.increment(element.quantity),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
          ),
        );
      },
    );
  }
}
