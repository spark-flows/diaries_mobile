import 'package:diaries/app/pages/pages.dart';
import 'package:diaries/domain/domain.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        Get.put(
          AuthPresenter(
            Get.put(AuthUsecases(Get.find()), permanent: true),
            Get.put(CommonUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}
