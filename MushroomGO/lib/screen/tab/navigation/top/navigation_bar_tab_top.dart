import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_indicator_tab_top.dart';

class NavigationBarTabTop extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const NavigationBarTabTop({super.key, required this.tabController, required this.tabs});

  @override
  State<NavigationBarTabTop> createState() => _NavigationBarTabTopState();
}

class _NavigationBarTabTopState extends State<NavigationBarTabTop> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: widget.tabs,
      controller: widget.tabController,
      indicator: const NavigationIndicatorTabTop(
        color: ColorConstant.primaryColor,
        width: DimensionConstant.widthIndicatorNavigationTabTop,
        height: DimensionConstant.heightIndicatorNavigationTabTop,
        margin: DimensionConstant.marginIndicatorNavigationTabTop
      ),
      dividerHeight: DimensionConstant.dividerHeightNavigationTabTop,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      labelStyle: TextStyleConstant.lightTitleSelectedNavigationTabTop,
      unselectedLabelStyle: TextStyleConstant.lightTitleUnselectedNavigationTabTop,
    );
  }
}
