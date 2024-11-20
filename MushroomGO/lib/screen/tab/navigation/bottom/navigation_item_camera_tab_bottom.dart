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
        margin: const EdgeInsets.only(top: DimensionConstant.marginNavigationItemCameraTabBottom),
        height: DimensionConstant.sizeNavigationItemCameraTabBottom,
        width: DimensionConstant.sizeNavigationItemCameraTabBottom,
        decoration: BoxDecoration(
          color: BottomAppBarTheme.of(context).color,
          shape: BoxShape.circle,
        ),
        child: Container(
          margin: const EdgeInsets.all(DimensionConstant.borderNavigationItemCameraTabBottom),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            size: DimensionConstant.iconSizeNavigationItemCameraTabBottom,
            MushroomGOFontUtils.mushroomScan,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
