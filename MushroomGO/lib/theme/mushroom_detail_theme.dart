import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class MushroomDetailTheme extends ThemeExtension<MushroomDetailTheme> {
  final double radiusItem;
  final double imageHeight;
  final double heightBetweenNameScientificName;
  final double widthBetweenNameScientificName;
  final double spaceBetweenText;
  final double paddingClassification;
  final double sizeIcon;
  final double widthTableBorder;
  final double sizeLoadImage;
  final double spaceBetweenTextMap;
  final double mapInitialZoom;
  final double heightMap;
  final double sizeMarkerMap;
  final TextStyle nameStyle;
  final TextStyle scientificNameText;
  final TextStyle scientificName;
  final TextStyle titleStyle;
  final TextStyle textStyle;

  const MushroomDetailTheme({
    this.radiusItem = DimensionConstant.radiusItemMushroomDetail,
    this.imageHeight = DimensionConstant.imageHeightMushroomDetail,
    this.heightBetweenNameScientificName = DimensionConstant.heightBetweenNameScientificNameMushroomDetail,
    this.widthBetweenNameScientificName = DimensionConstant.widthBetweenNameScientificNameMushroomDetail,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextMushroomDetail,
    this.paddingClassification = DimensionConstant.paddingClassificationMushroomDetail,
    this.sizeIcon = DimensionConstant.sizeIconMushroomDetail,
    this.widthTableBorder = DimensionConstant.widthTableBorderMushroomDetail,
    this.sizeLoadImage = DimensionConstant.sizeLoadImageMushroomDetail,
    this.spaceBetweenTextMap = DimensionConstant.spaceBetweenTextMapMushroomDetail,
    this.mapInitialZoom = DimensionConstant.mapInitialZoomMushroomDetail,
    this.heightMap = DimensionConstant.heightMapMushroomDetail,
    this.sizeMarkerMap = DimensionConstant.sizeMarkerMapMushroomDetail,
    this.nameStyle = TextStyleConstant.lightNameMushroomDetail,
    this.scientificNameText = TextStyleConstant.scientificNameTextMushroomDetail,
    this.scientificName = TextStyleConstant.lightScientificNameMushroomDetail,
    this.titleStyle = TextStyleConstant.lightTitleMushroomDetail,
    this.textStyle = TextStyleConstant.lightTextMushroomDetail,
  });

  @override
  MushroomDetailTheme copyWith({
    double? radiusItem,
    double? imageHeight,
    double? heightBetweenNameScientificName,
    double? widthBetweenNameScientificName,
    double? spaceBetweenText,
    double? paddingClassification,
    double? sizeIcon,
    double? widthTableBorder,
    double? sizeLoadImage,
    double? spaceBetweenTextMap,
    double? mapInitialZoom,
    double? heightMap,
    double? sizeMarkerMap,
    TextStyle? nameStyle,
    TextStyle? scientificNameText,
    TextStyle? scientificName,
    TextStyle? titleStyle,
    TextStyle? textStyle,
  }) {
    return MushroomDetailTheme(
      radiusItem: radiusItem ?? this.radiusItem,
      imageHeight: imageHeight ?? this.imageHeight,
      heightBetweenNameScientificName: heightBetweenNameScientificName ?? this.heightBetweenNameScientificName,
      widthBetweenNameScientificName: widthBetweenNameScientificName ?? this.widthBetweenNameScientificName,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      paddingClassification: paddingClassification ?? this.paddingClassification,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      widthTableBorder: widthTableBorder ?? this.widthTableBorder,
      sizeLoadImage: sizeLoadImage ?? this.sizeLoadImage,
      spaceBetweenTextMap: spaceBetweenTextMap ?? this.spaceBetweenTextMap,
      mapInitialZoom: mapInitialZoom ?? this.mapInitialZoom,
      heightMap: heightMap ?? this.heightMap,
      sizeMarkerMap: sizeMarkerMap ?? this.sizeMarkerMap,
      nameStyle: nameStyle ?? this.nameStyle,
      scientificNameText: scientificNameText ?? this.scientificNameText,
      scientificName: scientificName ?? this.scientificName,
      titleStyle: titleStyle ?? this.titleStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  MushroomDetailTheme lerp(ThemeExtension<MushroomDetailTheme>? other, double t) {
    if (other is! MushroomDetailTheme) return this;
    return MushroomDetailTheme(
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      imageHeight: imageHeight + (other.imageHeight - imageHeight) * t,
      heightBetweenNameScientificName: heightBetweenNameScientificName + (other.heightBetweenNameScientificName - heightBetweenNameScientificName) * t,
      widthBetweenNameScientificName: widthBetweenNameScientificName + (other.widthBetweenNameScientificName - widthBetweenNameScientificName) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      paddingClassification: paddingClassification + (other.paddingClassification - paddingClassification) * t,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      widthTableBorder: widthTableBorder + (other.widthTableBorder - widthTableBorder) * t,
      sizeLoadImage: sizeLoadImage + (other.sizeLoadImage - sizeLoadImage) * t,
      spaceBetweenTextMap: spaceBetweenTextMap + (other.spaceBetweenTextMap - spaceBetweenTextMap) * t,
      mapInitialZoom: mapInitialZoom + (other.mapInitialZoom - mapInitialZoom) * t,
      heightMap: heightMap + (other.heightMap - heightMap) * t,
      sizeMarkerMap: sizeMarkerMap + (other.sizeMarkerMap - sizeMarkerMap) * t,
      nameStyle: TextStyle.lerp(nameStyle, other.nameStyle, t)!,
      scientificNameText: TextStyle.lerp(scientificNameText, other.scientificNameText, t)!,
      scientificName: TextStyle.lerp(scientificName, other.scientificName, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }
}
