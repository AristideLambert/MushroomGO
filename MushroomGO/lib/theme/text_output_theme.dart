import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class TextOutputTheme extends ThemeExtension<TextOutputTheme> {
  final TextStyle captionStyle;
  final TextStyle bodyStyle;
  final TextStyle smallTitleStyle;
  final TextStyle mediumTitleStyle;
  final TextStyle largeTitleStyle;

  const TextOutputTheme({
    this.captionStyle = TextStyleConstant.lightCaptionTextOutput,
    this.bodyStyle = TextStyleConstant.lightBodyTextOutput,
    this.smallTitleStyle = TextStyleConstant.lightSmallTitleTextOutput,
    this.mediumTitleStyle = TextStyleConstant.lightMediumTitleTextOutput,
    this.largeTitleStyle = TextStyleConstant.lightLargeTitleTextOutput,
  });

  @override
  TextOutputTheme copyWith({
    TextStyle? captionStyle,
    TextStyle? bodyStyle,
    TextStyle? smallTitleStyle,
    TextStyle? mediumTitleStyle,
    TextStyle? largeTitleStyle,
  }) {
    return TextOutputTheme(
      captionStyle: captionStyle ?? this.captionStyle,
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
      captionStyle: TextStyle.lerp(captionStyle, other.captionStyle, t)!,
      bodyStyle: TextStyle.lerp(bodyStyle, other.bodyStyle, t)!,
      smallTitleStyle: TextStyle.lerp(smallTitleStyle, other.smallTitleStyle, t)!,
      mediumTitleStyle: TextStyle.lerp(mediumTitleStyle, other.mediumTitleStyle, t)!,
      largeTitleStyle: TextStyle.lerp(largeTitleStyle, other.largeTitleStyle, t)!,
    );
  }
}
