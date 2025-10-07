// coverage:ignore-file

import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationsFile extends Translations {
  /// List of locales used in the application
  static const listOfLocales = <Locale>[Locale('en')];

  @override
  Map<String, Map<String, String>> get keys => {
    'en': {'appName': StringConstants.appName, 'hi': 'Hi, '},
  };
}
