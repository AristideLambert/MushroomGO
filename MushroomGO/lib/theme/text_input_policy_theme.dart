import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class TextInputPolicyTheme extends ThemeExtension<TextInputPolicyTheme> {
  final Color respect;
  final Color notRespect;
  final double sizeIcon;
  final double space;
  final TextStyle policyStyle;

  const TextInputPolicyTheme({
    this.respect = ColorConstant.respectIconTextInputPolicy,
    this.notRespect = ColorConstant.notRespectIconTextInputPolicy,
    this.sizeIcon = DimensionConstant.sizeIconTextInputPolicy,
    this.space = DimensionConstant.spaceTextInputPolicy,
    this.policyStyle = TextStyleConstant.lightPolicyTextInputPolicy,
  });

  @override
  TextInputPolicyTheme copyWith({
    Color? respect,
    Color? notRespect,
    double? sizeIcon,
    double? space,
    TextStyle? policyStyle,
  }) {
    return TextInputPolicyTheme(
      respect: respect ?? this.respect,
      notRespect: notRespect ?? this.notRespect,
      sizeIcon: sizeIcon ?? this.sizeIcon,
      space: space ?? this.space,
      policyStyle: policyStyle ?? this.policyStyle,
    );
  }

  @override
  TextInputPolicyTheme lerp(ThemeExtension<TextInputPolicyTheme>? other, double t) {
    if (other is! TextInputPolicyTheme) return this;
    return TextInputPolicyTheme(
      respect: Color.lerp(respect, other.respect, t)!,
      notRespect: Color.lerp(notRespect, other.notRespect, t)!,
      sizeIcon: sizeIcon + (other.sizeIcon - sizeIcon) * t,
      space: space + (other.space - space) * t,
      policyStyle: TextStyle.lerp(policyStyle, other.policyStyle, t)!,
    );
  }
}
