import 'package:diaries/app/app.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        ProductDetailData element = Get.arguments;
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBar(
            title: Text(
              "Sr.Job :- ${element.srjobno}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 0),
                child: _productDetail(productData: element),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _productDetail({required ProductDetailData productData}) {
    return Table(
      border: TableBorder.all(width: 1),
      children: [
        _tableRow(
          title: "Design No:",
          value: productData.designno,
          isFirst: true,
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Metal Type",
          value: productData.metaltype,
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Metal Color",
          value: productData.metalcolor,
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Gross Weight",
          value: '${productData.gWt}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Metal Weight",
          value: '${productData.metalweight}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Diam. Ctw",
          value: '${productData.dCt}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Diam. Pcs",
          value: '${productData.diamondpcs}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Cs Ctw",
          value: '${productData.csct}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Cs Pcs",
          value: '${productData.cspcs}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Misc Ctw",
          value: '${productData.miscct}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Misc Pcs",
          value: '${productData.miscpcs}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Status",
          value: productData.status,
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "MRP",
          value: '\$ ${productData.price.toStringAsFixed(2)}',
          valueColor: ColorsValue.whiteColor,
        ),
        _tableRow(
          title: "Product Type",
          value: productData.producttype,
          valueColor: ColorsValue.whiteColor,
          isLast: true,
        ),
      ],
    );
  }

  TableRow _tableRow({
    required String title,
    required String value,
    bool isLast = false,
    bool isFirst = false,
    Color color = Colors.white,
    Color valueColor = Colors.white,
    double borderRadius = 10,
  }) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius:
            isLast
                ? BorderRadius.only(
                  bottomRight: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                )
                : isFirst
                ? BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                )
                : null,
        gradient: LinearGradient(
          colors: [Colors.white, color],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Styles.appColorW50016.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: Styles.appColorW50016.copyWith(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
