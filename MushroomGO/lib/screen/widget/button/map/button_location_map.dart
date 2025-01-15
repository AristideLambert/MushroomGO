import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';

class ButtonLocationMap extends StatelessWidget {
  final Function()? onTap;

  const ButtonLocationMap({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DimensionConstant.sizeButtonLocationMap,
        height: DimensionConstant.sizeButtonLocationMap,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          // TODO: Update icon
          child: Icon(
            CupertinoIcons.location_fill,
            color: Theme.of(context).primaryColor,
            size: DimensionConstant.iconSizeButtonLocationMap,
          ),
        ),
      ),
    );
  }
}
