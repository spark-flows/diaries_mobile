import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/repositories/repositories.dart';

class PDevelopmentUseCases {
  PDevelopmentUseCases(this.repository);

  final Repository repository;

  Future<DevelopmentModel?> postGetAllDevelopmentList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async => await repository.postGetAllDevelopmentList(
    isLoading: isLoading,
    page: page,
    limit: limit,
  );
}
