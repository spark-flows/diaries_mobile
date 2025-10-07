import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) {
        final controller = Get.find<HomeController>();
        final argument = Get.arguments;
        controller.data = [
          {"Design No.": "argument"},
          {"Collection": "Ring"},
          {"Inwardno": "SP479"},
          {"Category": "Necklace"},
          {"Sub Category": "Regular"},
          {"Size": "7 Inch"},
          {"Metal Type": "Gold 14K"},
          {"Metal Color": "Yellow"},
          {"Gross Weight": "10.6"},
          {"Metal Weight": "10.6"},
          {"Purchase Fine": "2.165"},
          {"Sale Fine": "2.165"},
          {"Diam. Ctw": "2.165"},
          {"Diam. Pcs": "2.165"},
          {"Cs Ctw": "2.165"},
          {"Cs Pcs": "2.165"},
          {"Misc Ctw": "2.165"},
          {"Misc Pcs": "2.165"},
          {"Status": "On Hand"},
          {"Invoice No.": "000001"},
          {"Customer": "PY01"},
          {"MRP": "99999.99"},
          {"Location": "INDIA HEAD OFFICE"},
          {"HUID": "0000022"},
          {"Product Type": "Gold Jewelry"},
          {"Certification": "Gold Jewelry"},
        ];
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.whiteColor,
          appBar: AppBar(
            title: Text(
              "Sr.Job :- 1/4536",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                const Divider(height: 1),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.data?.length ?? 0,
                    separatorBuilder:
                        (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final entry = controller.data![index];
                      final key = entry.keys.first;
                      final value = entry.values.first;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                key,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Divider(color: Colors.amber, thickness: 2),
                            Expanded(
                              flex: 5,
                              child: Text(
                                value,
                                textAlign: TextAlign.right,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
