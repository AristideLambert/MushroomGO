import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class MushroomDetailTheme extends ThemeExtension<MushroomDetailTheme> {
  final double radiusItem;
  final double imageHeight;
  final double spaceBetweenImageText;
  final double boxShadowOpacity;
  final double boxShadowBlurRadius;
  final double boxShadowSpreadRadius;
  final double boxShadowMinOffset;
  final double boxShadowMaxOffset;
  final double heightBetweenNameScientificName;
  final double widthBetweenNameScientificName;
  final double detailMargin;
  final double spaceBetweenText;
  final double sizeIcon;
  final Color backgroundColor;
  final TextStyle nameStyle;
  final TextStyle scientificNameText;
  final TextStyle scientificName;
  final TextStyle titleStyle;


  const MushroomDetailTheme({
    this.radiusItem = DimensionConstant.radiusItemMushroomDetail,
    this.imageHeight = DimensionConstant.imageHeightMushroomDetail,
    this.spaceBetweenImageText = DimensionConstant.spaceBetweenImageTextMushroomDetail,
    this.boxShadowOpacity = DimensionConstant.boxShadowOpacityMushroomDetail,
    this.boxShadowBlurRadius = DimensionConstant.boxShadowBlurRadiusMushroomDetail,
    this.boxShadowSpreadRadius = DimensionConstant.boxShadowSpreadRadiusMushroomDetail,
    this.boxShadowMinOffset = DimensionConstant.boxShadowMinOffsetMushroomDetail,
    this.boxShadowMaxOffset = DimensionConstant.boxShadowMaxOffsetMushroomDetail,
    this.heightBetweenNameScientificName = DimensionConstant.heightBetweenNameScientificNameMushroomDetail,
    this.widthBetweenNameScientificName = DimensionConstant.widthBetweenNameScientificNameMushroomDetail,
    this.detailMargin = DimensionConstant.detailMarginNameMushroomDetail,
    this.sizeIcon = DimensionConstant.sizeIconMushroomDetail,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextMushroomDetail,
    this.backgroundColor = ColorConstant.lightBackgroundMushroomDetail,
    this.nameStyle = TextStyleConstant.lightNameMushroomDetail,
    this.scientificNameText = TextStyleConstant.scientificNameTextMushroomDetail,
    this.scientificName = TextStyleConstant.lightScientificNameMushroomDetail,
    this.titleStyle = TextStyleConstant.lightTitleMushroomDetail,
  });

  @override
  ThemeExtension<MushroomDetailTheme> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<MushroomDetailTheme> lerp(covariant ThemeExtension<MushroomDetailTheme>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }

}