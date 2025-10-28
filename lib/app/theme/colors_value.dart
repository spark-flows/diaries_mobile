// coverage:ignore-file
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  static Color transparent = Colors.transparent;
  static Color appColor = const Color(0xFFD5A976);
  static Color darkAppColor = const Color(0xFFD39752);
  static Color appColorEBBD87 = const Color(0xFFEBBD87);
  static Color lightAppColor = const Color(0xFFD5A976).withAlpha(60);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color blackColor = const Color(0xFF000000);
  static Color appBg = const Color(0xFFFFFFFF);
  static Color redColor = const Color(0xFFD80032);
  static Color txtBlackColor = const Color(0xFF334155);
  static Color txtGreyColor = const Color(0xFF64748B);
  static Color textFieldBg = const Color(0xFFF3F4F6);
  static Color greyColor = const Color(0xFFE2E8F0);
  static Color greyAAA = const Color(0xFFAAAAAA);
  static Color greyD9D9D9 = const Color(0xFFD9D9D9);
  static Color greyCBD5E1 = const Color(0xFFCBD5E1);
  static Color lightOrange = const Color(0xFFFFF3E4);
  static Color lightBlue = const Color(0xFFE0EFFF);
  static Color lightPurpal = const Color(0xFFEFE6FF);
  static Color lightGreen = const Color(0xFFE7F4EF);
  static Color lightRed = const Color(0xFFFFECEA);
  static Color lineColor = const Color(0xFF475569);
  static Color blueColor = const Color(0xFF007BFF);
  static Color purpalColor = const Color(0xFF6F42C1);
  static Color greenColor = const Color(0xFF468F73);
}
