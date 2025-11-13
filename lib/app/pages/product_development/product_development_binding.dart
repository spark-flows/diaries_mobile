import 'package:diaries/app/pages/pages.dart';
import 'package:diaries/domain/domain.dart';
import 'package:get/get.dart';

// coverage:ignore-file
/// A list of bindings which will be used in the route of [SplashView].
class PDevelopmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PDevelopmentController>(
      () => PDevelopmentController(
        Get.put(
          PDevelopmentPresenter(Get.put(PDevelopmentUseCases(Get.find()), permanent: true)),
        ),
      ),
    );
  }
}
