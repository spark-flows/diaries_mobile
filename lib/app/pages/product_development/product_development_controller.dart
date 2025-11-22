import 'dart:convert';

import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/domain/models/getAllDevelopment_model.dart';
import 'package:diaries/domain/models/get_one_concept_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  String? selectDesignerName;
  List<String> designerList = ['Designer 1', 'Designer 2', 'Designer 3'];

  String? selectCategory;
  List<String> categoryList = ['Category 1', 'Category 2', 'Category 3'];

  String? selectStyle;
  List<String> styleList = ['Styles 1', 'Styles 2', 'Styles 3'];

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

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
      print(
        'Print GetOneConcept Data and Also this is For Internal testing Purpose =============>>>>>>>>>>>  $getOneConcept',
      );
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
