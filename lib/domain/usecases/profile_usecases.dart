import 'package:diaries/domain/models/profile_model.dart';
import 'package:diaries/domain/repositories/repository.dart';

class ProfileUsecases {
  ProfileUsecases(this.repository);

  final Repository repository;

  Future<ProfileModel?> getProfileApi({bool isLoading = false}) async =>
      await repository.getProfileApi(isLoading: isLoading);
}
