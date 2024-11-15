import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class NavigationItemTabBottom extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function()? onTap;
  const NavigationItemTabBottom({super.key, required this.title, required this.icon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: DimensionConstant.iconSizeNavigationTabBottom,
              icon,
              color: isSelected ? ColorConstant.primaryColor : ColorConstant.lightUnselectedNavigationTabBottom,
            ),
            Text(
              title,
              style: isSelected ? TextStyleConstant.lightTitleSelectedNavigationTabBottom : TextStyleConstant.lightTitleUnselectedNavigationTabBottom,
            ),
          ],
        ),
      ),
    );
  }
}
