import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class LoadingContainerTheme extends ThemeExtension<LoadingContainerTheme> {
  final double padding;
  final double radius;
  final double iconSize;
  final double space;

  const LoadingContainerTheme({
    this.padding = DimensionConstant.paddingLoadingContainer,
    this.radius = DimensionConstant.radiusLoadingContainer,
    this.iconSize = DimensionConstant.iconSizeLoadingContainer,
    this.space = DimensionConstant.spaceLoadingContainer
  });

  @override
  LoadingContainerTheme copyWith({
    double? padding,
    double? radius,
    double? iconSize,
    double? space
  }) {
    return LoadingContainerTheme(
      padding: padding ?? this.padding,
      radius: radius ?? this.radius,
      iconSize: iconSize ?? this.iconSize,
      space: space ?? this.space
    );
  }

  @override
  LoadingContainerTheme lerp(ThemeExtension<LoadingContainerTheme>? other, double t) {
    if (other is! LoadingContainerTheme) return this;
    return LoadingContainerTheme(
      padding: padding + (other.padding - padding) * t,
      radius: radius + (other.radius - radius) * t,
      iconSize: iconSize + (other.iconSize - iconSize) * t,
      space: space + (other.space - space) * t
    );
  }
}