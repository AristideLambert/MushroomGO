import 'package:flutter/material.dart';

class NavigationItemTabBottom extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final double sizeIcon;
  final Color selectedColor;
  final Color unselectedColor;
  final TextStyle titleSelectedStyle;
  final TextStyle titleUnselectedStyle;
  final Function()? onTap;

  const NavigationItemTabBottom({super.key, required this.title, required this.icon, required this.isSelected, required this.onTap, required this.titleUnselectedStyle, required this.titleSelectedStyle, required this.selectedColor, required this.sizeIcon, required this.unselectedColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: sizeIcon,
              icon,
              color: isSelected ? selectedColor : unselectedColor,
            ),
            Text(
              title,
              style: isSelected ? titleSelectedStyle : titleUnselectedStyle,
            ),
          ],
        ),
      ),
    );
  }
}
