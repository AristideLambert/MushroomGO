import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/tab/home_for_you_tab.dart';
import 'package:mushroom_go/screen/tab/home_news_tab.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_bar_tab_top.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_view_tab_top.dart';

class HomeTab extends StatefulWidget {
  final BuildContext mainPageContext;
  const HomeTab({super.key, required this.mainPageContext});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late List<Widget> _tabTitle;
  late List<Widget> _tabChildren;
  late TabController _tabController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabTitle = [
      const Text("Pour toi"),
      const Text("Actualité")
    ];
    _tabChildren = [
      const HomeForYouTab(),
      const HomeNewsTab()
    ];
    _tabController = TabController(length: _tabChildren.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: DimensionConstant.defaultElevation,
        titleSpacing: DimensionConstant.appBarTitleSpacingHome,
        title: NavigationBarTabTop(
          tabController: _tabController,
          tabs: _tabTitle,
        ),
      ),
      body: NavigationViewTabTop(
        tabController: _tabController,
        tabs: _tabChildren,
          ),
      backgroundColor: Colors.blue,
    );
  }
}
