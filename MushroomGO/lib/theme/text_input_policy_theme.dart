import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class TextInputPolicyTheme extends ThemeExtension<TextInputPolicyTheme> {
  final Color respectColor;
  final Color notRespectColor;
  final double sizeIcon;
  final double space;
  final TextStyle policyStyle;

  const TextInputPolicyTheme({
    this.respectColor = ColorConstant.respectIconTextInputPolicy,
    this.notRespectColor = ColorConstant.notRespectIconTextInputPolicy,
    this.sizeIcon = DimensionConstant.sizeIconTextInputPolicy,
    this.space = DimensionConstant.spaceTextInputPolicy,
    this.policyStyle = TextStyleConstant.lightPolicyTextInputPolicy,
  });

  @override
  TextInputPolicyTheme copyWith({
    Color? respectColor,
    Color? notRespectColor,
    double? sizeIcon,
    double? space,
    TextStyle? policyStyle,
  }) {
    return TextInputPolicyTheme(
      respectColor: respectColor ?? this.respectColor,
      notRespectColor: notRespectColor ?? this.notRespectColor,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      space: space ?? this.space,
      policyStyle: policyStyle ?? this.policyStyle,
    );
  }

  @override
  TextInputPolicyTheme lerp(ThemeExtension<TextInputPolicyTheme>? other, double t) {
    if (other is! TextInputPolicyTheme) return this;
    return TextInputPolicyTheme(
      respectColor: Color.lerp(respectColor, other.respectColor, t)!,
      notRespectColor: Color.lerp(notRespectColor, other.notRespectColor, t)!,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      space: space + (other.space - space) * t,
      policyStyle: TextStyle.lerp(policyStyle, other.policyStyle, t)!,
    );
  }
}
