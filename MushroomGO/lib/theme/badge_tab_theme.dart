import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class BadgeTabTheme extends ThemeExtension<BadgeTabTheme> {
  final int gridDelegateCrossAxisCount;
  final double gridDelegateSpacing;
  final double gridDelegateChildAspectRatio;
  final double heightImage;
  final double spaceBetweenTextImage;
  final double textHeight;
  final double heightImageDetail;
  final double spaceBetweenText;
  final int textMaxLines;
  final double defaultPadding;
  final TextStyle textStyle;
  final TextStyle textDateStyle;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  const BadgeTabTheme({
    this.gridDelegateCrossAxisCount = DimensionConstant.gridDelegateCrossAxisCountBadgeTab,
    this.gridDelegateSpacing = DimensionConstant.gridDelegateSpacingBadgeTab,
    this.gridDelegateChildAspectRatio = DimensionConstant.gridDelegateChildAspectRatioBadgeTab,
    this.heightImage = DimensionConstant.heightImageBadgeTab,
    this.spaceBetweenTextImage = DimensionConstant.spaceBetweenTextImageBadgeTab,
    this.textHeight = DimensionConstant.textHeightBadgeTab,
    this.textMaxLines = DimensionConstant.textMaxLinesBadgeTab,
    this.heightImageDetail = DimensionConstant.heightImageBadgeDetail,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextBadgeDetail,
    this.defaultPadding = DimensionConstant.defaultPaddingBadgeTab,
    this.textStyle = TextStyleConstant.lightTextBadgeTab,
    this.textDateStyle = TextStyleConstant.textDateBadgeTab,
    this.titleStyle = TextStyleConstant.lightTitleBadgeTab,
    this.descriptionStyle = TextStyleConstant.lightDescriptionBadgeTab,
  });

  @override
  BadgeTabTheme copyWith({
    int? gridDelegateCrossAxisCount,
    double? gridDelegateSpacing,
    double? gridDelegateChildAspectRatio,
    double? heightImage,
    double? spaceBetweenTextImage,
    double? textHeight,
    int? textMaxLines,
    double? heightImageDetail,
    double? spaceBetweenText,
    double? defaultPadding,
    TextStyle? textStyle,
    TextStyle? textDateStyle,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
  }) {
    return BadgeTabTheme(
      gridDelegateCrossAxisCount: gridDelegateCrossAxisCount ?? this.gridDelegateCrossAxisCount,
      gridDelegateSpacing: gridDelegateSpacing ?? this.gridDelegateSpacing,
      gridDelegateChildAspectRatio: gridDelegateChildAspectRatio ?? this.gridDelegateChildAspectRatio,
      heightImage: heightImage ?? this.heightImage,
      spaceBetweenTextImage: spaceBetweenTextImage ?? this.spaceBetweenTextImage,
      textHeight: textHeight ?? this.textHeight,
      textMaxLines: textMaxLines ?? this.textMaxLines,
      heightImageDetail: heightImageDetail ?? this.heightImageDetail,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      defaultPadding: defaultPadding ?? this.defaultPadding,
      textStyle: textStyle ?? this.textStyle,
      textDateStyle: textDateStyle ?? this.textDateStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
    );
  }

  @override
  BadgeTabTheme lerp(ThemeExtension<BadgeTabTheme>? other, double t) {
    if (other is! BadgeTabTheme) return this;
    return BadgeTabTheme(
      gridDelegateCrossAxisCount: gridDelegateCrossAxisCount,
      gridDelegateSpacing: gridDelegateSpacing + (other.gridDelegateSpacing - gridDelegateSpacing) * t,
      gridDelegateChildAspectRatio: gridDelegateChildAspectRatio + (other.gridDelegateChildAspectRatio - gridDelegateChildAspectRatio) * t,
      heightImage: heightImage + (other.heightImage - heightImage) * t,
      spaceBetweenTextImage: spaceBetweenTextImage + (other.spaceBetweenTextImage - spaceBetweenTextImage) * t,
      textHeight: textHeight + (other.textHeight - textHeight) * t,
      textMaxLines: textMaxLines,
      heightImageDetail: heightImageDetail + (other.heightImageDetail - heightImageDetail) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      defaultPadding: defaultPadding + (other.defaultPadding - defaultPadding) * t,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      textDateStyle: TextStyle.lerp(textDateStyle, other.textDateStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
    );
  }

}