import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class TextOutputTheme extends ThemeExtension<TextOutputTheme> {
  final TextStyle bodyStyle;
  final TextStyle smallTitleStyle;
  final TextStyle mediumTitleStyle;
  final TextStyle largeTitleStyle;

  const TextOutputTheme({
    this.bodyStyle = TextStyleConstant.lightBodyTextOutput,
    this.smallTitleStyle = TextStyleConstant.lightSmallTitleTextOutput,
    this.mediumTitleStyle = TextStyleConstant.lightMediumTitleTextOutput,
    this.largeTitleStyle = TextStyleConstant.lightLargeTitleTextOutput,
  });

  @override
  TextOutputTheme copyWith({
    TextStyle? bodyStyle,
    TextStyle? smallTitleStyle,
    TextStyle? mediumTitleStyle,
    TextStyle? largeTitleStyle,
  }) {
    return TextOutputTheme(
      bodyStyle: bodyStyle ?? this.bodyStyle,
      smallTitleStyle: smallTitleStyle ?? this.smallTitleStyle,
      mediumTitleStyle: mediumTitleStyle ?? this.mediumTitleStyle,
      largeTitleStyle: largeTitleStyle ?? this.largeTitleStyle,
    );
  }

  @override
  TextOutputTheme lerp(ThemeExtension<TextOutputTheme>? other, double t) {
    if (other is! TextOutputTheme) return this;
    return TextOutputTheme(
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t)!,
      smallTitleStyle: TextStyle.lerp(smallTitleStyle, other.smallTitleStyle, t)!,
      mediumTitleStyle: TextStyle.lerp(mediumTitleStyle, other.mediumTitleStyle, t)!,
      largeTitleStyle: TextStyle.lerp(largeTitleStyle, other.largeTitleStyle, t)!,
    );
  }
}
