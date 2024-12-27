import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/page/detail/mushroom_detail_page.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/screen/page/setting/account_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/display_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/language_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/setting_page.dart';
import 'package:mushroom_go/models/mushroom.dart';

class NavigationConstant {
  // Pages
  static const String mainPage = "/";
  static const String settingPage = "/SettingPage";
  static const String accountSettingPage = "/AccountSettingPage";
  static const String displaySettingPage = "/DisplaySettingPage";
  static const String languageSettingPage = "/LanguageSettingPage";
  static const String mushroomDetailPage = "/MushroomDetailPage";

  // Route
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(
            builder: (context) => const MainPage(), settings: settings);
      case settingPage:
        return MaterialPageRoute(
            builder: (context) => SettingPage(mainContext: context),
            settings: settings);
      case accountSettingPage:
        return MaterialPageRoute(
            builder: (context) => const AccountSettingPage(),
            settings: settings);
      case displaySettingPage:
        return MaterialPageRoute(
            builder: (context) => const DisplaySettingPage(),
            settings: settings);
      case languageSettingPage:
        return MaterialPageRoute(
            builder: (context) => const LanguageSettingPage(),
            settings: settings);
      case mushroomDetailPage:
        final mushroom = settings.arguments as Mushroom;
        return MaterialPageRoute(
          builder: (context) => MushroomDetailPage(mushroom: mushroom),
          settings: settings);
      default:
        return MaterialPageRoute(
            builder: (context) => const MainPage(), settings: settings);
    }
  }
}
