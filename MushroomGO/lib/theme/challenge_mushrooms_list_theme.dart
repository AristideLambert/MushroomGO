import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class ChallengeMushroomsListTheme extends ThemeExtension<ChallengeMushroomsListTheme> {
  final double identTitle;
  final double paddingBetweenItem;
  final double widthItem;
  final double sizeImageItem;
  final double heightTitleItem;
  final double radiusItem;
  final double space;
  final double lockerSize;
  final double alphaColor;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle titleItemStyle;

  const ChallengeMushroomsListTheme({
    this.identTitle = DimensionConstant.identTitleChallengeMushroomsList,
    this.paddingBetweenItem = DimensionConstant.paddingBetweenItemChallengeMushroomsList,
    this.widthItem = DimensionConstant.widthItemChallengeMushroomsList,
    this.sizeImageItem = DimensionConstant.sizeImageItemChallengeMushroomsList,
    this.heightTitleItem = DimensionConstant.heightTitleItemChallengeMushroomsList,
    this.radiusItem = DimensionConstant.radiusItemChallengeMushroomsList,
    this.lockerSize = DimensionConstant.lockerSizeChallengeMushroomsList,
    this.alphaColor = DimensionConstant.alphaColorChallengeMushroomsList,
    this.titleItemStyle = TextStyleConstant.lightTitleItemChallengeMushroomsList,
    this.titleStyle = TextStyleConstant.lightTitleChallengeMushroomsList,
    this.backgroundColor = ColorConstant.lightBackgroundChallengeMushroomsList,
    this.space = DimensionConstant.spaceChallengeMushroomsList
  });

  @override
  ChallengeMushroomsListTheme copyWith({
    double? identTitle,
    double? paddingBetweenItem,
    double? widthItem,
    double? sizeImageItem,
    double? heightTitleItem,
    double? radiusItem,
    double? space,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? titleItemStyle
  }) {
    return ChallengeMushroomsListTheme(
      identTitle: identTitle ?? this.identTitle,
      paddingBetweenItem: paddingBetweenItem ?? this.paddingBetweenItem,
      widthItem: widthItem ?? this.widthItem,
      sizeImageItem: sizeImageItem ?? this.sizeImageItem,
      heightTitleItem: heightTitleItem ?? this.heightTitleItem,
      radiusItem: radiusItem ?? this.radiusItem,
      space: space ?? this.space,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      titleItemStyle: titleItemStyle ?? this.titleItemStyle,
    );
  }

  @override
  ChallengeMushroomsListTheme lerp(ThemeExtension<ChallengeMushroomsListTheme>? other, double t) {
    if (other is! ChallengeMushroomsListTheme) return this;
    return ChallengeMushroomsListTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      identTitle: identTitle + (other.identTitle - identTitle) * t,
      paddingBetweenItem: paddingBetweenItem + (other.paddingBetweenItem - paddingBetweenItem) * t,
      widthItem: widthItem + (other.widthItem - widthItem) * t,
      sizeImageItem: sizeImageItem + (other.sizeImageItem - sizeImageItem) * t,
      heightTitleItem: heightTitleItem + (other.heightTitleItem - heightTitleItem) * t,
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      space: space + (other.space - space) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      titleItemStyle: TextStyle.lerp(titleItemStyle, other.titleItemStyle, t)!,
    );
  }
}
