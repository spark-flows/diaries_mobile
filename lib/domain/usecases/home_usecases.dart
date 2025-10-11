import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/models.dart';
import 'package:diaries/domain/repositories/repository.dart';

class HomeUsecases {
  HomeUsecases(this.repository);

  final Repository repository;

  Future<ProductDetailModel?> getProductApi({
    bool isLoading = false,
    required String srjobno,
  }) async => await repository.getProductApi(
    srjobno: srjobno,
    isLoading: isLoading,
  );

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
  }) async => await repository.postCreateCustomer(
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
