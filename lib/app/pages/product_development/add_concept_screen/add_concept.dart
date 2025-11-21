import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/app/widgets/custom_upload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddConceptScreen extends StatelessWidget {
  const AddConceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PDevelopmentController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Add Consept",
            isCenter: true,
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: CustomButton(
              onPressed: () {
                // controller.postCreateCustomer(
                //   area: controller.areaController.text,
                //   address: controller.adressController.text,
                //   city: controller.cityController.text,
                //   email: controller.emailController.text,
                //   mobile: controller.mobileController.text,
                //   name: controller.nameController.text,
                //   state: controller.stateController.text,
                //   zipCode: controller.zipCodeController.text,
                // );
              },
              text: "Save",
              textStyle: Styles.whiteColorW60016,
              backgroundColor: ColorsValue.appColor,
              heightBtn: Dimens.fifty,
              radius: Dimens.zero,
            ),
          ),
          body: Form(
            key: controller.conceptKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: Dimens.edgeInsets20_10_20_20,
              physics: ClampingScrollPhysics(),
              children: [
                CustomTextFormField(
                  controller: controller.conceptNameTC,
                  isTitle: true,
                  title: "Concept Name",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Concept Name',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.conceptNoTC,
                  isTitle: true,
                  title: "Concept No.",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Concept No.',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.startDateTc,
                  isTitle: true,
                  readOnly: true,
                  titleStyle: Styles.txtBlackColorW70014.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                  ),
                  hintStyle: Styles.txtGreyColorW50012.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.eighteen : Dimens.twelve,
                  ),
                  hintText: 'Enter Start Date',
                  title: 'Start Date',
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  suffixIcon: Padding(
                    padding: Dimens.edgeInsets8,
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: controller.startDate,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (picked != null && picked != controller.startDate) {
                          controller.startDate = picked;
                          controller.startDateTc.text = DateFormat(
                            "yyyy-MM-dd",
                          ).format(controller.startDate);
                          controller.update();
                        }
                      },
                      child: Padding(
                        padding: Dimens.edgeInsets4,
                        child: SvgPicture.asset(AssetConstants.calender_icon),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Select Start Date'.tr;
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.endDateTC,
                  isTitle: true,
                  readOnly: true,
                  titleStyle: Styles.txtBlackColorW70014.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.twenty : Dimens.fourteen,
                  ),
                  hintStyle: Styles.txtGreyColorW50012.copyWith(
                    fontSize:
                        Utility.isTablet() ? Dimens.eighteen : Dimens.twelve,
                  ),
                  hintText: 'Enter end date',
                  title: 'End Date',
                  fillColor: ColorsValue.textFieldBg,
                  filled: true,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  suffixIcon: Padding(
                    padding: Dimens.edgeInsets8,
                    child: GestureDetector(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: controller.endDate,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2100),
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                        );
                        if (picked != null && picked != controller.endDate) {
                          controller.endDate = picked;
                          controller.endDateTC.text = DateFormat(
                            "yyyy-MM-dd",
                          ).format(controller.endDate);
                          controller.update();
                        }
                      },
                      child: Padding(
                        padding: Dimens.edgeInsets4,
                        child: SvgPicture.asset(AssetConstants.calender_icon),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Select end date';
                    }
                    return null;
                  },
                ),
                Dimens.boxHeight20,
                Text("Designer Name", style: Styles.txtBlackColorW70014),
                Dimens.boxHeight4,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.selectDesignerName,
                    hint: Text('Select Designer Name'),
                    onChanged: (value) {
                      controller.selectDesignerName = value;
                      controller.update();
                    },
                    items:
                        controller.designerList
                            .map(
                              (option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                            )
                            .toList(),
                  ),
                ),
                Dimens.boxHeight20,
                Text("Category Name", style: Styles.txtBlackColorW70014),
                Dimens.boxHeight4,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.selectCategory,
                    hint: Text('Select Category'),
                    onChanged: (value) {
                      controller.selectCategory = value;
                      controller.update();
                    },
                    items:
                        controller.categoryList
                            .map(
                              (option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                            )
                            .toList(),
                  ),
                ),
                Dimens.boxHeight20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.gwTC,
                        isTitle: true,
                        title: "G.W",
                        titleStyle: Styles.txtBlackColorW70014,
                        hintText: 'Enter weight',
                        hintStyle: Styles.txtGreyColorW50012,
                        filled: true,
                        fillColor: ColorsValue.textFieldBg,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Dimens.boxWidth10,
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.dwTC,
                        isTitle: true,
                        title: "D.W",
                        titleStyle: Styles.txtBlackColorW70014,
                        hintText: 'Enter Weight',
                        hintStyle: Styles.txtGreyColorW50012,
                        filled: true,
                        fillColor: ColorsValue.textFieldBg,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Dimens.boxHeight20,
                Text("Style", style: Styles.txtBlackColorW70014),
                Dimens.boxHeight4,
                Container(
                  padding: Dimens.edgeInsets20_00_20_00,
                  height: Utility.isTablet() ? Dimens.sixtyFive : Dimens.fifty,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsValue.textFieldBg,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                  ),
                  child: DropdownButton<String>(
                    underline: Container(),
                    isDense: true,
                    isExpanded: true,
                    value: controller.selectStyle,
                    hint: Text('Select Style'),
                    onChanged: (value) {
                      controller.selectStyle = value;
                      controller.update();
                    },
                    items:
                        controller.styleList
                            .map(
                              (option) => DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                            )
                            .toList(),
                  ),
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.noDeignTC,
                  isTitle: true,
                  title: "No. Of Design",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter No. Of Design',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.remarkTC,
                  isTitle: true,
                  title: "Remark",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Remark',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.remark2TC,
                  isTitle: true,
                  title: "Remark 2",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Remark 2',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                Dimens.boxHeight20,
                Text("Reference Image", style: Styles.txtBlackColorW70014),
                Dimens.boxHeight4,
                UploadCardButton(title: "Upload File".tr),
              ],
            ),
          ),
        );
      },
    );
  }
}
