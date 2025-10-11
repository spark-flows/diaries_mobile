import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';

class HomePresenter {
  HomePresenter(this.bottomBarUsecases);

  final HomeUsecases bottomBarUsecases;

  Future<ProductDetailModel?> getProductApi({
    bool isLoading = false,
    required String srjobno,
  }) async =>
      await bottomBarUsecases.getProductApi(srjobno: srjobno, isLoading: isLoading);

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
  }) async => await bottomBarUsecases.postCreateCustomer(
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
}
