import 'package:flutter/material.dart';

class NavigatorObserverPage extends NavigatorObserver{
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print(previousRoute?.settings.name);
  }
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print(route.settings.name);
  }
}