import 'dart:convert';

import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/domain/models/create_concept.dart';
import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_al_styles_model.dart';
import 'package:diaries/domain/models/get_all_categories.dart';
import 'package:diaries/domain/models/get_all_user_model.dart';
import 'package:diaries/domain/models/get_one_concept_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PDevelopmentController extends GetxController {
  PDevelopmentController(this.pDevelopmentPresenter);

  final PDevelopmentPresenter pDevelopmentPresenter;

  List<HomeModel> productDevelopmentList = [
    HomeModel(
      name: 'Add Concept',
      icon: AssetConstants.add_concept_icon,
      onTap: () => RouteManagement.goToPDevelopmentScreen(),
    ),
    HomeModel(
      name: 'Allocated To Designer',
      icon: AssetConstants.allocate_designer_icon,
      onTap: () => RouteManagement.goToAllocatedDesignerListScreen(),
    ),
    HomeModel(
      name: 'Receive Form Designer',
      icon: AssetConstants.receview_designer_icon,
      onTap: () => RouteManagement.goToReciveDesignerListScreen(),
    ),
  ];

  TextEditingController searchTC = TextEditingController();
  final debouncer = Debouncer(milliseconds: 500);

  List<DevelopmentModelDoc> developmentDocList = [];
  PagingController<int, DevelopmentModelDoc>
  customerDevelopmentPagingController = PagingController(firstPageKey: 1);

  Future<void> postGetAllDevelopmentList(int pageKey) async {
    try {
      final response = await pDevelopmentPresenter.postGetAllDevelopmentList(
        page: pageKey,
        limit: 50,
      );

      customerDevelopmentPagingController.itemList ??= [];
      if (response != null) {
        final newItems = response.data?.docs ?? [];

        final isLastPage = newItems.length < 50;
        if (isLastPage) {
          customerDevelopmentPagingController.appendLastPage(newItems);
        } else {
          customerDevelopmentPagingController.appendPage(newItems, pageKey + 1);
        }
      } else {
        customerDevelopmentPagingController.appendLastPage([]);
      }
    } catch (error) {
      customerDevelopmentPagingController.error = error;
    }
  }

  /// Add Concept Screen
  ///
  GlobalKey<FormState> conceptKey = GlobalKey<FormState>();
  TextEditingController conceptNameTC = TextEditingController();
  TextEditingController conceptNoTC = TextEditingController();
  TextEditingController startDateTc = TextEditingController();
  TextEditingController endDateTC = TextEditingController();
  TextEditingController designerNameTC = TextEditingController();
  TextEditingController categoryTC = TextEditingController();
  TextEditingController gwTC = TextEditingController();
  TextEditingController dwTC = TextEditingController();
  TextEditingController styleTC = TextEditingController();
  TextEditingController noDeignTC = TextEditingController();
  TextEditingController remarkTC = TextEditingController();
  TextEditingController remark2TC = TextEditingController();

  ListModel? selectDesignerName;
  List<ListModel> designerList = [
    ListModel(name: 'Designer 1', nameId: '1'),
    ListModel(name: 'Designer 2', nameId: '2'),
    ListModel(name: 'Designer 3', nameId: '3'),
  ];

  String? selectStatus;
  List<String> statusList = ['Pending', 'Approved', 'Rejected'];

  ListModel? selectCategory;
  List<ListModel> categoryList = [
    ListModel(name: 'Category 1', nameId: '1'),
    ListModel(name: 'Category 2', nameId: '2'),
    ListModel(name: 'Category 3', nameId: '3'),
  ];

  ListModel? selectStyle;
  List<ListModel> styleList = [
    ListModel(name: 'Styles 1', nameId: '1'),
    ListModel(name: 'Styles 2', nameId: '2'),
    ListModel(name: 'Styles 3', nameId: '3'),
  ];

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  List<String> images = [];

  GetOneConceptData? getOneConcept;

  Future<void> postGetOneProduction({required String conceptId}) async {
    var response = await pDevelopmentPresenter.postGetOneProduction(
      conceptid: conceptId,
      isLoading: true,
    );
    getOneConcept = null;
    if (response?.status == 200) {
      if (response?.data != null) {
        getOneConcept = response?.data;
      }
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.message ?? ""));
    }
    update();
  }

  CreateConceptModelData? crteateConceptModel;

  // Future<void> postcreateConcept({required String conceptId}) async {
  //   String sDate = startDate.toIso8601String();
  //   String eDate = endDate.toIso8601String();
  //   var response = await pDevelopmentPresenter.postcreateConcept(
  //     isLoading: true,
  //     conceptId: conceptId,
  //     name: conceptNameTC.text,
  //     conceptNo: conceptNoTC.text,
  //     startDate: sDate,
  //     endDate: eDate,
  //     designer: selectDesignerName?.nameId ?? '',
  //     designNo: noDeignTC.text,
  //     status: 'Pending',
  //     remark1: remarkTC.text,
  //     category: selectCategory?.nameId ?? '',
  //     style: selectStyle?.nameId ?? "",
  //     noDesignMade: noDeignTC.text,
  //     goldWt: int.parse(gwTC.text),
  //     diamondWt: int.parse(dwTC.text),
  //     images: images,
  //   );
  //   crteateConceptModel = null;
  //   if (response?.status == 200) {
  //     if (response?.data != null) {
  //       crteateConceptModel = response?.data;
  //     }
  //     update();
  //   } else {
  //     print('This is The Message ${response?.message}');
  //     Utility.snacBar(
  //       jsonDecode(response?.message ?? ""),
  //       ColorsValue.appColor,
  //     );
  //   }
  //   update();
  // }

  Future<void> postcreateConcept({required String conceptId}) async {
    String sDate = startDate.toIso8601String();
    String eDate = endDate.toIso8601String();

    Map<String, dynamic> requestBody = {"conceptId": conceptId};

    if (conceptId.isEmpty) {
      requestBody.addAll({
        "name": conceptNameTC.text,
        "conceptNo": conceptNoTC.text,
        "startDate": sDate,
        "endDate": eDate,
        "designer": selectDesignerName?.nameId ?? "",
        "designNo": noDeignTC.text,
        "status": "Pending",
        "remark1": remarkTC.text,
        "category": selectCategory?.nameId ?? "",
        "style": selectStyle?.nameId ?? "",
        "noDesignMade": noDeignTC.text,
        "goldWt": int.parse(gwTC.text),
        "diamondWt": int.parse(dwTC.text),
        "images": images,
      });
    } else {
      requestBody.addAll({
        "images": images,
        "noDesignMade": noDeignTC.text,
        "status": "Pending",
      });
    }
    var response = await pDevelopmentPresenter.postcreateConcept(
      isLoading: true,
      conceptId: conceptId,
      name: requestBody['name'],
      conceptNo: requestBody['conceptNo'],
      startDate: requestBody['startDate'],
      endDate: requestBody['endDate'],
      designer: requestBody['designer'],
      designNo: requestBody['designNo'],
      status: requestBody['status'],
      remark1: requestBody['remark1'],
      category: requestBody['category'],
      style: requestBody['style'],
      noDesignMade: requestBody['noDesignMade'],
      goldWt: requestBody['goldWt'],
      diamondWt: requestBody['diamondWt'],
      images: requestBody['images'],
    );
    crteateConceptModel = null;
    if (response?.status == 200) {
      if (response?.data != null) {
        crteateConceptModel = response?.data;
      }
      update();
    } else {
      try {
        final msg =
            jsonDecode(response?.message ?? "")["Message"] ??
            "Something went wrong";
        Utility.snacBar(msg, ColorsValue.appColor);
      } catch (e) {
        Utility.snacBar("Invalid API response", ColorsValue.appColor);
      }
    }

    update();
  }

  GetStyleModel? styleModel;

  Future<void> postGetAllStyle({required String status}) async {
    var response = await pDevelopmentPresenter.postGetAllStyle(
      isLoading: true,
      page: 1,
      limit: 50,
      search: '',
      status: status,
    );
    styleList.clear();
    styleModel = null;
    if (response?.status == 200) {
      if (response?.data != null) {
        styleList =
            response?.data?.docs!
                .map((e) => ListModel(name: e.name ?? '', nameId: e.id ?? ''))
                .toList() ??
            [];
      }
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.message ?? ""));
    }
    update();
  }

  GetCategoryModel? categoryModel;

  Future<void> postGetAllCategory({required String status}) async {
    var response = await pDevelopmentPresenter.postGetAllCategory(
      isLoading: true,
      page: 1,
      limit: 50,
      search: '',
      status: status,
    );
    categoryList.clear();
    categoryModel = null;
    if (response?.status == 200) {
      if (response?.data != null) {
        categoryList =
            response?.data?.docs!
                .map((e) => ListModel(name: e.name ?? '', nameId: e.id ?? ''))
                .toList() ??
            [];
      }
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.message ?? ""));
    }
    update();
  }

  GetAllUserListData? getAllUserListModel;

  Future<void> postGetAllUser() async {
    var response = await pDevelopmentPresenter.postGetAllUser(
      isLoading: true,
      page: 1,
      limit: 50,
      search: '',
      status: '',
      roleid: '',
      isDeleted: false,
      sortfield: 'name',
      sortoption: 1,
    );
    getAllUserListModel = null;
    designerList.clear();
    if (response?.status == 200) {
      if (response?.data != null) {
        getAllUserListModel = response?.data;
        final filteredDesigners =
            response?.data?.docs
                ?.where(
                  (user) => (user.rolename ?? "").toLowerCase() == "designer",
                )
                .toList() ??
            [];
        designerList =
            filteredDesigners
                .map(
                  (user) =>
                      ListModel(name: user.name ?? '', nameId: user.id ?? ''),
                )
                .toList();
      }
      update();
    } else {
      Utility.errorMessage(jsonDecode(response?.message ?? ""));
    }
    update();
  }

  Color getStatusColor(String? status) {
    switch (status.toString().toLowerCase()) {
      case 'delivered':
        return const Color(0xFF468F73);
      case 'pending':
        return const Color(0xFFEBBD87);
      case 'cancel':
        return const Color(0xFFD80032);
      case 'processing':
        return const Color(0xFF6F42C1);
      default:
        return Colors.grey;
    }
  }
}

class ListModel {
  final String name;
  final String nameId;

  ListModel({required this.name, required this.nameId});
}
