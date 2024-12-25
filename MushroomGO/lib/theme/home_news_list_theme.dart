import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class HomeNewsListTheme extends ThemeExtension<HomeNewsListTheme> {
  final double imageHeight;
  final double cardMargin;
  final double radiusItem;
  final double cardPadding;
  final Color cardBackgroundColor;
  final TextStyle titleStyle;

  const HomeNewsListTheme({
    this.radiusItem = DimensionConstant.radiusItemHomeNewsList,
    this.imageHeight = DimensionConstant.imageHeightHomeNewsList,
    this.cardMargin = DimensionConstant.cardMarginHomeNewsList,
    this.cardPadding = DimensionConstant.cardPaddingHomeNewsList,
    this.cardBackgroundColor = ColorConstant.lightBackgroundHomeNewsList,
    this.titleStyle = TextStyleConstant.lightTitleChallengeMissionsList,
  });

  @override
  HomeNewsListTheme copyWith({
    double? titleFontSize,
    double? imageHeight,
    double? cardMargin,
    double? cardPadding,
    Color? cardBackgroundColor,
    TextStyle? titleStyle,
  }) {
    return HomeNewsListTheme(
      imageHeight: imageHeight ?? this.imageHeight,
      cardMargin: cardMargin ?? this.cardMargin,
      cardPadding: cardPadding ?? this.cardPadding,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  HomeNewsListTheme lerp(ThemeExtension<HomeNewsListTheme>? other, double t) {
    if (other is! HomeNewsListTheme) return this;
    return HomeNewsListTheme(
      imageHeight: imageHeight + (other.imageHeight - imageHeight) * t,
      cardMargin: cardMargin + (other.cardMargin - cardMargin) * t,
      cardPadding: cardPadding + (other.cardPadding - cardPadding) * t,
      cardBackgroundColor: Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }
}
