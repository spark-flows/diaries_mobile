import 'package:diaries/data/data.dart';
import 'package:diaries/domain/domain.dart';

/// Repositories (retrieve data, heavy processing etc..)
class DataRepository extends DomainRepository {
  /// [connectHelper] : A connection helper which will connect to the
  /// remote to get the data.
  DataRepository(this.connectHelper);

  final ConnectHelper connectHelper;

  @override
  void clearData(dynamic key) {
    throw UnimplementedError();
  }

  /// Delete the box
  @override
  void deleteBox() {
    throw UnimplementedError();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    throw UnimplementedError();
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    throw UnimplementedError();
  }

  /// return bool value
  @override
  bool getBoolValue(String key) => throw UnimplementedError();

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    throw UnimplementedError();
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    throw UnimplementedError();
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    throw UnimplementedError();
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    throw UnimplementedError();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() async => await connectHelper.getIp();

  Future<ResponseModel> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async => await connectHelper.postLoginApi(
    username: username,
    password: password,
    fcmToken: fcmToken,
    isLoading: isLoading,
  );

  Future<ResponseModel> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async =>
      await connectHelper.postForgotApi(email: email, isLoading: isLoading);

  Future<ResponseModel> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async => await connectHelper.postResetApi(
    content: content,
    iv: iv,
    password: password,
    isLoading: true,
  );

  Future<ResponseModel> getProfileApi({bool isLoading = false}) async =>
      await connectHelper.getProfileApi(isLoading: isLoading);

  Future<ResponseModel> postCreateCustomer({
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
  }) async => await connectHelper.postCreateCustomer(
    customerid: customerid,
    name: name,
    mobile: mobile,
    email: email,
    address: address,
    state: state,
    city: city,
    area: area,
    zipcode: zipcode,
    isLoading: true,
  );

  Future<ResponseModel> postRegisterApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String countrycode,
    required String mobile,
    required String password,
    required String roleid,
  }) async => await connectHelper.postRegisterApi(
    name: name,
    email: email,
    countrycode: countrycode,
    mobile: mobile,
    password: password,
    roleid: roleid,
    isLoading: isLoading,
  );

  Future<ResponseModel> postAddToCart({
    bool isLoading = false,
    required String orderId,
    required String customerId,
    required String discount,
    required String total,
    required String status,
    required String userId,
    required String finalAmount,
    required List<ProducModel> products,
  }) async => await connectHelper.postAddToCart(
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

  Future<ResponseModel> postOrderHistoryApi({
    bool isLoading = false,
    required String customerId,
    required int limit,
    required int page,
    required String date,
  }) async => await connectHelper.postOrderHistoryApi(
    customerid: customerId,
    date: date,
    page: page,
    limit: limit,
    isLoading: isLoading,
  );

  Future<ResponseModel> getProductApi({
    bool isLoading = false,
    required String srjobno,
  }) async =>
      await connectHelper.getProductApi(srjobno: srjobno, isLoading: isLoading);
}
