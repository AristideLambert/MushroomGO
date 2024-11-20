import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class NavigationTabBottomTheme extends ThemeExtension<NavigationTabBottomTheme> {
  final Color unselectedColor;
  final Color selectedColor;
  final double height;
  final double buttonSize;
  final double sizeIcon;
  final TextStyle titleUnselectedStyle;
  final TextStyle titleSelectedStyle;

  const NavigationTabBottomTheme({
    this.unselectedColor = ColorConstant.lightUnselectedNavigationTabBottom,
    this.selectedColor = ColorConstant.primaryColor,
    this.height = DimensionConstant.heightNavigationTabBottom,
    this.buttonSize = DimensionConstant.sizeNavigationItemCameraTabBottom,
    this.sizeIcon = DimensionConstant.iconSizeNavigationTabBottom,
    this.titleUnselectedStyle = TextStyleConstant.lightTitleUnselectedNavigationTabBottom,
    this.titleSelectedStyle = TextStyleConstant.lightTitleSelectedNavigationTabBottom,
  });

  @override
  NavigationTabBottomTheme copyWith({
    Color? unselectedColor,
    Color? selectedColor,
    double? height,
    double? buttonSize,
    double? sizeIcon,
    TextStyle? titleUnselectedStyle,
    TextStyle? titleSelectedStyle,
  }) {
    return NavigationTabBottomTheme(
      unselectedColor: unselectedColor ?? this.unselectedColor,
      selectedColor: selectedColor ?? this.selectedColor,
      height: height ?? this.height,
      buttonSize: buttonSize ?? this.buttonSize,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      titleUnselectedStyle: titleUnselectedStyle ?? this.titleUnselectedStyle,
      titleSelectedStyle: titleSelectedStyle ?? this.titleSelectedStyle,
    );
  }

  @override
  NavigationTabBottomTheme lerp(ThemeExtension<NavigationTabBottomTheme>? other, double t) {
    if (other is! NavigationTabBottomTheme) return this;
    return NavigationTabBottomTheme(
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      height: height + (other.height - height) * t,
      buttonSize: buttonSize + (other.buttonSize - buttonSize) * t,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      titleUnselectedStyle: TextStyle.lerp(titleUnselectedStyle, other.titleUnselectedStyle, t)!,
      titleSelectedStyle: TextStyle.lerp(titleSelectedStyle, other.titleSelectedStyle, t)!,
    );
  }
}
