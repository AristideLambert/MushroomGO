import 'package:flutter/material.dart';
import 'package:mushroom_go/models/mission.dart';
import 'package:mushroom_go/screen/page/camera/camera_page.dart';
import 'package:mushroom_go/screen/page/detail/badge_detail_page.dart';
import 'package:mushroom_go/screen/page/detail/mushroom_detail_page.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/screen/page/account/forgot_password_page.dart';
import 'package:mushroom_go/screen/page/account/login_page.dart';
import 'package:mushroom_go/screen/page/account/registration_page.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/screen/page/setting/account/account_delete_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/account/account_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/account/account_update_firstname_name_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/account/account_update_image_profile_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/account/account_update_password_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/display_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/language_setting_page.dart';
import 'package:mushroom_go/screen/page/setting/setting_page.dart';
import 'package:mushroom_go/models/mushroom.dart';
import 'package:mushroom_go/screen/page/web/web_view_page.dart';

class NavigationConstant {
  // Pages
  static const String mainPage = "/";
  static const String loginPage = "/LoginPage";
  static const String benefitAccountPage = "/BenefitAccountPage";
  static const String registrationPage = "/RegistrationPage";
  static const String forgotPasswordPage = "/ForgotPasswordPage";
  static const String settingPage = "/SettingPage";
  static const String accountSettingPage = "/AccountSettingPage";
  static const String accountUpdateFirstnameNameSettingPage = "/AccountUpdateFirstnameNameSettingPage";
  static const String accountUpdateImageProfileSettingPage = "/AccountUpdateImageProfileSettingPage";
  static const String accountUpdatePasswordSettingPage = "/AccountUpdatePasswordSettingPage";
  static const String accountDeleteSettingPage = "/AccountDeleteSettingPage";
  static const String displaySettingPage = "/DisplaySettingPage";
  static const String languageSettingPage = "/LanguageSettingPage";
  static const String mushroomDetailPage = "/MushroomDetailPage";
  static const String webViewPage = "/WebViewPage";
  static const String badgeDetailPage = "/BadgeDetailPage";
  static const String cameraPage = "/CameraPage";


  // Route
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainPage:
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
      case loginPage:
        return MaterialPageRoute(builder: (context) => LoginPage(), settings: settings);
      case benefitAccountPage:
        return MaterialPageRoute(builder: (context) => BenefitAccountPage(mainContext: context), settings: settings);
      case registrationPage:
        return MaterialPageRoute(builder: (context) => const RegistrationPage(), settings: settings);
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage(), settings: settings);
      case settingPage:
        return MaterialPageRoute(builder: (context) => SettingPage(mainContext: context), settings: settings);
      case accountSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountSettingPage(), settings: settings);
      case accountUpdateFirstnameNameSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountUpdateFirstnameNameSettingPage(), settings: settings);
      case accountUpdateImageProfileSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountUpdateImageProfileSettingPage(), settings: settings);
      case accountUpdatePasswordSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountUpdatePasswordSettingPage(), settings: settings);
      case accountDeleteSettingPage:
        return MaterialPageRoute(builder: (context) => const AccountDeleteSettingPage(), settings: settings);
      case displaySettingPage:
        return MaterialPageRoute(builder: (context) => const DisplaySettingPage(), settings: settings);
      case languageSettingPage:
        return MaterialPageRoute(builder: (context) => const LanguageSettingPage(), settings: settings);
      case mushroomDetailPage:
        final mushroom = settings.arguments as Mushroom;
        return MaterialPageRoute(builder: (context) => MushroomDetailPage(mushroom: mushroom), settings: settings);
      case webViewPage:
        final args = settings.arguments as Map<String, String>;
        final url = args['url']!;
        final titleArticle = args['title']!;
        return MaterialPageRoute(builder: (context) => WebViewPage(url: url, articleName: titleArticle), settings: settings);
      case badgeDetailPage:
        final mission = settings.arguments as Mission;
        return MaterialPageRoute(builder: (context) => BadgeDetailPage(mission: mission), settings: settings);
      case cameraPage:
        return MaterialPageRoute(builder: (context) => CameraPage(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
    }
  }
}
