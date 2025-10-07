import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/models.dart';
import 'package:diaries/domain/usecases/usecases.dart';

class AuthPresenter {
  AuthPresenter(this.authUsecases, this.commonUsecases);

  AuthUsecases authUsecases;
  final CommonUsecases commonUsecases;

  Future<AuthModel?> postLoginApi({
    bool isLoading = false,
    required String username,
    required String password,
    required String fcmToken,
  }) async => await authUsecases.postLoginApi(
    username: username,
    password: password,
    fcmToken: fcmToken,
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
  }) async => await authUsecases.postRegisterApi(
    name: name,
    email: email,
    countrycode: countrycode,
    mobile: mobile,
    password: password,
    roleid: roleid,
    isLoading: isLoading,
  );
  Future<ForgotModel?> postForgotApi({
    bool isLoading = false,
    required String email,
  }) async =>
      await authUsecases.postForgotApi(email: email, isLoading: isLoading);

  Future<ResponseModel?> postResetApi({
    bool isLoading = false,
    required String content,
    required String iv,
    required String password,
  }) async => await authUsecases.postResetApi(
    content: content,
    iv: iv,
    password: password,
    isLoading: isLoading,
  );
}
