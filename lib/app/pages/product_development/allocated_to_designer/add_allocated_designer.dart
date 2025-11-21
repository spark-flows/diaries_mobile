import 'package:diaries/app/app.dart';
import 'package:diaries/app/pages/product_development/product_development_page.dart';
import 'package:diaries/app/widgets/custom_upload.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAllocatedScreen extends StatelessWidget {
  const AddAllocatedScreen({super.key});

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
            title: "Add Allocated Designer",
            isCenter: true,
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: CustomButton(
              onPressed: () {},
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
                  title: "No. Of Made Design",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter No. Of Made Design',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                Text("Status", style: Styles.txtBlackColorW70014),
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
                    hint: Text('Select Status'),
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
