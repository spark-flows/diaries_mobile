import 'package:diaries/domain/models/create_concept.dart';
import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_al_styles_model.dart';
import 'package:diaries/domain/models/get_all_categories.dart';
import 'package:diaries/domain/models/get_all_user_model.dart';
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
  }) async => await repository.postcreateConcept(
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

  Future<GetStyleModel?> postGetAllStyle({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
  }) async => await repository.postGetAllStyle(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    status: status,
  );

  Future<GetCategoryModel?> postGetAllCategory({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
  }) async => await repository.postGetAllCategory(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    status: status,
  );

  Future<GetAllUserListModel?> postGetAllUser({
    bool isLoading = false,
    required int page,
    required int limit,
    required String search,
    required String status,
    required String roleid,
    required bool isDeleted,
    required String sortfield,
    required int sortoption,
  }) async => await repository.postGetAllUser(
    isLoading: isLoading,
    page: page,
    limit: limit,
    search: search,
    status: status,
    roleid: roleid,
    isDeleted: isDeleted,
    sortfield: sortfield,
    sortoption: sortoption,
  );
}
