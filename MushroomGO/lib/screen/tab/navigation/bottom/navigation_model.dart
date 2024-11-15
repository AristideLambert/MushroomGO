import 'package:flutter/material.dart';

class NavigationModel{
  final Widget tab;
  final GlobalKey<NavigatorState> key;

  NavigationModel({required this.tab, required this.key});
}