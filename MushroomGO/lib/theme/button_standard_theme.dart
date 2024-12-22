import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ButtonStandardTheme extends ThemeExtension<ButtonStandardTheme> {
  final Color backgroundColor;
  final Color iconColor;
  final Color splashColor;
  final double height;
  final double radius;
  final double padding;
  final double sizeIcon;
  final double space;
  final TextStyle titleStyle;

  const ButtonStandardTheme({
    this.backgroundColor = ColorConstant.primaryColor,
    this.iconColor = ColorConstant.lightIconButtonStandard,
    this.splashColor = Colors.transparent,
    this.height = DimensionConstant.heightButtonStandard,
    this.radius = DimensionConstant.radiusButtonStandard,
    this.padding = DimensionConstant.paddingButtonStandard,
    this.sizeIcon = DimensionConstant.iconSizeButtonStandard,
    this.space = DimensionConstant.spaceButtonStandard,
    this.titleStyle = TextStyleConstant.lightTitleButtonStandard,
  });

  @override
  ButtonStandardTheme copyWith({
    Color? backgroundColor,
    Color? iconColor,
    Color? splashColor,
    double? height,
    double? radius,
    double? padding,
    double? sizeIcon,
    double? space,
    TextStyle? titleStyle,
  }) {
    return ButtonStandardTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
      height: height ?? this.height,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      space: space ?? this.space,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  ButtonStandardTheme lerp(ThemeExtension<ButtonStandardTheme>? other, double t) {
    if (other is! ButtonStandardTheme) return this;
    return ButtonStandardTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      height: height + (other.height - height) * t,
      radius: radius + (other.radius - radius) * t,
      padding: padding + (other.padding - padding) * t,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      space: space + (other.space - space) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }
}
