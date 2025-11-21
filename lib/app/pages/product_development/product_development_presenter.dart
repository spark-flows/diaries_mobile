import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_one_concept_model.dart';
import 'package:diaries/domain/usecases/pDevelopment_usercases.dart';

class PDevelopmentPresenter {
  PDevelopmentPresenter(this.pDevelopmentUseCases);

  final PDevelopmentUseCases pDevelopmentUseCases;

  Future<DevelopmentModel?> postGetAllDevelopmentList({
    bool isLoading = false,
    required int page,
    required int limit,
  }) async => await pDevelopmentUseCases.postGetAllDevelopmentList(
    isLoading: isLoading,
    page: page,
    limit: limit,
  );

  Future<GetOneConcept?> postGetOneProduction({
    bool isLoading = false,
    required String conceptid,
  }) async => await pDevelopmentUseCases.postGetOneProduction(
    conceptid: conceptid,
    isLoading: isLoading,
  );
}
