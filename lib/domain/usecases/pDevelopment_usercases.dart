import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_one_concept_model.dart';
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

  Future<GetOneConcept?> postGetOneProduction({
    bool isLoading = false,
    required String conceptid,
  }) async => await repository.postGetOneProduction(
    conceptid: conceptid,
    isLoading: isLoading,
  );
}
