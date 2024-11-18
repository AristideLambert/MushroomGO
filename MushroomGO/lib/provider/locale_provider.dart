import 'package:flutter/material.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';

class LocaleProvider extends ChangeNotifier {
  Locale locale;

  LocaleProvider({required this.locale});

  void setLocale(Locale locale) {
    if (this.locale == locale) return;
    this.locale = locale;
    SettingUtils.setLanguageSharedPreferences(locale);
    notifyListeners();
  }
}