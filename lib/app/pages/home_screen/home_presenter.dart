import 'package:diaries/data/helpers/connect_helper.dart';
import 'package:diaries/domain/domain.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:diaries/domain/models/cart_product_add_model.dart';

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

  Future<CartProductUpdate?> postAddToCart({
    bool isLoading = false,
    required String orderId,
    required String customerId,
    required String discount,
    required String total,
    required String status,
    required List<ProducModel> products,
  }) async => bottomBarUsecases.postAddToCart(
    customerId: customerId,
    discount: discount,
    orderId: orderId,
    products: products,
    status: status,
    total: total,
    isLoading: isLoading,
  );
}
