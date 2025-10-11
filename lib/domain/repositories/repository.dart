import 'dart:async';

import 'package:diaries/data/data.dart';
import 'package:diaries/device/device.dart';
import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';

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
      if (productDetailModel.data != null) {
        return productDetailModel;
      } else {
        return productDetailModel;
      }
    } catch (_) {
      Utility.closeDialog();
      UnimplementedError();
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
      if (postCreateUserModel.data != null) {
        return postCreateUserModel;
      } else {
        return postCreateUserModel;
      }
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
