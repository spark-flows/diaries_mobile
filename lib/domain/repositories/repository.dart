import 'dart:async';
import 'dart:convert';

import 'package:diaries/data/data.dart';
import 'package:diaries/device/device.dart';
import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/cart_product_add_model.dart';
import 'package:diaries/domain/models/create_concept.dart';
import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_al_styles_model.dart';
import 'package:diaries/domain/models/get_all_categories.dart';
import 'package:diaries/domain/models/get_all_user_model.dart';
import 'package:diaries/domain/models/get_one_concept_model.dart';
import 'package:diaries/domain/models/orderHistory_model.dart';
import 'package:diaries/domain/models/pdf_genrate_model.dart';
import 'package:diaries/domain/models/profile_model.dart';
import 'package:flutter/material.dart';

import '../../app/app.dart';

/// The main repository which will get the data from [DeviceRepository] or the
/// [DataRepository].
class Repository {
  /// [_deviceRepository] : the local repository.
  /// [_dataRepository] : the data repository like api and all.
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  /// Clear data from local storage for [key].
  void clearData(dynamic key) {
    try {
      _deviceRepository.clearData(key);
    } catch (_) {
      _dataRepository.clearData(key);
    }
  }

  /// Get the string value for the [key].
  ///
  /// [key] : The key whose value is needed.
  String getStringValue(String key) {
    try {
      return _deviceRepository.getStringValue(key);
    } catch (_) {
      return _dataRepository.getStringValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveValue(dynamic key, dynamic value) {
    try {
      _deviceRepository.saveValue(key, value);
    } catch (_) {
      _dataRepository.saveValue(key, value);
    }
  }

  /// Get the bool value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getBoolValue(String key) {
    try {
      return _deviceRepository.getBoolValue(key);
    } catch (_) {
      return _dataRepository.getBoolValue(key);
    }
  }

  /// Get the stored value for the [key].
  ///
  /// [key] : The key whose value is needed.
  bool getStoredValue(String key) {
    try {
      return _deviceRepository.getBoolValue(key);
    } catch (_) {
      return _dataRepository.getBoolValue(key);
    }
  }

  /// Get the secure value for the [key].
  /// [key] : The key whose value is needed.
  Future<String> getSecureValue(String key) async {
    try {
      return await _deviceRepository.getSecuredValue(key);
    } catch (_) {
      return await _dataRepository.getSecuredValue(key);
    }
  }

  /// Save the value to the string.
  ///
  /// [key] : The key to which [value] will be saved.
  /// [value] : The value which needs to be saved.
  void saveSecureValue(String key, String value) {
    try {
      _deviceRepository.saveValueSecurely(key, value);
    } catch (_) {
      _dataRepository.saveValueSecurely(key, value);
    }
  }

  /// Clear data from secure storage for [key].
  void deleteSecuredValue(String key) {
    try {
      _deviceRepository.deleteSecuredValue(key);
    } catch (_) {
      _dataRepository.deleteSecuredValue(key);
    }
  }

  /// Clear all data from secure storage .
  void deleteAllSecuredValues() {
    try {
      _deviceRepository.deleteAllSecuredValues();
    } catch (_) {
      _dataRepository.deleteAllSecuredValues();
    }
  }

  Future<ResponseModel?> postRegisterApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String countrycode,
    required String mobile,
    required String password,
    required String roleid,
  }) async {
    try {
      var response = await _dataRepository.postRegisterApi(
        name: name,
        email: email,
        countrycode: countrycode,
        mobile: mobile,
        password: password,
        roleid: roleid,
        isLoading: isLoading,
      );

      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ProfileModel?> getProfileApi({bool isLoading = false}) async {
    try {
      var response = await _dataRepository.getProfileApi(isLoading: isLoading);
      var productListModel = profileModelFromJson(response.data);
      if (productListModel.data != null) {
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetPdfModel?> getPdfApi({
    bool isLoading = false,
    required String customerId,
    required String orderId,
  }) async {
    try {
      var response = await _dataRepository.getPdfApi(
        isLoading: isLoading,
        customerId: customerId,
        orderId: orderId,
      );
      var getPDFModel = getPdfModelFromJson(response.data);
      if (getPDFModel.data != null) {
        return getPDFModel;
      } else {
        return getPDFModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ProductDetailModel?> getProductApi({
    bool isLoading = false,
    required String srjobno,
  }) async {
    try {
      var response = await _dataRepository.getProductApi(
        isLoading: isLoading,
        srjobno: srjobno,
      );
      var productDetailModel = productDetailModelFromJson(response.data);
      productDetailModel.data.quantity = 1;
      return productDetailModel;
    } catch (_, e) {
      Utility.closeDialog();
      Utility.snacBar(e.toString(), Colors.deepOrange);
      return null;
    }
  }

  Future<ForgotModel?> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async {
    try {
      var response = await _dataRepository.postForgotApi(
        email: email,
        isLoading: isLoading,
      );
      var productListModel = forgotModelFromJson(response.data);
      if (productListModel.data != null) {
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<ResponseModel?> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async {
    try {
      var response = await _dataRepository.postResetApi(
        content: content,
        iv: iv,
        password: password,
        isLoading: isLoading,
      );
      return response;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CartProductUpdate?> postAddToCart({
    bool isLoading = false,
    required String orderId,
    required String customerId,
    required String discount,
    required String total,
    required String status,
    required String userId,
    required String finalAmount,
    required List<ProducModel> products,
  }) async {
    try {
      var response = await _dataRepository.postAddToCart(
        customerId: customerId,
        discount: discount,
        orderId: orderId,
        finalAmount: finalAmount,
        userId: userId,
        products: products,
        status: status,
        total: total,
        isLoading: isLoading,
      );
      var cartProductModel = cartProductUpdateFromJson(response.data);
      return cartProductModel;
    } catch (e) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetStyleModel?> postGetAllStyle({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
  }) async {
    try {
      var response = await _dataRepository.postGetAllStyle(
        page: page,
        limit: limit,
        search: search,
        status: status,
        isLoading: isLoading,
      );
      var getAllStyleModel = getStyleModelFromJson(response.data);
      return getAllStyleModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetCategoryModel?> postGetAllCategory({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
  }) async {
    try {
      var response = await _dataRepository.postGetAllCategory(
        page: page,
        limit: limit,
        search: search,
        status: status,
        isLoading: isLoading,
      );
      var getAllCategoryModel = getCategoryModelFromJson(response.data);
      return getAllCategoryModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetAllUserListModel?> postGetAllUser({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
    required String roleid,
    required bool isDeleted,
    required String sortfield,
    required int sortoption,
  }) async {
    try {
      var response = await _dataRepository.postGetAllUser(
        page: page,
        limit: limit,
        search: search,
        status: status,
        roleid: roleid,
        isDeleted: isDeleted,
        sortfield: sortfield,
        sortoption: sortoption,
        isLoading: isLoading,
      );
      var getAllUserListModel = getAllUserListModelFromJson(response.data);
      return getAllUserListModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CustomerOrderHistory?> postOrderHistoryApi({
    bool isLoading = false,
    required int page,
    required int limit,
    required String customerId,
    required String search,
    required String date,
  }) async {
    try {
      var response = await _dataRepository.postOrderHistoryApi(
        page: page,
        limit: limit,
        search: search,
        customerId: customerId,
        date: date,
        isLoading: isLoading,
      );
      var customerOrderHistory = customerOrderHistoryFromJson(response.data);
      return customerOrderHistory;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<DevelopmentModel?> postGetAllDevelopmentList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async {
    try {
      var response = await _dataRepository.postGetAllDevelopmentList(
        page: page,
        limit: limit,
        isLoading: isLoading,
      );
      var developmentModel = developmentModelFromJson(response.data);
      return developmentModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<GetOneConcept?> postGetOneProduction({
    bool isLoading = false,
    required String conceptid,
  }) async {
    try {
      var response = await _dataRepository.postGetOneProduction(
        conceptid: conceptid,
        isLoading: isLoading,
      );
      var getOneConceptModel = getOneConceptFromJson(response.data);
      return getOneConceptModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<CreateConceptModel?> postcreateConcept({
    bool isLoading = false,
    required String conceptId,
    required String name,
    required String conceptNo,
    required String startDate,
    required String endDate,
    required String designer,
    required String designNo,
    required String status,
    required String remark1,
    required String category,
    required String style,
    required String noDesignMade,
    required int goldWt,
    required int diamondWt,
    required List<String> images,
  }) async {
    try {
      var response = await _dataRepository.createConcept(
        isLoading: isLoading,
        conceptId: conceptNo,
        name: name,
        conceptNo: conceptNo,
        startDate: startDate,
        endDate: endDate,
        designer: designer,
        designNo: designNo,
        status: status,
        remark1: remark1,
        category: category,
        style: style,
        noDesignMade: noDesignMade,
        goldWt: goldWt,
        diamondWt: diamondWt,
        images: images,
      );
      final msg = jsonDecode(response.data)["Message"] ?? "";
      if (response.statusCode == 400) {
        Utility.snacBar(msg, ColorsValue.appColor);
      }
      var createConceptModel = createConceptModelFromJson(response.data);
      return createConceptModel;
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<PostCreateUser?> postCreateCustomer({
    bool isLoading = false,
    required String customerid,
    required String name,
    required String mobile,
    required String email,
    required String address,
    required String state,
    required String city,
    required String area,
    required String zipcode,
  }) async {
    try {
      var response = await _dataRepository.postCreateCustomer(
        customerid: customerid,
        name: name,
        mobile: mobile,
        email: email,
        address: address,
        state: state,
        city: city,
        area: area,
        zipcode: zipcode,
        isLoading: isLoading,
      );
      var postCreateUserModel = postCreateUserFromJson(response.data);
      return postCreateUserModel;
    } catch (e) {
      print('Tjhis is The Error >>>>>>>>>>>>>>>>>>>>>>>>>>> $e');
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }

  Future<AuthModel?> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    try {
      var response = await _dataRepository.postLoginApi(
        username: username,
        password: password,
        fcmToken: fcmToken,
        isLoading: isLoading,
      );
      var productListModel = authModelFromJson(response.data);
      if (productListModel.data != null) {
        saveValue(
          LocalKeys.authToken,
          productListModel.data?.accessToken ?? "",
        );
        // Get.find<Repository>().saveSecureValue( LocalKeys.authToken,
        //   productListModel.data?.accessToken ?? "",);
        return productListModel;
      } else {
        return productListModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
      return null;
    }
  }
}
