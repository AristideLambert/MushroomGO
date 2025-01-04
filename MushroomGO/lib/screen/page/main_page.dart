import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/provider/locale_provider.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:mushroom_go/screen/tab/challenge_tab.dart';
import 'package:mushroom_go/screen/tab/home_tab.dart';
import 'package:mushroom_go/screen/tab/map_tab.dart';
import 'package:mushroom_go/screen/tab/navigation/bottom/navigation_bar_tab_bottom.dart';
import 'package:mushroom_go/screen/tab/navigation/bottom/navigation_item_camera_tab_bottom.dart';
import 'package:mushroom_go/screen/tab/navigation/bottom/navigation_model.dart';
import 'package:mushroom_go/screen/tab/profile_tab.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final homeKey = GlobalKey<NavigatorState>();
  final mapKey = GlobalKey<NavigatorState>();
  final challengeKey = GlobalKey<NavigatorState>();
  final profileKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavigationModel> menuTabs = [];
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _setupAppLinks();
  }

  Future<void> _setupAppLinks() async {
    try {
      // Écouter les liens entrants en temps réel
      _appLinks.uriLinkStream.listen((uri) {
        if (uri != null) {
          _handleLink(uri);
        }
      });
    } catch (e) {
      print('Erreur lors de l’écoute des liens : $e');
    }
  }

  void _handleLink(Uri uri) {
    print('Lien détecté : $uri');
    final mode = uri.queryParameters['mode'];
    final oobCode = uri.queryParameters['oobCode'];

    if (mode == 'resetPassword' && oobCode != null) {
      Navigator.of(context).pushNamed(NavigationConstant.accountUpdatePasswordSettingPage, arguments: oobCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    menuTabs = [
      NavigationModel(
          tab: HomeTab(mainPageContext: context),
          key: homeKey
      ),
      NavigationModel(
          tab: const MapTab(),
          key: mapKey
      ),
      NavigationModel(
          tab: const ChallengeTab(),
          key: challengeKey
      ),
      NavigationModel(
          tab: ProfileTab(mainContext: context),
          key: profileKey
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: selectedTab,
        children: menuTabs.map((tab) => Navigator(
          key: tab.key,
          onGenerateInitialRoutes: (navigator, initialRoute) {
            return [MaterialPageRoute(builder: (context) => tab.tab)];
          },
        )).toList(),
      ),
      bottomNavigationBar: NavigationBarTabBottom(
          tabIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              menuTabs[index].key.currentState?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: NavigationItemCameraTabBottom(onTap: (){
        Provider.of<LocaleProvider>(context, listen: false).setLocale(const Locale("en"));
        Provider.of<ThemeProvider>(context, listen: false).setTheme(ThemeMode.dark);
      }),
    );
  }
}
