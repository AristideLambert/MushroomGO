import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/page/main_page.dart';

class NavigationConstant{
  //Page
  static const String mainPage = "/";
  
  //Route
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case mainPage:
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
      default :
        return MaterialPageRoute(builder: (context) => const MainPage(), settings: settings);
    }
  }
}