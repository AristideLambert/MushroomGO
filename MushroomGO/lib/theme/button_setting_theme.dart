import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class ButtonSettingTheme extends ThemeExtension<ButtonSettingTheme> {
  final Color backgroundColor;
  final Color splashColor;
  final Color chevronColor;
  final Color checkColor;
  final double height;
  final double radius;
  final double padding;
  final double sizeLeftIcon;
  final double sizeChevron;
  final double sizeCheck;
  final double space;
  final TextStyle titleStyle;
  final TextStyle titleButtonStyle;
  final TextStyle dataStyle;

  const ButtonSettingTheme({
    this.backgroundColor = ColorConstant.lightBackgroundButtonSetting,
    this.splashColor = Colors.transparent,
    this.chevronColor = ColorConstant.lightDataButtonSetting,
    this.checkColor = ColorConstant.checkButtonSetting,
    this.height = DimensionConstant.heightButtonSetting,
    this.radius = DimensionConstant.radiusButtonSetting,
    this.padding = DimensionConstant.paddingButtonSetting,
    this.sizeLeftIcon = DimensionConstant.iconSizeButtonSetting,
    this.sizeChevron = DimensionConstant.chevronSizeButtonSetting,
    this.sizeCheck = DimensionConstant.checkSizeButtonSetting,
    this.space = DimensionConstant.spaceButtonSetting,
    this.titleStyle = TextStyleConstant.lightTitleButtonSetting,
    this.titleButtonStyle = TextStyleConstant.lightTitleButtonButtonSetting,
    this.dataStyle = TextStyleConstant.lightDataButtonSetting,
  });

  @override
  ButtonSettingTheme copyWith({
    Color? backgroundColor,
    Color? splashColor,
    Color? chevronColor,
    Color? checkColor,
    double? height,
    double? radius,
    double? padding,
    double? sizeLeftIcon,
    double? sizeChevron,
    double? sizeCheck,
    double? space,
    TextStyle? titleStyle,
    TextStyle? titleButtonStyle,
    TextStyle? dataStyle,
  }) {
    return ButtonSettingTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      splashColor: splashColor ?? this.splashColor,
      chevronColor: chevronColor ?? this.chevronColor,
      checkColor: checkColor ?? this.checkColor,
      height: height ?? this.height,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
      sizeLeftIcon: sizeLeftIcon ?? this.sizeLeftIcon,
      sizeChevron: sizeChevron ?? this.sizeChevron,
      sizeCheck: sizeCheck ?? this.sizeCheck,
      space: space ?? this.space,
      titleStyle: titleStyle ?? this.titleStyle,
      titleButtonStyle: titleButtonStyle ?? this.titleButtonStyle,
      dataStyle: dataStyle ?? this.dataStyle,
    );
  }

  @override
  ButtonSettingTheme lerp(ThemeExtension<ButtonSettingTheme>? other, double t) {
    if (other is! ButtonSettingTheme) return this;
    return ButtonSettingTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      splashColor: Color.lerp(splashColor, other.splashColor, t)!,
      chevronColor: Color.lerp(chevronColor, other.chevronColor, t)!,
      checkColor: Color.lerp(checkColor, other.checkColor, t)!,
      height: height + (other.height - height) * t,
      radius: radius + (other.radius - radius) * t,
      padding: padding + (other.padding - padding) * t,
      sizeLeftIcon: sizeLeftIcon + (other.sizeLeftIcon - sizeLeftIcon) * t,
      sizeChevron: sizeChevron + (other.sizeChevron - sizeChevron) * t,
      sizeCheck: sizeCheck + (other.sizeCheck - sizeCheck) * t,
      space: space + (other.space - space) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      titleButtonStyle: TextStyle.lerp(titleButtonStyle, other.titleButtonStyle, t)!,
      dataStyle: TextStyle.lerp(dataStyle, other.dataStyle, t)!,
    );
  }
}
