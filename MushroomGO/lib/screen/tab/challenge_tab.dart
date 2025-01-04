import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/screen/tab/challenge_missions_tab.dart';
import 'package:mushroom_go/screen/tab/challenge_mushrooms_tab.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_bar_tab_top.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_view_tab_top.dart';

class ChallengeTab extends StatefulWidget {
  final BuildContext mainContext;
  const ChallengeTab({super.key, required this.mainContext});

  @override
  State<ChallengeTab> createState() => _ChallengeTabState();
}

class _ChallengeTabState extends State<ChallengeTab> with TickerProviderStateMixin {
  late List<Widget> _tabTitle;
  late List<Widget> _tabChildren;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabTitle = [
      Text(AppLocalizations.of(context)!.challengeMushrooms),
      Text(AppLocalizations.of(context)!.challengeMissions)
    ];
    _tabChildren = [
      const ChallengeMushroomsTab(),
      const ChallengeMissionsTab()
    ];
    _tabController = TabController(length: _tabChildren.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser == null) {
      return BenefitAccountPage(mainContext: widget.mainContext);
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: DimensionConstant.defaultElevation,
          titleSpacing: DimensionConstant.appBarTitleSpacingHome,
          title: NavigationBarTabTop(
              tabController: _tabController,
              tabs: _tabTitle
          ),
        ),
        body: NavigationViewTabTop(
          tabController: _tabController,
          tabs: _tabChildren,
        ),
      );
    }
  }
}
