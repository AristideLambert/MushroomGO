import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ButtonSettingContainerTheme extends ThemeExtension<ButtonSettingContainerTheme> {
  final double indentDivider;
  final double indentTitle;
  final double space;
  final TextStyle titleStyle;

  const ButtonSettingContainerTheme({
    this.indentDivider = DimensionConstant.indentDividerButtonSettingContainer,
    this.indentTitle = DimensionConstant.indentTitleButtonSettingContainer,
    this.space = DimensionConstant.spaceButtonSettingContainer,
    this.titleStyle = TextStyleConstant.lightTitleButtonSettingContainer,
  });

  @override
  ButtonSettingContainerTheme copyWith({
    double? indentDivider,
    double? indentTitle,
    double? space,
    TextStyle? titleStyle,
  }) {
    return ButtonSettingContainerTheme(
      indentDivider: indentDivider ?? this.indentDivider,
      indentTitle: indentTitle ?? this.indentTitle,
      space: space ?? this.space,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  ButtonSettingContainerTheme lerp(ThemeExtension<ButtonSettingContainerTheme>? other, double t) {
    if (other is! ButtonSettingContainerTheme) return this;
    return ButtonSettingContainerTheme(
      indentDivider: indentDivider + (other.indentDivider - indentDivider) * t,
      indentTitle: indentTitle + (other.indentTitle - indentTitle) * t,
      space: space + (other.space - space) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }
}
