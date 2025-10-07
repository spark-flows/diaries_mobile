// coverage:ignore-file
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:diaries/app/app.dart';
import 'package:diaries/data/data.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../domain/domain.dart';

/// The helper class which will connect to the world to get the data.
class ConnectHelper {
  ConnectHelper() {
    _init();
  }

  late Dio dio;

  /// Api wrapper initialization
  final apiWrapper = ApiWrapper();

  /// Device info plugin initialization
  final deviceinfo = DeviceInfoPlugin();

  /// To get android device info
  AndroidDeviceInfo? androidDeviceInfo;

  /// To get iOS device info
  IosDeviceInfo? iosDeviceInfo;

  // IosDeviceInfo? iosDeviceInfo;

  // coverage:ignore-start
  /// initialize the andorid device information
  void _init() async {
    if (GetPlatform.isAndroid) {
      androidDeviceInfo = await deviceinfo.androidInfo;
    } else {
      iosDeviceInfo = await deviceinfo.iosInfo;
    }
    dio = Dio();
  }

  // coverage:ignore-end

  /// Device id
  String? get deviceId =>
      GetPlatform.isAndroid
          ? androidDeviceInfo?.id
          : iosDeviceInfo?.identifierForVendor;

  /// Device make brand
  String? get deviceMake =>
      GetPlatform.isAndroid ? androidDeviceInfo?.brand : 'Apple';

  /// Device Model
  String? get deviceModel =>
      GetPlatform.isAndroid ? androidDeviceInfo?.model : iosDeviceInfo?.model;

  /// Device is a type of 1 for Android and 2 for iOS
  String get deviceTypeCode => GetPlatform.isAndroid ? '1' : '2';

  /// Device OS
  String get deviceOs => GetPlatform.isAndroid ? 'ANDROID' : 'IOS';

  /// API to get the IP of the user
  Future<String> getIp() async {
    var ip = '';
    if (await Utility.isNetworkAvailable()) {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          ip = addr.address;
        }
      }
      return ip.isNotEmpty ? ip : '0.0.0.0';
    }
    return '0.0.0.0';
  }

  Future<ResponseModel> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    var data = {
      "username": username,
      "password": password,
      // "fcm_token": fcmToken,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postLoginApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> getProductApi({
    bool isLoading = false,
    String? srjobno,
  }) async {
    var response = await apiWrapper.makeRequest(
      '${EndPoints.getScan}?srjobno=$srjobno',
      Request.get,
      null,
      isLoading,
      Utility.commonHeader(),
    );
    return response;
  }

  Future<ResponseModel> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async {
    var data = {"email": email};
    var response = await apiWrapper.makeRequest(
      EndPoints.postForgotApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async {
    var data = {"content": content, "iv": iv, "password": password};
    var response = await apiWrapper.makeRequest(
      EndPoints.postResetApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }

  Future<ResponseModel> postRegisterApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String countrycode,
    required String mobile,
    required String password,
    required String roleid,
  }) async {
    var data = {
      "name": name,
      "email": email,
      "countrycode": countrycode,
      "mobile": mobile,
      "password": password,
      "roleid": roleid,
    };
    var response = await apiWrapper.makeRequest(
      EndPoints.postRegisterApi,
      Request.post,
      data,
      isLoading,
      Utility.commonHeader(isDefaultAuthorizationKeyAdd: false),
    );
    return response;
  }
}
