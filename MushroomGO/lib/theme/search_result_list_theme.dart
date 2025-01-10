import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class SearchResultListTheme extends ThemeExtension<SearchResultListTheme> {
  final double radiusItem;
  final double defaultPadding;
  final double imageWidthHeight;
  final double spaceBetweenItem;
  final double heightBetweenNameScientificName;
  final double sizeLoadingImage;
  final Color rightIconColor;
  final TextStyle titleStyle;
  final TextStyle scientificNameStyle;

  const SearchResultListTheme({
    this.radiusItem = DimensionConstant.itemRadiusSearchResultList,
    this.defaultPadding = DimensionConstant.defaultPaddingSearchResultList,
    this.imageWidthHeight = DimensionConstant.imageWidthHeightSearchResultList,
    this.spaceBetweenItem = DimensionConstant.spaceBetweenItemSearchResultList,
    this.heightBetweenNameScientificName = DimensionConstant.heightBetweenNameScientificNameSearchResultList,
    this.sizeLoadingImage = DimensionConstant.sizeLoadingImageSearchResultList,
    this.rightIconColor = ColorConstant.rightIconSearchResultList,
    this.titleStyle = TextStyleConstant.lightTitleSearchResultList,
    this.scientificNameStyle = TextStyleConstant.scientificNameSearchResultList,
  });

  @override
  SearchResultListTheme copyWith({
    double? radiusItem,
    double? defaultPadding,
    double? imageWidthHeight,
    double? spaceBetweenItem,
    double? heightBetweenNameScientificName,
    double? sizeLoadingImage,
    Color? rightIconColor,
    TextStyle? titleStyle,
    TextStyle? scientificNameStyle,
  }) {
    return SearchResultListTheme(
      radiusItem: radiusItem ?? this.radiusItem,
      defaultPadding: defaultPadding ?? this.defaultPadding,
      imageWidthHeight: imageWidthHeight ?? this.imageWidthHeight,
      spaceBetweenItem: spaceBetweenItem ?? this.spaceBetweenItem,
      heightBetweenNameScientificName: heightBetweenNameScientificName ?? this.heightBetweenNameScientificName,
      sizeLoadingImage: sizeLoadingImage ?? this.sizeLoadingImage,
      rightIconColor: rightIconColor ?? this.rightIconColor,
      titleStyle: titleStyle ?? this.titleStyle,
      scientificNameStyle: scientificNameStyle ?? this.scientificNameStyle,
    );
  }

  @override
  SearchResultListTheme lerp(covariant ThemeExtension<SearchResultListTheme>? other, double t) {
    if (other is! SearchResultListTheme) return this;
    return SearchResultListTheme(
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      defaultPadding: defaultPadding + (other.defaultPadding - defaultPadding) * t,
      imageWidthHeight: imageWidthHeight + (other.imageWidthHeight - imageWidthHeight) * t,
      spaceBetweenItem: spaceBetweenItem + (other.spaceBetweenItem - spaceBetweenItem) * t,
      heightBetweenNameScientificName: heightBetweenNameScientificName + (other.heightBetweenNameScientificName - heightBetweenNameScientificName) * t,
      sizeLoadingImage: sizeLoadingImage + (other.sizeLoadingImage - sizeLoadingImage) * t,
      rightIconColor: Color.lerp(rightIconColor, other.rightIconColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      scientificNameStyle: TextStyle.lerp(scientificNameStyle, other.scientificNameStyle, t)!,
    );
  }
}
