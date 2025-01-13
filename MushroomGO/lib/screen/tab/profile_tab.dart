import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/screen/page/account/benefit_account_page.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_bar_tab_top.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_view_tab_top.dart';
import 'package:mushroom_go/screen/tab/profile_badge_tab.dart';
import 'package:mushroom_go/screen/tab/profile_history_tab.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';
import 'package:mushroom_go/theme/profile_tab_theme.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTab extends StatefulWidget {
  final BuildContext mainContext;
  final ProfileTabTheme? theme;

  const ProfileTab({super.key, required this.mainContext, this.theme});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with TickerProviderStateMixin {
  late ProfileTabTheme _theme;
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<ProfileTabTheme>()!;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingContainer(message: AppLocalizations.of(context)!.profileInProgressTitle)
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              _user = snapshot.data;
              return SafeArea(
                child: Column(
                  children: [
                    Card(
                      color: Theme.of(context).appBarTheme.backgroundColor,
                      elevation: DimensionConstant.defaultElevation,
                      margin: const EdgeInsets.all(DimensionConstant.defaultPadding),
                      child: Container(
                        padding: const EdgeInsets.only(top: DimensionConstant.defaultPadding),
                        width: double.infinity,
                        child: Column(
                          children: [
                            CircleAvatar(
                                radius: DimensionConstant.radiusProfileTab,
                                backgroundImage: AssetImage(_user!.photoURL ?? "assets/images/profile.jpg")
                            ),
                            Container(
                              margin: const EdgeInsets.all(DimensionConstant.defaultPadding),
                              child: TextOutput(
                                text: _user!.displayName ?? "Aristide LAMBERT",
                                type: Type.largeTitle,
                              ),
                            )
                          ],
                        ),
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
                            theme: NavigationTabTopTheme(
                              widthIndicator: DimensionConstant.widthIndicatorProfileTab,
                              marginIndicator: DimensionConstant.marginIndicatorProfileTab,
                              titleSelectedStyle: _theme.selectedItemStyle,
                              titleUnselectedStyle: _theme.unSelectedItemStyle
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: DimensionConstant.defaultPadding),
                              child: NavigationViewTabTop(
                                tabController: _tabController,
                                tabs: [
                                  ProfileHistoryTab(mainContext: widget.mainContext),
                                  ProfileBadgeTab(mainContext: widget.mainContext)
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ]),
              );
            } else {
              return BenefitAccountPage(
                  mainContext: widget.mainContext
              );
            }
          }
        ),
        SafeArea(
            child: Padding(
                padding: EdgeInsets.all(_user == null ? DimensionConstant.defaultPadding : DimensionConstant.defaultPadding * 2),
                // TODO: Update icon
                child: GestureDetector(
                  child: Icon(Icons.settings, color: _theme.iconColor),
                  onTap: () => _navigate(NavigationConstant.settingPage),
                )
            )
        )
      ],
    );
  }
}