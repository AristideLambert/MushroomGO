import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class MushroomDetailTheme extends ThemeExtension<MushroomDetailTheme> {
  final double radiusItem;
  final double imageHeight;
  final double spaceBetweenImageText;
  final double heightBetweenNameScientificName;
  final double widthBetweenNameScientificName;
  final double detailMargin;
  final double spaceBetweenText;
  final double paddingClassification;
  final double sizeIcon;
  final double widthTableBorder;
  final Color backgroundColor;
  final TextStyle nameStyle;
  final TextStyle scientificNameText;
  final TextStyle scientificName;
  final TextStyle titleStyle;
  final TextStyle textStyle;

  const MushroomDetailTheme({
    this.radiusItem = DimensionConstant.radiusItemMushroomDetail,
    this.imageHeight = DimensionConstant.imageHeightMushroomDetail,
    this.spaceBetweenImageText = DimensionConstant.spaceBetweenImageTextMushroomDetail,
    this.heightBetweenNameScientificName = DimensionConstant.heightBetweenNameScientificNameMushroomDetail,
    this.widthBetweenNameScientificName = DimensionConstant.widthBetweenNameScientificNameMushroomDetail,
    this.detailMargin = DimensionConstant.detailMarginNameMushroomDetail,
    this.spaceBetweenText = DimensionConstant.spaceBetweenTextMushroomDetail,
    this.paddingClassification = DimensionConstant.paddingClassificationMushroomDetail,
    this.sizeIcon = DimensionConstant.sizeIconMushroomDetail,
    this.widthTableBorder = DimensionConstant.widthTableBorderMushroomDetail,
    this.backgroundColor = ColorConstant.lightBackgroundMushroomDetail,
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
    double? spaceBetweenImageText,
    double? heightBetweenNameScientificName,
    double? widthBetweenNameScientificName,
    double? detailMargin,
    double? spaceBetweenText,
    double? paddingClassification,
    double? sizeIcon,
    double? widthTableBorder,
    Color? backgroundColor,
    TextStyle? nameStyle,
    TextStyle? scientificNameText,
    TextStyle? scientificName,
    TextStyle? titleStyle,
    TextStyle? textStyle,
  }) {
    return MushroomDetailTheme(
      radiusItem: radiusItem ?? this.radiusItem,
      imageHeight: imageHeight ?? this.imageHeight,
      spaceBetweenImageText: spaceBetweenImageText ?? this.spaceBetweenImageText,
      heightBetweenNameScientificName: heightBetweenNameScientificName ?? this.heightBetweenNameScientificName,
      widthBetweenNameScientificName: widthBetweenNameScientificName ?? this.widthBetweenNameScientificName,
      detailMargin: detailMargin ?? this.detailMargin,
      spaceBetweenText: spaceBetweenText ?? this.spaceBetweenText,
      paddingClassification: paddingClassification ?? this.paddingClassification,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      widthTableBorder: widthTableBorder ?? this.widthTableBorder,
      backgroundColor: backgroundColor ?? this.backgroundColor,
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
      spaceBetweenImageText: spaceBetweenImageText + (other.spaceBetweenImageText - spaceBetweenImageText) * t,
      heightBetweenNameScientificName: heightBetweenNameScientificName + (other.heightBetweenNameScientificName - heightBetweenNameScientificName) * t,
      widthBetweenNameScientificName: widthBetweenNameScientificName + (other.widthBetweenNameScientificName - widthBetweenNameScientificName) * t,
      detailMargin: detailMargin + (other.detailMargin - detailMargin) * t,
      spaceBetweenText: spaceBetweenText + (other.spaceBetweenText - spaceBetweenText) * t,
      paddingClassification: paddingClassification + (other.paddingClassification - paddingClassification) * t,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      widthTableBorder: widthTableBorder + (other.widthTableBorder - widthTableBorder) * t,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      nameStyle: TextStyle.lerp(nameStyle, other.nameStyle, t)!,
      scientificNameText: TextStyle.lerp(scientificNameText, other.scientificNameText, t)!,
      scientificName: TextStyle.lerp(scientificName, other.scientificName, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
    );
  }
}
