import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ProfileHistoryListTheme extends ThemeExtension<ProfileHistoryListTheme> {
  final double radius;
  final double spaceBetweenImageText;
  final double imageWidthHeight;
  final double spaceBetweenText;
  final TextStyle titleStyle;
  final TextStyle textDateStyle;
  final TextStyle textStyle;

  const ProfileHistoryListTheme({
    this.radius = DimensionConstant.radiusProfileHistoryList,
    this.spaceBetweenImageText = DimensionConstant.spaceBetweenImageProfileHistoryList,
    this.imageWidthHeight = DimensionConstant.imageWidthHeightProfileHistoryList,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextProfileHistoryList,
    this.titleStyle = TextStyleConstant.lightTitleProfileHistoryList,
    this.textDateStyle = TextStyleConstant.textDateProfileHistoryList,
    this.textStyle = TextStyleConstant.lightTextProfileHistoryList,
  });

  @override
  ProfileHistoryListTheme copyWith({
    double? radius,
    double? spaceBetweenImageText,
    double? imageWidthHeight,
    double? spaceBetweenText,
    TextStyle? titleStyle,
    TextStyle? textDateStyle,
    TextStyle? textStyle
  }) {
    return ProfileHistoryListTheme(
      radius: radius ?? this.radius,
      spaceBetweenImageText: spaceBetweenImageText ?? this.spaceBetweenImageText,
      imageWidthHeight: imageWidthHeight ?? this.imageWidthHeight,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      titleStyle: titleStyle ?? this.titleStyle,
      textDateStyle: textDateStyle ?? this.textDateStyle,
      textStyle: textStyle ?? this.textStyle
    );
  }

  @override
  ProfileHistoryListTheme lerp(ThemeExtension<ProfileHistoryListTheme>? other, double t) {
    if (other is! ProfileHistoryListTheme) return this;
    return ProfileHistoryListTheme(
      radius: radius + (other.radius - radius) * t,
      spaceBetweenImageText: spaceBetweenImageText + (other.spaceBetweenImageText - spaceBetweenImageText) * t,
      imageWidthHeight: imageWidthHeight + (other.imageWidthHeight - imageWidthHeight) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      textDateStyle: TextStyle.lerp(textDateStyle, other.textDateStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!
    );
  }
}