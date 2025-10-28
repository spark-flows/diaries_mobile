import 'package:diaries/app/pages/profile_screen/profile_controller.dart';
import 'package:diaries/app/pages/profile_screen/profile_preneter.dart';
import 'package:diaries/domain/usecases/profile_usecases.dart';
import 'package:get/get.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(
        Get.put(
          ProfilePreneter(
            Get.put(ProfileUsecases(Get.find()), permanent: true),
          ),
        ),
      ),
    );
  }
}
