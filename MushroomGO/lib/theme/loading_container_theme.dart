import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class LoadingContainerTheme extends ThemeExtension<LoadingContainerTheme> {
  final double padding;
  final double radius;
  final double iconSize;
  final double space;
  final Color backgroundColor;
  final Color iconColor;
  final TextStyle titleStyle;

  const LoadingContainerTheme({
    this.padding = DimensionConstant.paddingLoadingContainer,
    this.radius = DimensionConstant.radiusLoadingContainer,
    this.iconSize = DimensionConstant.iconSizeLoadingContainer,
    this.space = DimensionConstant.spaceLoadingContainer,
    this.backgroundColor = ColorConstant.lightBackgroundLoadingContainer,
    this.iconColor = ColorConstant.lightIconLoadingContainer,
    this.titleStyle = TextStyleConstant.lightTitleLoadingContainer
  });

  @override
  LoadingContainerTheme copyWith({
    double? padding,
    double? radius,
    double? iconSize,
    double? space,
    Color? backgroundColor,
    Color? iconColor,
    TextStyle? titleStyle
  }) {
    return LoadingContainerTheme(
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      iconSize: iconSize ?? this.iconSize,
      space: space ?? this.space,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  LoadingContainerTheme lerp(ThemeExtension<LoadingContainerTheme>? other, double t) {
    if (other is! LoadingContainerTheme) return this;
    return LoadingContainerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      padding: padding + (other.padding - padding) * t,
      radius: radius + (other.radius - radius) * t,
      iconSize: iconSize + (other.iconSize - iconSize) * t,
      space: space + (other.space - space) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }
}
