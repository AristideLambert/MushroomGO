import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/screen/page/setting/setting_page.dart';

class NavigationConstant{
  // Page
  static const String mainPage = "/";
  static const String settingPage = "/SettingPage";
  
  // Route
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case mainPage:
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
      case settingPage:
        return MaterialPageRoute(builder: (context) => const SettingPage(), settings: settings);
      default :
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
    }
  }
}