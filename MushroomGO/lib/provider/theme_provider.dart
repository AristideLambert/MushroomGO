import 'package:flutter/material.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode;

  ThemeProvider({required this.themeMode});

  void setTheme(ThemeMode themeMode) {
    if (this.themeMode == themeMode) return;
    this.themeMode = themeMode;
    SettingUtils.setDisplaySharedPreferences(themeMode);
    notifyListeners();
  }
}