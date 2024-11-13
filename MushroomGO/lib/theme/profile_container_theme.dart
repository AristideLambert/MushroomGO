import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class ProfileContainerTheme extends ThemeExtension<ProfileContainerTheme> {
  final Color backgroundColor;
  final Color chevronColor;
  final double padding;
  final double radius;
  final double radiusCircleAvatar;
  final double sizeChevron;
  final double space;
  final TextStyle nameStyle;
  final TextStyle mailStyle;

  const ProfileContainerTheme({
    this.backgroundColor = ColorConstant.lightBackgroundProfileContainer,
    this.chevronColor = ColorConstant.lightMailProfileContainer,
    this.padding = DimensionConstant.paddingProfileContainer,
    this.radius = DimensionConstant.radiusProfileContainer,
    this.radiusCircleAvatar = DimensionConstant.circleAvatarRadiusProfileContainer,
    this.sizeChevron = DimensionConstant.chevronSizeProfileContainer,
    this.space = DimensionConstant.spaceProfileContainer,
    this.nameStyle = TextStyleConstant.lightNameProfileContainer,
    this.mailStyle = TextStyleConstant.lightMailProfileContainer,
  });

  @override
  ProfileContainerTheme copyWith({
    Color? backgroundColor,
    Color? chevronColor,
    double? padding,
    double? radius,
    double? radiusCircleAvatar,
    double? sizeChevron,
    double? space,
    TextStyle? nameStyle,
    TextStyle? mailStyle,
  }) {
    return ProfileContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      chevronColor: chevronColor ?? this.chevronColor,
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      radiusCircleAvatar: radiusCircleAvatar ?? this.radiusCircleAvatar,
      sizeChevron: sizeChevron ?? this.sizeChevron,
      space: space ?? this.space,
      nameStyle: nameStyle ?? this.nameStyle,
      mailStyle: mailStyle ?? this.mailStyle,
    );
  }

  @override
  ProfileContainerTheme lerp(ThemeExtension<ProfileContainerTheme>? other, double t) {
    if (other is! ProfileContainerTheme) return this;
    return ProfileContainerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      chevronColor: Color.lerp(chevronColor, other.chevronColor, t)!,
      padding: padding + (other.padding - padding) * t,
      radius: radius + (other.radius - radius) * t,
      radiusCircleAvatar: radiusCircleAvatar + (other.radiusCircleAvatar - radiusCircleAvatar) * t,
      sizeChevron: sizeChevron + (other.sizeChevron - sizeChevron) * t,
      space: space + (other.space - space) * t,
      nameStyle: TextStyle.lerp(nameStyle, other.nameStyle, t)!,
      mailStyle: TextStyle.lerp(mailStyle, other.mailStyle, t)!,
    );
  }
}
