import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          appBar: AppBarWidget(
            onTapBack: () {
              Get.back();
            },
            title: "Add Customer",
            isCenter: true,
          ),
          bottomNavigationBar: Padding(
            padding: Dimens.edgeInsets20,
            child: CustomButton(
              onPressed: () {
                controller.postCreateCustomer(
                  area: controller.areaController.text,
                  address: controller.adressController.text,
                  city: controller.cityController.text,
                  email: controller.emailController.text,
                  mobile: controller.mobileController.text,
                  name: controller.nameController.text,
                  state: controller.stateController.text,
                  zipCode: controller.zipCodeController.text,
                );
              },
              text: "Save",
              textStyle: Styles.whiteColorW60016,
              backgroundColor: ColorsValue.appColor,
              heightBtn: Dimens.fifty,
              radius: Dimens.zero,
            ),
          ),
          body: Form(
            key: controller.salesKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              padding: Dimens.edgeInsets20_10_20_20,
              physics: ClampingScrollPhysics(),
              children: [
                CustomTextFormField(
                  controller: controller.nameController,
                  isTitle: true,
                  title: "Customer Name",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Customer Name',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.mobileController,
                  isTitle: true,
                  title: "Mobile Number",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Mobile Number',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.emailController,
                  isTitle: true,
                  title: "Email",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Email',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.adressController,
                  isTitle: true,
                  title: "Address",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Address',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.stateController,
                  isTitle: true,
                  title: "State",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter State',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.cityController,
                  isTitle: true,
                  title: "City",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter City',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.areaController,
                  isTitle: true,
                  title: "Area",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Area',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                ),
                Dimens.boxHeight20,
                CustomTextFormField(
                  controller: controller.zipCodeController,
                  isTitle: true,
                  title: "Zip Code",
                  titleStyle: Styles.txtBlackColorW70014,
                  hintText: 'Enter Zip Code',
                  hintStyle: Styles.txtGreyColorW50012,
                  filled: true,
                  fillColor: ColorsValue.textFieldBg,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
