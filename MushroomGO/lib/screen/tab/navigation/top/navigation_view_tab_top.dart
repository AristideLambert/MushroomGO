import 'package:flutter/material.dart';

class NavigationViewTabTop extends StatefulWidget {
  final TabController tabController;
  final List<Widget> tabs;
  const NavigationViewTabTop({super.key, required this.tabController, required this.tabs});

  @override
  State<NavigationViewTabTop> createState() => _NavigationViewTabTopState();
}

class _NavigationViewTabTopState extends State<NavigationViewTabTop> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: widget.tabs
    );
  }
}
