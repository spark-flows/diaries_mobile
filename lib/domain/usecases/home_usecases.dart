import 'package:diaries/data/data.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/cart_product_add_model.dart';
import 'package:diaries/domain/models/models.dart';
import 'package:diaries/domain/models/orderHistory_model.dart';
import 'package:diaries/domain/repositories/repository.dart';

class HomeUsecases {
  HomeUsecases(this.repository);

  final Repository repository;

  Future<ProductDetailModel?> getProductApi({
    bool isLoading = false,
    required String srjobno,
  }) async =>
      await repository.getProductApi(srjobno: srjobno, isLoading: isLoading);

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
  }) async => await repository.postAddToCart(
    customerId: customerId,
    finalAmount: finalAmount,
    userId: userId,
    discount: discount,
    orderId: orderId,
    products: products,
    status: status,
    total: total,
    isLoading: isLoading,
  );

  Future<CustomerOrderHistory?> postOrderHistoryApi({
    bool isLoading = false,
    required int page,
    required int limit,
    required String customerId,
    required String date,
  }) async => await repository.postOrderHistoryApi(
    isLoading: isLoading,
    page: page,
    limit: limit,
    customerId: customerId,
    date: date,
  );
}
