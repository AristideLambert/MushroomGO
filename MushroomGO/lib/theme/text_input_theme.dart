import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class TextInputTheme extends ThemeExtension<TextInputTheme> {
  final Color selectionCursorColor;
  final Color borderInputColor;
  final Color leftIconColor;
  final Color rightIconColor;
  final double leftPaddingTitle;
  final double bottomPaddingTitle;
  final double heightInput;
  final double sizeLeftIcon;
  final double marginLeftIcon;
  final double sizeRightIcon;
  final double marginRightIcon;
  final double leftPaddingInput;
  final double leftPaddingInputIcon;
  final double rightPaddingInput;
  final double rightPaddingInputIcon;
  final double borderInput;
  final double radiusBorderInput;
  final double leftPaddingPolicy;
  final double topPaddingPolicy;
  final TextStyle titleStyle;
  final TextStyle placeHolderStyle;
  final TextStyle inputStyle;

  const TextInputTheme({
    this.selectionCursorColor = ColorConstant.selectionCursorTextInput,
    this.borderInputColor = ColorConstant.borderInputTextInput,
    this.leftIconColor = ColorConstant.leftIconTextInput,
    this.rightIconColor = ColorConstant.rightIconTextInput,
    this.leftPaddingTitle = DimensionConstant.leftPaddingTitleTextInput,
    this.bottomPaddingTitle = DimensionConstant.bottomPaddingTitleTextInput,
    this.heightInput = DimensionConstant.heightInputTextInput,
    this.sizeLeftIcon = DimensionConstant.sizeLeftIconTextInput,
    this.marginLeftIcon = DimensionConstant.marginLeftIconTextInput,
    this.sizeRightIcon = DimensionConstant.sizeRightIconTextInput,
    this.marginRightIcon = DimensionConstant.marginRightIconTextInput,
    this.leftPaddingInput = DimensionConstant.leftPaddingInputTextInput,
    this.leftPaddingInputIcon = DimensionConstant.leftPaddingInputIconTextInput,
    this.rightPaddingInput = DimensionConstant.rightPaddingInputTextInput,
    this.rightPaddingInputIcon = DimensionConstant.rightPaddingInputIconTextInput,
    this.borderInput = DimensionConstant.borderInputTextInput,
    this.radiusBorderInput = DimensionConstant.radiusBorderInputTextInput,
    this.leftPaddingPolicy = DimensionConstant.leftPaddingPolicyTextInput,
    this.topPaddingPolicy = DimensionConstant.topPaddingPolicyTextInput,
    this.titleStyle = TextStyleConstant.lightTitleTextInput,
    this.placeHolderStyle = TextStyleConstant.lightPlaceHolderTextInput,
    this.inputStyle = TextStyleConstant.lightInputTextInput,
  });

  @override
  TextInputTheme copyWith({
    Color? selectionCursorColor,
    Color? borderInputColor,
    Color? leftIconColor,
    Color? rightIconColor,
    double? leftPaddingTitle,
    double? bottomPaddingTitle,
    double? heightInput,
    double? sizeLeftIcon,
    double? marginLeftIcon,
    double? sizeRightIcon,
    double? marginRightIcon,
    double? leftPaddingInput,
    double? leftPaddingInputIcon,
    double? rightPaddingInput,
    double? rightPaddingInputIcon,
    double? borderInput,
    double? radiusBorderInput,
    double? leftPaddingPolicy,
    double? topPaddingPolicy,
    TextStyle? titleStyle,
    TextStyle? placeHolderStyle,
    TextStyle? inputStyle,
  }) {
    return TextInputTheme(
      selectionCursorColor: selectionCursorColor ?? this.selectionCursorColor,
      borderInputColor: borderInputColor ?? this.borderInputColor,
      leftIconColor: leftIconColor ?? this.leftIconColor,
      rightIconColor: rightIconColor ?? this.rightIconColor,
      leftPaddingTitle: leftPaddingTitle ?? this.leftPaddingTitle,
      bottomPaddingTitle: bottomPaddingTitle ?? this.bottomPaddingTitle,
      heightInput: heightInput ?? this.heightInput,
      sizeLeftIcon: sizeLeftIcon ?? this.sizeLeftIcon,
      marginLeftIcon: marginLeftIcon ?? this.marginLeftIcon,
      sizeRightIcon: sizeRightIcon ?? this.sizeRightIcon,
      marginRightIcon: marginRightIcon ?? this.marginRightIcon,
      leftPaddingInput: leftPaddingInput ?? this.leftPaddingInput,
      leftPaddingInputIcon: leftPaddingInputIcon ?? this.leftPaddingInputIcon,
      rightPaddingInput: rightPaddingInput ?? this.rightPaddingInput,
      rightPaddingInputIcon: rightPaddingInputIcon ?? this.rightPaddingInputIcon,
      borderInput: borderInput ?? this.borderInput,
      radiusBorderInput: radiusBorderInput ?? this.radiusBorderInput,
      leftPaddingPolicy: leftPaddingPolicy ?? this.leftPaddingPolicy,
      topPaddingPolicy: topPaddingPolicy ?? this.topPaddingPolicy,
      titleStyle: titleStyle ?? this.titleStyle,
      placeHolderStyle: placeHolderStyle ?? this.placeHolderStyle,
      inputStyle: inputStyle ?? this.inputStyle,
    );
  }

  @override
  TextInputTheme lerp(ThemeExtension<TextInputTheme>? other, double t) {
    if (other is! TextInputTheme) return this;
    return TextInputTheme(
      selectionCursorColor: Color.lerp(selectionCursorColor, other.selectionCursorColor, t)!,
      borderInputColor: Color.lerp(borderInputColor, other.borderInputColor, t)!,
      leftIconColor: Color.lerp(leftIconColor, other.leftIconColor, t)!,
      rightIconColor: Color.lerp(rightIconColor, other.rightIconColor, t)!,
      leftPaddingTitle: leftPaddingTitle + (other.leftPaddingTitle - leftPaddingTitle) * t,
      bottomPaddingTitle: bottomPaddingTitle + (other.bottomPaddingTitle - bottomPaddingTitle) * t,
      heightInput: heightInput + (other.heightInput - heightInput) * t,
      sizeLeftIcon: sizeLeftIcon + (other.sizeLeftIcon - sizeLeftIcon) * t,
      marginLeftIcon: marginLeftIcon + (other.marginLeftIcon - marginLeftIcon) * t,
      sizeRightIcon: sizeRightIcon + (other.sizeRightIcon - sizeRightIcon) * t,
      marginRightIcon: marginRightIcon + (other.marginRightIcon - marginRightIcon) * t,
      leftPaddingInput: leftPaddingInput + (other.leftPaddingInput - leftPaddingInput) * t,
      leftPaddingInputIcon: leftPaddingInputIcon + (other.leftPaddingInputIcon - leftPaddingInputIcon) * t,
      rightPaddingInput: rightPaddingInput + (other.rightPaddingInput - rightPaddingInput) * t,
      rightPaddingInputIcon: rightPaddingInputIcon + (other.rightPaddingInputIcon - rightPaddingInputIcon) * t,
      borderInput: borderInput + (other.borderInput - borderInput) * t,
      radiusBorderInput: radiusBorderInput + (other.radiusBorderInput - radiusBorderInput) * t,
      leftPaddingPolicy: leftPaddingPolicy + (other.leftPaddingPolicy - leftPaddingPolicy) * t,
      topPaddingPolicy: topPaddingPolicy + (other.topPaddingPolicy - topPaddingPolicy) * t,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      placeHolderStyle: TextStyle.lerp(placeHolderStyle, other.placeHolderStyle, t)!,
      inputStyle: TextStyle.lerp(inputStyle, other.inputStyle, t)!,
    );
  }
}