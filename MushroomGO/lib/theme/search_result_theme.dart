import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class SearchResultTheme extends ThemeExtension<SearchResultTheme> {
  final double radiusItem;
  final double defaultPadding;
  final double imageWidthHeight;
  final double spaceBetweenItem;
  final double heightBetweenNameScientificName;
  final TextStyle titleStyle;
  final TextStyle scientificNameStyle;

  const SearchResultTheme({
    this.radiusItem = DimensionConstant.itemRadiusSearchResultPage,
    this.defaultPadding = DimensionConstant.defaultPaddingSearchResultPage,
    this.imageWidthHeight = DimensionConstant.imageWidthHeightSearchResultPage,
    this.spaceBetweenItem = DimensionConstant.spaceBetweenItemSearchResultPage,
    this.heightBetweenNameScientificName = DimensionConstant.heightBetweenNameScientificNameSearchResultPage,
    this.titleStyle = TextStyleConstant.lightTitleSearchResultPage,
    this.scientificNameStyle = TextStyleConstant.scientificNameSearchResultPage,
  });

  @override
  SearchResultTheme copyWith({
    double? radiusItem,
    double? defaultPadding,
    double? imageWidthHeight,
    double? spaceBetweenItem,
    double? heightBetweenNameScientificName,
    TextStyle? titleStyle,
    TextStyle? scientificNameStyle,
  }) {
    return SearchResultTheme(
      radiusItem: radiusItem ?? this.radiusItem,
      defaultPadding: defaultPadding ?? this.defaultPadding,
      imageWidthHeight: imageWidthHeight ?? this.imageWidthHeight,
      spaceBetweenItem: spaceBetweenItem ?? this.spaceBetweenItem,
      heightBetweenNameScientificName: heightBetweenNameScientificName ?? this.heightBetweenNameScientificName,
      titleStyle: titleStyle ?? this.titleStyle,
      scientificNameStyle: scientificNameStyle ?? this.scientificNameStyle,
    );
  }

  @override
  SearchResultTheme lerp(covariant ThemeExtension<SearchResultTheme>? other, double t) {
    if (other is! SearchResultTheme) return this;
    return SearchResultTheme(
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      defaultPadding: defaultPadding + (other.defaultPadding - defaultPadding) * t,
      imageWidthHeight: imageWidthHeight + (other.imageWidthHeight - imageWidthHeight) * t,
      spaceBetweenItem: spaceBetweenItem + (other.spaceBetweenItem - spaceBetweenItem) * t,
      heightBetweenNameScientificName: heightBetweenNameScientificName + (other.heightBetweenNameScientificName - heightBetweenNameScientificName) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      scientificNameStyle: TextStyle.lerp(scientificNameStyle, other.scientificNameStyle, t)!,
    );
  }
}
