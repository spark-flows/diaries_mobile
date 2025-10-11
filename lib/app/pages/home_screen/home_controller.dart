import 'package:diaries/app/app.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  int currentIndex = 0;

  ProductDetailData? productDetail;

  List<ProductDetailData> localProductList = [];

  // void increment() {
  //   productDetail?.quatity++;
  //   update();
  // }

  // void decrement() {
  //   if (productDetail!.quatity > 1) {
  //     productDetail?.quatity--;
  //   }
  //   update();
  // }

  Future<void> getProductApi({required String srjobno}) async {
    var response = await bottomBarPresenter.getProductApi(
      isLoading: false,
      srjobno: srjobno,
    );
    productDetail = null;
    if (response?.data != null) {
      productDetail = response?.data;
      if (productDetail != null) {
        RouteManagement.goToScannerDetailScreen(productDetail!);
      }
      Utility.closeLoader();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }

  PostCreateUserData? userData;

  Future<void> postCreateCustomer({
    required String area,
    required String address,
    required String city,
    required String email,
    required String mobile,
    required String name,
    required String state,
    required String zipCode,
  }) async {
    var response = await bottomBarPresenter.postCreateCustomer(
      isLoading: false,
      address: address,
      city: city,
      customerid: '',
      email: email,
      mobile: mobile,
      name: name,
      state: state,
      zipcode: zipCode,
      area: area,
    );
    userData = null;
    if (response?.data != null) {
      userData = response?.data;
      if (userData != null) {
        print(userData);
      }
      Utility.closeLoader();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }

  //// Add new Customer Detail

  GlobalKey<FormState> salesKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  bool expanded = false;
}
