import 'package:diaries/domain/models/Product_detail_model.dart';
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
}
