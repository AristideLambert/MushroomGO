import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/page/account/forgot_password_page.dart';
import 'package:mushroom_go/screen/page/account/login_page.dart';
import 'package:mushroom_go/screen/page/account/registration_page.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/screen/page/setting/account_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/display_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/language_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/setting_page.dart';

class NavigationConstant{
  // Page
  static const String mainPage = "/";
  static const String loginPage = "/LoginPage";
  static const String registrationPage = "/RegistrationPage";
  static const String forgotPasswordPage = "/ForgotPasswordPage";
  static const String settingPage = "/SettingPage";
  static const String accountSettingPage = "/AccountSettingPage";
  static const String displaySettingPage = "/DisplaySettingPage";
  static const String languageSettingPage = "/LanguageSettingPage";

  // Route
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case mainPage:
        return MaterialPageRoute(builder: (context) => LoginPage(), settings: settings);
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage(), settings: settings);
      case registrationPage:
        return MaterialPageRoute(builder: (context) => const RegistrationPage(), settings: settings);
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage(), settings: settings);
      case settingPage:
        return MaterialPageRoute(builder: (context) => SettingPage(mainContext: context), settings: settings);
      case accountSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountSettingPage(), settings: settings);
      case displaySettingPage:
        return MaterialPageRoute(builder: (context) => const DisplaySettingPage(), settings: settings);
      case languageSettingPage:
        return MaterialPageRoute(builder: (context) => const LanguageSettingPage(), settings: settings);
      default :
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
    }
  }
}