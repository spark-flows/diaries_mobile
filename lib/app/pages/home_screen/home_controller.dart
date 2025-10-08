import 'package:diaries/app/app.dart';
import 'package:diaries/domain/models/Product_detail_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController(this.bottomBarPresenter);

  final HomePresenter bottomBarPresenter;

  int currentIndex = 0;

  ProductDetailData? productDetail;

  Future<void> getProductApi({required String srjobno}) async {
    var response = await bottomBarPresenter.getProductApi(
      isLoading: false,
      srjobno: srjobno,
    );
    productDetail = null;
    if (response?.data != null) {
      productDetail = response?.data;
      if(productDetail != null) {
      RouteManagement.goToScannerDetailScreen(productDetail!);
      }
      Utility.closeLoader();
      update();
    }
    else {
      Utility.closeLoader();
      Utility.errorMessage(response?.message ?? "");
    }
  }
}
