import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/tab/navigation/top/navigation_indicator_tab_top.dart';
import 'package:mushroom_go/theme/navigation_tab_top_theme.dart';

class NavigationBarTabTop extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final NavigationTabTopTheme? theme;

  const NavigationBarTabTop({super.key, required this.tabController, required this.tabs, this.theme});

  @override
  State<NavigationBarTabTop> createState() => _NavigationBarTabTopState();
}

class _NavigationBarTabTopState extends State<NavigationBarTabTop> {
  late NavigationTabTopTheme _theme;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = widget.theme ?? Theme.of(context).extension<NavigationTabTopTheme>()!;
  }
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: widget.tabs,
      controller: widget.tabController,
      indicator: NavigationIndicatorTabTop(
        color: _theme.colorIndicator,
        width: _theme.widthIndicator,
        height: _theme.heightIndicator,
        margin: _theme.marginIndicator
      ),
      dividerHeight: _theme.dividerHeight,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      labelStyle: _theme.titleSelectedStyle,
      unselectedLabelStyle: _theme.titleUnselectedStyle,
    );
  }
}
