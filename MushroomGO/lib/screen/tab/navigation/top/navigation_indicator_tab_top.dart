import 'package:flutter/material.dart';

class NavigationIndicatorTabTop extends Decoration {
  final Color color;
  final double width;
  final double height;
  final double margin;

  const NavigationIndicatorTabTop({required this.color, required this.width, required this.height, required this.margin});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _NavigationIndicatorTabTop(color: color, width: width, height: height, margin: margin);
  }
}

class _NavigationIndicatorTabTop extends BoxPainter {
  final Color color;
  final double width;
  final double height;
  final double margin;

  _NavigationIndicatorTabTop({required this.color, required this.width, required this.height, required this.margin});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = color;
    final Rect rect = Rect.fromLTWH(
      offset.dx + (configuration.size!.width - width) / 2,
      configuration.size!.height - height + margin,
      width,
      height,
    );
    canvas.drawRect(rect, paint);
  }
}