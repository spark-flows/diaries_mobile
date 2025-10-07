import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/pages.dart';
import 'package:diaries/app/theme/dimens.dart';
import 'package:diaries/app/utils/utils.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  int currentIndex = 0;

  final List<Widget> screenList = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.twenty,
      children: [
        Center(
          child: TextButton(
            onPressed: () {
              Utility.showLoader();
              Future.delayed(Duration(seconds: 5), () => Utility.closeLoader());
            },
            child: Text("Home"),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              print(Utility.validatePassword("12345"));
            },
            child: Text("Home"),
          ),
        ),
      ],
    ),
    Center(child: const Text("Dashboard")),
    Center(child: const Text("Setting")),
    Center(child: const Text("Profile")),
  ];

  ProductDetailData? productDetail;

  Future<void> getProductApi({required String srjobno}) async {
    var response = await bottomBarPresenter.getProductApi(
      isLoading: false,
      srjobno: srjobno,
    );
    productDetail = null;
    if (response?.data != null) {
      productDetail = response?.data;
      if(productDetail != null) {
      RouteManagement.goToScannerDetailScreen(productDetail!);
      }
      update();
    }
  }

  List<Map<String, String>>? data;
}
