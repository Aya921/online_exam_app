import 'package:exam_app/core/constant/translation_constants/translation_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  SharedPreferences sharedPreferences;
  AppConfigProvider(this.sharedPreferences);
  

  String slelectedlocale = TranslationConstants.enLocaleKey;

  bool isEn() => slelectedlocale == TranslationConstants.enLocaleKey;

  Future<void> changeLocale(String locale) async {
    if (locale == slelectedlocale) return;
    slelectedlocale = locale;
    await sharedPreferences.setString(TranslationConstants.localeKey, locale);
    notifyListeners();
  }

  Future<void> setSlectedLocale() async {
    final slelected =
        sharedPreferences.getString(TranslationConstants.localeKey) ??
        TranslationConstants.enLocaleKey;

    slelectedlocale = slelected;
    notifyListeners();
  }
}
