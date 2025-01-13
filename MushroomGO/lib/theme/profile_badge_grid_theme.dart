import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ProfileBadgeGridTheme extends ThemeExtension<ProfileBadgeGridTheme> {
  final int gridDelegateCrossAxisCount;
  final double gridDelegateCrossAxisSpacing;
  final double gridDelegateMainAxisSpacing;
  final double gridDelegateChildAspectRatio;
  final double heightImage;
  final double spaceBetweenTextImage;
  final double textHeight;
  final double heightImageDetail;
  final double spaceBetweenText;
  final double sizeImageLoading;
  final int textMaxLines;
  final TextStyle textStyle;
  final TextStyle textDateStyle;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  const ProfileBadgeGridTheme({
    this.gridDelegateCrossAxisCount = DimensionConstant.gridDelegateCrossAxisCountProfileBadgeGrid,
    this.gridDelegateCrossAxisSpacing = DimensionConstant.gridDelegateCrossAxisSpacingProfileBadgeGrid,
    this.gridDelegateMainAxisSpacing = DimensionConstant.gridDelegateMainAxisSpacingProfileBadgeGrid,
    this.gridDelegateChildAspectRatio = DimensionConstant.gridDelegateChildAspectRatioProfileBadgeGrid,
    this.heightImage = DimensionConstant.heightImageProfileBadgeGrid,
    this.spaceBetweenTextImage = DimensionConstant.spaceBetweenTextImageProfileBadgeGrid,
    this.textHeight = DimensionConstant.textHeightProfileBadgeGrid,
    this.textMaxLines = DimensionConstant.textMaxLinesProfileBadgeGrid,
    this.heightImageDetail = DimensionConstant.heightImageDetailProfileBadgeGrid,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextProfileBadgeGrid,
    this.sizeImageLoading = DimensionConstant.sizeImageLoadingProfileBadgeGrid,
    this.textStyle = TextStyleConstant.lightTextProfileBadgeGrid,
    this.textDateStyle = TextStyleConstant.textDateProfileBadgeGrid,
    this.titleStyle = TextStyleConstant.lightTitleProfileBadgeGrid,
    this.descriptionStyle = TextStyleConstant.lightDescriptionProfileBadgeGrid,
  });

  @override
  ProfileBadgeGridTheme copyWith({
    int? gridDelegateCrossAxisCount,
    double? gridDelegateCrossAxisSpacing,
    double? gridDelegateMainAxisSpacing,
    double? gridDelegateChildAspectRatio,
    double? heightImage,
    double? spaceBetweenTextImage,
    double? textHeight,
    int? textMaxLines,
    double? heightImageDetail,
    double? spaceBetweenText,
    double? sizeImageLoading,
    TextStyle? textStyle,
    TextStyle? textDateStyle,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
  }) {
    return ProfileBadgeGridTheme(
      gridDelegateCrossAxisCount: gridDelegateCrossAxisCount ?? this.gridDelegateCrossAxisCount,
      gridDelegateCrossAxisSpacing: gridDelegateCrossAxisSpacing ?? this.gridDelegateCrossAxisSpacing,
      gridDelegateMainAxisSpacing: gridDelegateMainAxisSpacing ?? this.gridDelegateMainAxisSpacing,
      gridDelegateChildAspectRatio: gridDelegateChildAspectRatio ?? this.gridDelegateChildAspectRatio,
      heightImage: heightImage ?? this.heightImage,
      spaceBetweenTextImage: spaceBetweenTextImage ?? this.spaceBetweenTextImage,
      textHeight: textHeight ?? this.textHeight,
      textMaxLines: textMaxLines ?? this.textMaxLines,
      heightImageDetail: heightImageDetail ?? this.heightImageDetail,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      sizeImageLoading: sizeImageLoading ?? this.sizeImageLoading,
      textStyle: textStyle ?? this.textStyle,
      textDateStyle: textDateStyle ?? this.textDateStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
    );
  }

  @override
  ProfileBadgeGridTheme lerp(ThemeExtension<ProfileBadgeGridTheme>? other, double t) {
    if (other is! ProfileBadgeGridTheme) return this;
    return ProfileBadgeGridTheme(
      gridDelegateCrossAxisCount: gridDelegateCrossAxisCount,
      gridDelegateCrossAxisSpacing: gridDelegateCrossAxisSpacing + (other.gridDelegateCrossAxisSpacing - gridDelegateCrossAxisSpacing) * t,
      gridDelegateMainAxisSpacing: gridDelegateMainAxisSpacing + (other.gridDelegateMainAxisSpacing - gridDelegateMainAxisSpacing) * t,
      gridDelegateChildAspectRatio: gridDelegateChildAspectRatio + (other.gridDelegateChildAspectRatio - gridDelegateChildAspectRatio) * t,
      heightImage: heightImage + (other.heightImage - heightImage) * t,
      spaceBetweenTextImage: spaceBetweenTextImage + (other.spaceBetweenTextImage - spaceBetweenTextImage) * t,
      textHeight: textHeight + (other.textHeight - textHeight) * t,
      textMaxLines: textMaxLines,
      heightImageDetail: heightImageDetail + (other.heightImageDetail - heightImageDetail) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      sizeImageLoading: sizeImageLoading + (other.sizeImageLoading - sizeImageLoading) * t,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      textDateStyle: TextStyle.lerp(textDateStyle, other.textDateStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      descriptionStyle: TextStyle.lerp(descriptionStyle, other.descriptionStyle, t)!,
    );
  }
}