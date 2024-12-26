import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class HomeForYouListTheme extends ThemeExtension<HomeForYouListTheme> {
  final double identTitle;
  final double paddingBetweenItem;
  final double widthItem;
  final double sizeImageItem;
  final double heightTitleItem;
  final double textPadding;
  final double radiusItem;
  final double space;
  final double textOpacity;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle titleItemStyle;
  final TextStyle itemStyle;

  const HomeForYouListTheme({
    this.identTitle = DimensionConstant.identTitleHomeForYouList,
    this.textPadding = DimensionConstant.textPaddingHomeForYouList,
    this.textOpacity = DimensionConstant.textOpacityHomeForYouList,
    this.paddingBetweenItem = DimensionConstant.paddingBetweenItemHomeForYouList,
    this.widthItem = DimensionConstant.widthItemHomeForYouList,
    this.sizeImageItem = DimensionConstant.sizeImageItemHomeForYouList,
    this.heightTitleItem = DimensionConstant.heightTitleItemHomeForYouList,
    this.radiusItem = DimensionConstant.radiusItemHomeNewsList,
    this.titleItemStyle = TextStyleConstant.lightTitleItemHomeForYouList,
    this.titleStyle = TextStyleConstant.lightTitleHomeNewsList,
    this.backgroundColor = ColorConstant.lightBackgroundHomeNewsList,
    this.space = DimensionConstant.spaceHomeForYouList,
    this.itemStyle = TextStyleConstant.lightItemStyleHomeNewsList
  });

  @override
  HomeForYouListTheme copyWith({
    double? identTitle,
    double? paddingBetweenItem,
    double? widthItem,
    double? sizeImageItem,
    double? heightTitleItem,
    double? textPadding,
    double? radiusItem,
    double? space,
    double? textOpacity,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? titleItemStyle,
    TextStyle? itemStyle,
  }) {
    return HomeForYouListTheme(
      identTitle: identTitle ?? this.identTitle,
      paddingBetweenItem: paddingBetweenItem ?? this.paddingBetweenItem,
      widthItem: widthItem ?? this.widthItem,
      sizeImageItem: sizeImageItem ?? this.sizeImageItem,
      heightTitleItem: heightTitleItem ?? this.heightTitleItem,
      textPadding: textPadding ?? this.textPadding,
      radiusItem: radiusItem ?? this.radiusItem,
      space: space ?? this.space,
      textOpacity: textOpacity ?? this.textOpacity,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleStyle: titleStyle ?? this.titleStyle,
      titleItemStyle: titleItemStyle ?? this.titleItemStyle,
      itemStyle: itemStyle ?? this.itemStyle,
    );
  }

  @override
  HomeForYouListTheme lerp(ThemeExtension<HomeForYouListTheme>? other, double t) {
    if (other is! HomeForYouListTheme) return this;

    return HomeForYouListTheme(
      identTitle: identTitle + (other.identTitle - identTitle) * t,
      paddingBetweenItem: paddingBetweenItem + (other.paddingBetweenItem - paddingBetweenItem) * t,
      widthItem: widthItem + (other.widthItem - widthItem) * t,
      sizeImageItem: sizeImageItem + (other.sizeImageItem - sizeImageItem) * t,
      heightTitleItem: heightTitleItem + (other.heightTitleItem - heightTitleItem) * t,
      textPadding: textPadding + (other.textPadding - textPadding) * t,
      radiusItem: radiusItem + (other.radiusItem - radiusItem) * t,
      space: space + (other.space - space) * t,
      textOpacity: textOpacity + (other.textOpacity - textOpacity) * t,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      titleItemStyle: TextStyle.lerp(titleItemStyle, other.titleItemStyle, t)!,
      itemStyle: TextStyle.lerp(itemStyle, other.itemStyle, t)!,
    );
  }
}