import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';

class AuthUsecases {
  AuthUsecases(this.repository);

  final Repository repository;

  Future<AuthModel?> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async => await repository.postLoginApi(
    username: username,
    password: password,
    fcmToken: fcmToken,
    isLoading: isLoading,
  );

  Future<ForgotModel?> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async =>
      await repository.postForgotApi(email: email, isLoading: isLoading);

  Future<ResponseModel?> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async => await repository.postResetApi(
    content: content,
    iv: iv,
    password: password,
    isLoading: isLoading,
  );

  Future<ResponseModel?> postRegisterApi({
    bool isLoading = false,
    required String name,
    required String email,
    required String countrycode,
    required String mobile,
    required String password,
    required String roleid,
  }) async => await repository.postRegisterApi(
    name: name,
    email: email,
    countrycode: countrycode,
    mobile: mobile,
    password: password,
    roleid: roleid,
    isLoading: isLoading,
  );


}
