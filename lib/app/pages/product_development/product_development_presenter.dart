import 'package:diaries/domain/models/create_concept.dart';
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

  Future<CreateConceptModel?> postcreateConcept({
    bool isLoading = false,
    required String conceptId,
    required String name,
    required String conceptNo,
    required String startDate,
    required String endDate,
    required String designer,
    required String designNo,
    required String status,
    required String remark1,
    required String category,
    required String style,
    required String noDesignMade,
    required int goldWt,
    required int diamondWt,
    required List<String> images,
  }) async => await pDevelopmentUseCases.postcreateConcept(
    isLoading: isLoading,
    conceptId: conceptNo,
    name: name,
    conceptNo: conceptNo,
    startDate: startDate,
    endDate: endDate,
    designer: designer,
    designNo: designNo,
    status: status,
    remark1: remark1,
    category: category,
    style: style,
    noDesignMade: noDesignMade,
    goldWt: goldWt,
    diamondWt: diamondWt,
    images: images,
  );
}
