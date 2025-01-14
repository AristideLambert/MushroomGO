import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class AboutUsTheme extends ThemeExtension<AboutUsTheme> {
  final double defaultSpace;
  final double smallSpace;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle titleSectionStyle;
  final TextStyle lastUpdateStyle;
  final TextStyle sectionTextStyle;

  const AboutUsTheme({
    this.defaultSpace = DimensionConstant.defaultSpaceAboutUs,
    this.smallSpace = DimensionConstant.smallSpaceAboutUs,
    this.backgroundColor = ColorConstant.lightBackgroundAboutUs,
    this.titleStyle = TextStyleConstant.lightTitleAboutUs,
    this.lastUpdateStyle = TextStyleConstant.lightLastUpdateAboutUs,
    this.titleSectionStyle = TextStyleConstant.lightSectionTitleAboutUs,
    this.sectionTextStyle = TextStyleConstant.lightSectionTextAboutUs,
  });

  @override
  ThemeExtension<AboutUsTheme> copyWith({
    double? defaultSpace,
    double? smallSpace,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? titleSectionStyle,
    TextStyle? lastUpdateStyle,
    TextStyle? sectionTextStyle,
  }) {
    return AboutUsTheme(
      defaultSpace: defaultSpace ?? this.defaultSpace,
      smallSpace: smallSpace ?? this.smallSpace,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      titleSectionStyle: titleSectionStyle ?? this.titleSectionStyle,
      lastUpdateStyle: lastUpdateStyle ?? this.lastUpdateStyle,
      sectionTextStyle: sectionTextStyle ?? this.sectionTextStyle,
    );
  }


  @override
  ThemeExtension<AboutUsTheme> lerp(covariant ThemeExtension<AboutUsTheme>? other, double t) {
    if (other is! AboutUsTheme) return this;

    return AboutUsTheme(
      defaultSpace: lerpDouble(defaultSpace, other.defaultSpace, t)!,
      smallSpace: lerpDouble(smallSpace, other.smallSpace, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      titleSectionStyle: TextStyle.lerp(titleSectionStyle, other.titleSectionStyle, t)!,
      lastUpdateStyle: TextStyle.lerp(lastUpdateStyle, other.lastUpdateStyle, t)!,
      sectionTextStyle: TextStyle.lerp(sectionTextStyle, other.sectionTextStyle, t)!,
    );
  }


}
