import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_bar_tab_top.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_view_tab_top.dart';
import 'package:mushroom_go/screen/tab/profile_badge_tab.dart';
import 'package:mushroom_go/screen/tab/profile_history_tab.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class ProfileTab extends StatefulWidget {
  final BuildContext mainContext;

  const ProfileTab({super.key, required this.mainContext});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with TickerProviderStateMixin {
  late User? _user;
  late TabController _tabController;

  Future<void> _navigate(String routeName) async {
    await Navigator.of(widget.mainContext).pushNamed(routeName);
    setState(() {
      _user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        if(_user == null) ... [
          BenefitAccountPage(mainContext: widget.mainContext)
        ] else ...[
    SafeArea(
      child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: DimensionConstant.defaultPadding * 2),
        child: Column(
        children: [
        CircleAvatar(
        radius: 70,
        backgroundImage: AssetImage(_user!.photoURL ?? "assets/images/profile.jpg")
        ),
        Container(
        margin: const EdgeInsets.only(top: 25, bottom: 20),
        child: Text(
        _user!.displayName ?? "Aristide LAMBERT",
        style: TextStyle(
        fontSize: DimensionConstant.titleLarge,
        fontWeight: FontWeight.bold
        ),
        ),
        )
        ],
        ),
      ),
      Expanded(
      child: Column(
      children: [
      NavigationBarTabTop(
      tabController: _tabController,
      tabs: const [
      Icon(MushroomGOFontUtils.history),
      Icon(MushroomGOFontUtils.trophy),
      ],
      theme: const NavigationTabTopTheme(
      widthIndicator: 60,
      marginIndicator: 16,
      ),
      ),
      Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: DimensionConstant.defaultPadding),
        child: NavigationViewTabTop(
        tabController: _tabController,
        tabs: [
          ProfileHistoryTab(),
          ProfileBadgeTab(mainContext: widget.mainContext,)
        ],
        ),
      ),
      )
      ],
      )
      )
      ]),
    )
        ],
        SafeArea(
          child: Container(
              margin: const EdgeInsets.only(
                  right: DimensionConstant.marginLogin,
                  top: DimensionConstant.marginLogin
              ),
              // TODO: Update icon
              child: GestureDetector(
                child: const Icon(Icons.settings, color: ColorConstant.textPrimaryColor,),
                onTap: () => _navigate(NavigationConstant.settingPage),
              )
          )
        )
      ],
    );
  }
}
