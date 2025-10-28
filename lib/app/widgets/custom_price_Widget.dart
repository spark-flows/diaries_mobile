import 'package:diaries/app/app.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryCard extends StatelessWidget {
  final List<ProductDetailData> jobList;
  final num discountPercent;
  final double pricePerJob;
  final VoidCallback onOrderNow;
  final VoidCallback onDiscountClick;

  const OrderSummaryCard({
    super.key,
    required this.jobList,
    required this.discountPercent,
    required this.pricePerJob,
    required this.onOrderNow,
    required this.onDiscountClick,
  });

  double get totalBeforeDiscount => jobList.length * pricePerJob;

  double get discountAmount => totalBeforeDiscount * (discountPercent / 100);

  double get totalAfterDiscount => totalBeforeDiscount - discountAmount;

  @override
  Widget build(BuildContext context) {
    // controller.discountController.addListener(() {
    //   final discountText = controller.discountController.text;
    //   double discountPercent = double.tryParse(discountText) ?? 0;

    //   discountedPrice = totalPrice - (totalPrice * discountPercent / 100);

    //   controller.update();
    // });

    return GetBuilder<HomeController>(
      initState: (state) {
        final controller = Get.find<HomeController>();
        controller.totalPrice = jobList.fold<double>(
          0,
          (sum, job) => sum + (job.price * job.quantity),
        );
        controller.discountedPrice = controller.totalPrice;
      },
      builder: (controller) {
        controller.totalPrice = jobList.fold<double>(
          0,
          (sum, job) => sum + (job.price * job.quantity),
        );

        double discountPercent =
            double.tryParse(controller.discountController.text) ?? 0;
        controller.discountedPrice =
            controller.totalPrice -
            (controller.totalPrice * discountPercent / 100);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: Dimens.edgeInsets0.copyWith(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: controller.discountController,
                      isTitle: true,
                      title: "Discount (%)",
                      titleStyle: Styles.txtBlackColorW70014,
                      hintText: 'Enter Discount (%)',
                      hintStyle: Styles.txtGreyColorW50012,
                      filled: true,
                      fillColor: ColorsValue.textFieldBg,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Dimens.boxWidth10,
                  Padding(
                    padding: Dimens.edgeInsets0.copyWith(top: 28),
                    child: CustomButton(
                      backgroundColor: ColorsValue.appColor,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        double discountPercent =
                            double.tryParse(
                              controller.discountController.text,
                            ) ??
                            0;
                        controller.discountedPrice =
                            controller.totalPrice -
                            (controller.totalPrice * discountPercent / 100);

                        print(
                          'Total Discounted Price ====>>>>>   ${controller.discountedPrice}',
                        );
                        controller.update();
                      },
                      text: 'Apply',
                      widthBtn: 70,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 3,
              margin: Dimens.edgeInsets12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              child: Padding(
                padding: Dimens.edgeInsets16.copyWith(top: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ExpansionTile(
                      initiallyExpanded: controller.expanded,
                      tilePadding: Dimens.edgeInsets0,
                      childrenPadding: Dimens.edgeInsets0,
                      title: const Text(
                        "Summary",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      trailing: AnimatedRotation(
                        turns: !controller.expanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.expand_more,
                          color: Colors.black54,
                        ),
                      ),
                      onExpansionChanged: (value) {
                        controller.expanded = value;
                        controller.update();
                      },
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Sr.Job",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Price",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Divider(thickness: 1, color: ColorsValue.greyAAA),
                        ...jobList.map((job) {
                          final total = (job.price) * (job.quantity);
                          return Padding(
                            padding: Dimens.edgeInsets0.copyWith(
                              left: 4,
                              right: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(job.srjobno),
                                Text("\$${total.toStringAsFixed(2)}"),
                              ],
                            ),
                          );
                        }).toList(),
                        Dimens.boxHeight10,
                        DottedLine(dashColor: ColorsValue.blackColor),
                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Discount",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text("${discountPercent.toStringAsFixed(0)}%"),
                          ],
                        ),
                        Dimens.boxHeight10,
                        DottedLine(dashColor: ColorsValue.blackColor),
                        Dimens.boxHeight10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "\$${controller.discountedPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Dimens.boxHeight16,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD7A56C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          RouteManagement.goToAddNewCustomerScreen();
                          // controller.postAddToCart(
                          //   discount: controller.discountController.text,
                          //   orderId: '',
                          //   product: List.generate(jobList.length, (index) {
                          //     final total =
                          //         (jobList[index].price) *
                          //         (jobList[index].quantity);
                          //     return ProducModel(
                          //       productId: jobList[index].id,
                          //       qta: jobList[index].quantity,
                          //       total: total.toString(),
                          //     );
                          //   }),
                          //   total: controller.totalPrice.toString(),
                          // );
                        },
                        child: const Text(
                          "Generate Bill",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget buildOrderSummaryCard({
  required List<ProductDetailData> jobList,
  required num discountPercent,
  required double pricePerJob,
  required VoidCallback onOrderNow,
  required VoidCallback onDiscountClick,
}) {
  return OrderSummaryCard(
    jobList: jobList,
    discountPercent: discountPercent,
    pricePerJob: pricePerJob,
    onOrderNow: onOrderNow,
    onDiscountClick: onDiscountClick,
  );
}
