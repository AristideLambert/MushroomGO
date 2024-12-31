import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class HistoryTabTheme extends ThemeExtension<HistoryTabTheme> {
  final double itemRadius;
  final double spaceBetweenImageText;
  final double defaultPaddingMargin;
  final double imageWidthHeight;
  final double spaceBetweenText;
  final TextStyle titleStyle;
  final TextStyle textDateStyle;
  final TextStyle textStyle;
  final Color cardBackgroundColor;

  const HistoryTabTheme({
    this.itemRadius = DimensionConstant.itemRadiusHistoryTab,
    this.spaceBetweenImageText = DimensionConstant.spaceBetweenImageTextHistoryTab,
    this.defaultPaddingMargin = DimensionConstant.defaultPaddingMarginHistoryTab,
    this.imageWidthHeight = DimensionConstant.imageWidthHeightHistoryTab,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextHistoryTab,
    this.titleStyle = TextStyleConstant.lightTitleHistoryTab,
    this.textDateStyle = TextStyleConstant.textDateHistoryTab,
    this.textStyle = TextStyleConstant.lightTextHistoryTab,
    this.cardBackgroundColor = ColorConstant.lightBackgroundHistoryTab,
  });

  @override
  HistoryTabTheme copyWith({
    double? itemRadius,
    double? spaceBetweenImageText,
    double? defaultPaddingMargin,
    double? imageWidthHeight,
    double? spaceBetweenText,
    TextStyle? titleStyle,
    TextStyle? textDateStyle,
    TextStyle? textStyle,
    Color? cardBackgroundColor,
  }) {
    return HistoryTabTheme(
      itemRadius: itemRadius ?? this.itemRadius,
      spaceBetweenImageText: spaceBetweenImageText ?? this.spaceBetweenImageText,
      defaultPaddingMargin: defaultPaddingMargin ?? this.defaultPaddingMargin,
      imageWidthHeight: imageWidthHeight ?? this.imageWidthHeight,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      titleStyle: titleStyle ?? this.titleStyle,
      textDateStyle: textDateStyle ?? this.textDateStyle,
      textStyle: textStyle ?? this.textStyle,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
    );
  }

  @override
  HistoryTabTheme lerp(ThemeExtension<HistoryTabTheme>? other, double t) {
    if (other is! HistoryTabTheme) return this;
    return HistoryTabTheme(
      itemRadius: itemRadius + (other.itemRadius - itemRadius) * t,
      spaceBetweenImageText: spaceBetweenImageText + (other.spaceBetweenImageText - spaceBetweenImageText) * t,
      defaultPaddingMargin: defaultPaddingMargin + (other.defaultPaddingMargin - defaultPaddingMargin) * t,
      imageWidthHeight: imageWidthHeight + (other.imageWidthHeight - imageWidthHeight) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      textDateStyle: TextStyle.lerp(textDateStyle, other.textDateStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      cardBackgroundColor: Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
    );
  }
}