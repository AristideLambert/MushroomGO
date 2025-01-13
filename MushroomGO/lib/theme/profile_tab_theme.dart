import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';

class ProfileTabTheme extends ThemeExtension<ProfileTabTheme> {
  final Color iconColor;
  final TextStyle selectedItemStyle;
  final TextStyle unSelectedItemStyle;

  const ProfileTabTheme({
    this.iconColor = ColorConstant.lightIconProfileTab,
    this.selectedItemStyle = TextStyleConstant.lightSelectedItemProfileTab,
    this.unSelectedItemStyle = TextStyleConstant.lightUnselectedItemProfileTab
  });

  @override
  ProfileTabTheme copyWith({
    Color? iconColor,
    TextStyle? selectedItemStyle,
    TextStyle? unSelectedItemStyle,
  }) {
    return ProfileTabTheme(
      iconColor: iconColor ?? this.iconColor,
      selectedItemStyle: selectedItemStyle ?? this.selectedItemStyle,
      unSelectedItemStyle: unSelectedItemStyle ?? this.unSelectedItemStyle,
    );
  }

  @override
  ProfileTabTheme lerp(ThemeExtension<ProfileTabTheme>? other, double t) {
    if (other is! ProfileTabTheme) return this;
    return ProfileTabTheme(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      selectedItemStyle: TextStyle.lerp(selectedItemStyle, other.selectedItemStyle, t)!,
      unSelectedItemStyle: TextStyle.lerp(unSelectedItemStyle, other.unSelectedItemStyle, t)!,
    );
  }
}
