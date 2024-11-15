import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class NavigationItemCameraTabBottom extends StatelessWidget {
  final Function()? onTap;
  const NavigationItemCameraTabBottom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: DimensionConstant.buttonSizeNavigationTabBottom,
        width: DimensionConstant.buttonSizeNavigationTabBottom,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
          border: Border.all(
            width: 4.0,
            color: BottomAppBarTheme.of(context).color ?? Colors.white,
          ),
        ),
        child: const Icon(
          size: 35,
          MushroomGOFontUtils.mushroomScan,
          color: Colors.white,
        ),
      ),
    );
  }
}
