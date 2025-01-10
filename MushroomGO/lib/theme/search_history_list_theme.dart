import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class SearchHistoryListTheme extends ThemeExtension<SearchHistoryListTheme> {
  final double padding;
  final double sizeLeftIcon;
  final double sizeRightIcon;
  final Color colorLeftIcon;
  final Color colorRightIcon;

  const SearchHistoryListTheme({
    this.padding = DimensionConstant.paddingSearchHistoryList,
    this.sizeLeftIcon = DimensionConstant.sizeLeftIconSearchHistoryList,
    this.sizeRightIcon = DimensionConstant.sizeRightIconSearchHistoryList,
    this.colorLeftIcon = ColorConstant.leftIconSearchHistoryList,
    this.colorRightIcon = ColorConstant.rightIconSearchHistoryList
  });

  @override
  SearchHistoryListTheme copyWith({
    double? padding,
    double? sizeLeftIcon,
    double? sizeRightIcon,
    Color? colorLeftIcon,
    Color? colorRightIcon
  }) {
    return SearchHistoryListTheme(
      padding: padding ?? this.padding,
      sizeLeftIcon: sizeLeftIcon ?? this.sizeLeftIcon,
      sizeRightIcon: sizeRightIcon ?? this.sizeRightIcon,
      colorLeftIcon: colorLeftIcon ?? this.colorLeftIcon,
      colorRightIcon: colorRightIcon ?? this.colorRightIcon
    );
  }

  @override
  SearchHistoryListTheme lerp(covariant ThemeExtension<SearchHistoryListTheme>? other, double t) {
    if (other is! SearchHistoryListTheme) return this;
    return SearchHistoryListTheme(
      padding: padding + (other.padding - padding) * t,
      sizeLeftIcon: sizeLeftIcon + (other.sizeLeftIcon - sizeLeftIcon) * t,
      sizeRightIcon: sizeRightIcon + (other.sizeRightIcon - sizeRightIcon) * t,
      colorLeftIcon: Color.lerp(colorLeftIcon, other.colorLeftIcon, t)!,
      colorRightIcon: Color.lerp(colorRightIcon, other.colorRightIcon, t)!,
    );
  }
}
