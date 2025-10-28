import 'package:diaries/app/app.dart';
import 'package:diaries/data/helpers/connect_helper.dart';
import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/orderHistory_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  List<HomeModel> homeList = [
    HomeModel(
      name: 'Trannsict',
      icon: AssetConstants.trannsict_icon,
      onTap: () => RouteManagement.goToHomeScreen(),
    ),
    HomeModel(
      name: 'Order',
      icon: AssetConstants.order_history_icon,
      onTap: () => RouteManagement.goToOrderHistoryScreen(),
    ),
  ];

  int currentIndex = 0;

  ProductDetailData? productDetail;

  double discountedPrice = 0;
  double totalPrice = 0;

  List<ProductDetailData> localProductList = [];

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

      await postAddToCart(
        customerId: customerId,
        finalAmount: totalPrice.toString(),
        userId: '',
        discount: discountController.text,
        orderId: '',
        product: List.generate(localProductList.length, (index) {
          final total =
              (localProductList[index].price) *
              (localProductList[index].quantity);
          return ProducModel(
            productId: localProductList[index].id,
            qta: localProductList[index].quantity,
            total: total.toString(),
          );
        }),
        total: totalPrice.toString(),
      );

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
    required String customerId,
    required String userId,
    required String finalAmount,
  }) async {
    var response = await bottomBarPresenter.postAddToCart(
      isLoading: false,
      customerId: customerId,
      userId: userId,
      finalAmount: total,
      discount: discount,
      // (discount != null || discount.isNotEmpty) ? '$discount' : discount,
      orderId: orderId,
      products: product,
      status: 'Pending',
      total: total,
    );
    if (response?.data != null) {
      Utility.snacBar('OrderSuccessFull', ColorsValue.appColor);
      localProductList.clear();
      discountedPrice = 0;
      totalPrice = 0;
      discountController.text = '0';
      Get.find<Repository>().clearData(customerId);
      RouteManagement.goToHomeScreen();
      Utility.closeLoader();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }

  List<CustomerOrderHistoryDoc> orderHistoryDocList = [];
  PagingController<int, CustomerOrderHistoryDoc>
  customerOrderHistoryPagingController = PagingController(firstPageKey: 1);

  // Future<void> postOrderHistoryApi(pageKey, {required String date}) async {
  //   var response = await bottomBarPresenter.postOrderHistoryApi(
  //     page: pageKey,
  //     limit: 50,
  //     customerId: customerId,
  //     date: date,
  //   );
  //   if (response?.data != null) {
  //     if (pageKey == 1) {
  //       orderHistoryDocList.clear();
  //     }
  //     orderHistoryDocList = response?.data ?? [];

  //     final isLastPage = orderHistoryDocList.length < 10;
  //     if (isLastPage) {
  //       customerOrderHistoryPagingController.appendLastPage(
  //         orderHistoryDocList,
  //       );
  //     } else {
  //       var nextPageKey = pageKey + 1;
  //       customerOrderHistoryPagingController.appendPage(
  //         orderHistoryDocList,
  //         nextPageKey,
  //       );
  //     }
  //     update();
  //   } else {
  //     Utility.closeLoader();
  //     Utility.errorMessage(response?.message ?? "");
  //   }
  // }

  Future<void> postOrderHistoryApi(int pageKey, {required String date}) async {
    try {
      // Call API
      final response = await bottomBarPresenter.postOrderHistoryApi(
        page: pageKey,
        limit: 50,
        customerId: customerId,
        date: date,
      );

      // Check if data is valid
      if (response != null && response.data.isNotEmpty) {
        final newItems = response.data;

        final isLastPage = newItems.length < 10;
        if (isLastPage) {
          customerOrderHistoryPagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + 1;
          customerOrderHistoryPagingController.appendPage(
            newItems,
            nextPageKey,
          );
        }

        update();
      } else {
        // No data or empty list
        customerOrderHistoryPagingController.appendLastPage([]);
        Utility.errorMessage(response?.message ?? "No order history found");
      }
    } catch (error) {
      Utility.closeLoader();
      customerOrderHistoryPagingController.error = error;
      Utility.errorMessage("Failed to fetch order history: $error");
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
  TextEditingController discountController = TextEditingController(text: '0');

  bool expanded = false;
}

class HomeModel {
  String? name;
  String? icon;
  void Function()? onTap;

  HomeModel({this.name, this.icon, this.onTap});
}
