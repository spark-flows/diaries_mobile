import 'package:diaries/domain/models/profile_model.dart';
import 'package:diaries/domain/usecases/profile_usecases.dart';

class ProfilePreneter {
  ProfilePreneter(this.profileUsecases);

  final ProfileUsecases profileUsecases;

  Future<ProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await profileUsecases.getProfileApi(isLoading: isLoading);
}
