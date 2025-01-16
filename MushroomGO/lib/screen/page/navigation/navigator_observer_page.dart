import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';

class NavigatorObserverPage extends NavigatorObserver{
  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorObserverPage({required this.navigatorKey});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _updateNavigationBarColor(previousRoute!);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _updateNavigationBarColor(route);
  }

  void _updateNavigationBarColor(Route route){
    BuildContext? context = navigatorKey.currentContext;
    if (context != null && route.settings.name != null) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Theme.of(context).brightness,
          statusBarBrightness: Theme.of(context).brightness,
        ),
      );
      Color color;
      switch (route.settings.name) {
        case NavigationConstant.mainPage:
          color = Theme.of(context).appBarTheme.backgroundColor!;
          break;
        case NavigationConstant.loginPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.benefitAccountPage:
          color = Theme.of(context).primaryColor;
          break;
        case NavigationConstant.registrationPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.forgotPasswordPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.settingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.accountSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.accountUpdateFirstnameNameSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.accountUpdateImageProfileSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.accountUpdatePasswordSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.accountDeleteSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.displaySettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.languageSettingPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.mushroomDetailPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.webViewPage:
          color = Theme.of(context).appBarTheme.backgroundColor!;
          break;
        case NavigationConstant.badgeDetailPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.cameraCheckImagePage:
        case NavigationConstant.cameraPage:
          color = ColorConstant.backgroundCamera;
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          );
          break;
        case NavigationConstant.searchPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.privacyPolicyPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        case NavigationConstant.termsConditionsPage:
          color = Theme.of(context).scaffoldBackgroundColor;
          break;
        default:
          color = Colors.transparent;
          break;
      }
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color,
        systemNavigationBarIconBrightness: MediaQuery.of(context).platformBrightness,
      ));
    }
  }
}