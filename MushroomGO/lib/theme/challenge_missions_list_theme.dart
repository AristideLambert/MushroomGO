import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ChallengeMissionListTheme extends ThemeExtension<ChallengeMissionListTheme> {
  final double marginTitle;
  final double spacingBetweenTitleAndList;
  final double cardMargin;
  final double cardPadding;
  final double progressBarHeight;
  final double radiusItem;
  final double progressMin;
  final double progressMax;
  final Color cardBackgroundColor;
  final Color progressBarBackgroundColor;
  final Color progressBarForegroundColor;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final TextStyle progressTextStyle;

  const ChallengeMissionListTheme({
    this.marginTitle = DimensionConstant.identTitleChallengeMissionsList,
    this.spacingBetweenTitleAndList = DimensionConstant.paddingBetweenItemChallengeMissionsList,
    this.cardMargin = DimensionConstant.cardMarginChallengeMissionsList,
    this.cardPadding = DimensionConstant.defaultPadding,
    this.progressBarHeight = DimensionConstant.progressBarHeightChallengeMissionsList,
    this.radiusItem = DimensionConstant.radiusItemChallengeMissionsList,
    this.progressMin = DimensionConstant.progressMinChallengeMissionsList,
    this.progressMax = DimensionConstant.progressMaxChallengeMissionsList,
    this.cardBackgroundColor = ColorConstant.lightBackgroundChallengeMissionsList,
    this.progressBarBackgroundColor = ColorConstant.lightProgressBarBackgroundChallengeMissionsList,
    this.progressBarForegroundColor = ColorConstant.lightProgressBarForegroundChallengeMissionsList,
    this.titleStyle = TextStyleConstant.lightTitleChallengeMissionsList,
    this.descriptionStyle = TextStyleConstant.lightDescriptionChallengeMissionsList,
    this.progressTextStyle = TextStyleConstant.lightProgressTextChallengeMissionsList,
  });

  @override
  ChallengeMissionListTheme copyWith({
    double? marginTitle,
    double? spacingBetweenTitleAndList,
    double? cardMargin,
    double? cardPadding,
    double? progressBarHeight,
    double? radiusItem,
    double? progressMin,
    double? progressMax,
    Color? cardBackgroundColor,
    Color? progressBarBackgroundColor,
    Color? progressBarForegroundColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? progressTextStyle,
  }) {
    return ChallengeMissionListTheme(
      marginTitle: marginTitle ?? this.marginTitle,
      spacingBetweenTitleAndList: spacingBetweenTitleAndList ?? this.spacingBetweenTitleAndList,
      cardMargin: cardMargin ?? this.cardMargin,
      cardPadding: cardPadding ?? this.cardPadding,
      progressBarHeight: progressBarHeight ?? this.progressBarHeight,
      radiusItem: radiusItem ?? this.radiusItem,
      progressMin: progressMin ?? this.progressMin,
      progressMax: progressMax ?? this.progressMax,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
      progressBarBackgroundColor: progressBarBackgroundColor ?? this.progressBarBackgroundColor,
      progressBarForegroundColor: progressBarForegroundColor ?? this.progressBarForegroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      progressTextStyle: progressTextStyle ?? this.progressTextStyle,
    );
  }

  @override
  ChallengeMissionListTheme lerp(ThemeExtension<ChallengeMissionListTheme>? other, double t) {
    if (other is! ChallengeMissionListTheme) return this;
    return ChallengeMissionListTheme(
      marginTitle: marginTitle + (other.marginTitle - marginTitle) * t,
      spacingBetweenTitleAndList: spacingBetweenTitleAndList + (other.spacingBetweenTitleAndList - spacingBetweenTitleAndList) * t,
      cardMargin: cardMargin + (other.cardMargin - cardMargin) * t,
      cardPadding: cardPadding + (other.cardPadding - cardPadding) * t,
      progressBarHeight: progressBarHeight + (other.progressBarHeight - progressBarHeight) * t,
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      progressMin: progressMin + (other.progressMin - progressMin) * t,
      progressMax: progressMax + (other.progressMax - progressMax) * t,
      cardBackgroundColor: Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
      progressBarBackgroundColor: Color.lerp(progressBarBackgroundColor, other.progressBarBackgroundColor, t)!,
      progressBarForegroundColor: Color.lerp(progressBarForegroundColor, other.progressBarForegroundColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
      progressTextStyle: TextStyle.lerp(progressTextStyle, other.progressTextStyle, t)!,
    );
  }
}
