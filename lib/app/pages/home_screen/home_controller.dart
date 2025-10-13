import 'package:diaries/app/app.dart';
import 'package:diaries/data/helpers/connect_helper.dart';
import 'package:diaries/domain/domain.dart';
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

  // increment(int item) {
  //   final existing = productManager.getProducts().first;
  // await productManager.updateProduct(existing.copyWith(price: 3.0));
  //   item++;
  //   update();
  // }

  decrement(int item) {
    if (item > 1) {
      item--;
    }
    update();
  }

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
  String customerId = ''; 

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
      customerId = response?.data.id ?? '';
      RouteManagement.goToCartScreen();
      Utility.closeLoader();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }

  Future<void> postAddToCart({
    required String discount,
    required String orderId,
    required List<ProducModel> product,
    required String total,
  }) async {
    var response = await bottomBarPresenter.postAddToCart(
      isLoading: false,
      customerId: customerId,
      discount: discount,
      orderId: orderId,
      products: product,
      status: 'Pending',
      total: total,
    );
    userData = null;
    if (response?.data != null) {
      Utility.snacBar('OrderSuccessFull', ColorsValue.appColor);
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
  TextEditingController discountController = TextEditingController();

  bool expanded = false;
}
