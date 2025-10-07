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
}
