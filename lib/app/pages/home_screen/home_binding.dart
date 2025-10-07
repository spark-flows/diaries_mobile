import 'package:diaries/app/app.dart';
import 'package:diaries/domain/domain.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.put(
          HomePresenter(Get.put(HomeUsecases(Get.find()), permanent: true)),
        ),
      ),
    );
  }
}
