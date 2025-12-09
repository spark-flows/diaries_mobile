import 'dart:async';

import 'package:diaries/app/app.dart';
import 'package:diaries/data/helpers/connect_helper.dart';
import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/orderHistory_model.dart';
import 'package:diaries/domain/models/pdf_genrate_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  final debouncer = Debouncer(milliseconds: 500);

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
    HomeModel(
      name: 'PD',
      icon: AssetConstants.pd_main_icon,
      onTap: () => RouteManagement.goToMainProductDevelopmentScreen(),
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

      final finalAmount = localProductList.fold<double>(
        0,
            (sum, job) => sum + (job.price * job.quantity),
      );

      await postAddToCart(
        customerId: customerId,
        finalAmount: finalAmount.toString(),
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
      RouteManagement.goToViewPDFScreen(
        customerId: response?.data.customerid ?? '',
        orderId: response?.data.orderid ?? '',
      );
      Get.find<Repository>().clearData(customerId);
      // RouteManagement.goToHomeScreen();
      Utility.closeLoader();
      update();
    } else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }

  GetPdfModelData? pdfModel;

  Future<void> getPDFApi({
    required String customerId,
    required String orderId,
  }) async {
    var response = await bottomBarPresenter.getPdfApi(
      isLoading: false,
      customerId: customerId,
      orderId: orderId,
    );
    pdfModel = null;
    if (response?.data != null) {
      pdfModel = response?.data;
      update();
    }
  }

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  List<CustomerOrderHistoryDoc> orderHistoryDocList = [];
  PagingController<int, CustomerOrderHistoryDoc>
  customerOrderHistoryPagingController = PagingController(firstPageKey: 1);

  TextEditingController searchTextController = TextEditingController();

  Future<void> postOrderHistoryApi(int pageKey) async {
    String formattedDate = selectedDay?.toIso8601String() ?? "";
    try {
      final response = await bottomBarPresenter.postOrderHistoryApi(
        page: pageKey,
        limit: 50,
        customerId: customerId,
        date: formattedDate,
        search: searchTextController.text,
      );

      customerOrderHistoryPagingController.itemList ??= [];
      if (response != null) {
        final newItems = response.data.docs;

        final isLastPage = newItems.length < 50;
        if (isLastPage) {
          customerOrderHistoryPagingController.appendLastPage(newItems);
        } else {
          customerOrderHistoryPagingController.appendPage(
            newItems,
            pageKey + 1,
          );
        }
      } else {
        customerOrderHistoryPagingController.appendLastPage([]);
      }
    } catch (error) {
      customerOrderHistoryPagingController.error = error;
    }
  }

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

  /// =========================== view PDF Screen =========================== ///

  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  bool isLoading = true;
  bool hasError = false;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    adressController.dispose();
    stateController.dispose();
    cityController.dispose();
    areaController.dispose();
    zipCodeController.dispose();
    discountController.dispose();
    super.dispose();
  }
}

class HomeModel {
  String? name;
  String? icon;
  void Function()? onTap;

  HomeModel({this.name, this.icon, this.onTap});
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
