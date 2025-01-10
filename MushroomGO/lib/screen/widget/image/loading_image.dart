import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class LoadingImage extends StatelessWidget {
  final double size;

  const LoadingImage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DimensionConstant.radiusLoadingImage),
      child: Image.asset("assets/images/logo_loading.gif", height: size, width: size,)
    );
  }
}
