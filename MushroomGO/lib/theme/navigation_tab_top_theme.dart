import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class NavigationTabTopTheme extends ThemeExtension<NavigationTabTopTheme> {
  final Color colorIndicator;
  final double widthIndicator;
  final double heightIndicator;
  final double marginIndicator;
  final double dividerHeight;
  final TextStyle titleUnselectedStyle;
  final TextStyle titleSelectedStyle;

  const NavigationTabTopTheme({
    this.colorIndicator = ColorConstant.primaryColor,
    this.widthIndicator = DimensionConstant.widthIndicatorNavigationTabTop,
    this.heightIndicator = DimensionConstant.heightIndicatorNavigationTabTop,
    this.marginIndicator = DimensionConstant.marginIndicatorNavigationTabTop,
    this.dividerHeight = DimensionConstant.dividerHeightNavigationTabTop,
    this.titleUnselectedStyle = TextStyleConstant.lightTitleUnselectedNavigationTabTop,
    this.titleSelectedStyle = TextStyleConstant.lightTitleSelectedNavigationTabTop,
  });

  @override
  NavigationTabTopTheme copyWith({
    Color? colorIndicator,
    double? widthIndicator,
    double? heightIndicator,
    double? marginIndicator,
    double? dividerHeight,
    TextStyle? titleUnselectedStyle,
    TextStyle? titleSelectedStyle,
  }) {
    return NavigationTabTopTheme(
      colorIndicator: colorIndicator ?? this.colorIndicator,
      widthIndicator: widthIndicator ?? this.widthIndicator,
      heightIndicator: heightIndicator ?? this.heightIndicator,
      marginIndicator: marginIndicator ?? this.marginIndicator,
      dividerHeight: dividerHeight ?? this.dividerHeight,
      titleUnselectedStyle: titleUnselectedStyle ?? this.titleUnselectedStyle,
      titleSelectedStyle: titleSelectedStyle ?? this.titleSelectedStyle,
    );
  }

  @override
  NavigationTabTopTheme lerp(ThemeExtension<NavigationTabTopTheme>? other, double t) {
    if (other is! NavigationTabTopTheme) return this;
    return NavigationTabTopTheme(
      colorIndicator: Color.lerp(colorIndicator, other.colorIndicator, t)!,
      widthIndicator: widthIndicator + (other.widthIndicator - widthIndicator) * t,
      heightIndicator: heightIndicator + (other.heightIndicator - heightIndicator) * t,
      marginIndicator: marginIndicator + (other.marginIndicator - marginIndicator) * t,
      dividerHeight: dividerHeight + (other.dividerHeight - dividerHeight) * t,
      titleUnselectedStyle: TextStyle.lerp(titleUnselectedStyle, other.titleUnselectedStyle, t)!,
      titleSelectedStyle: TextStyle.lerp(titleSelectedStyle, other.titleSelectedStyle, t)!,
    );
  }
}
