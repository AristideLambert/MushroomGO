import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class LoadingContainer extends StatelessWidget {
  final String message;
  const LoadingContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(DimensionConstant.radiusBorderInputTextInput),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(MushroomGOFontUtils.logo, color: Colors.white, size: 35,),
            SizedBox(height: DimensionConstant.defaultPadding,),
            Text(message, style: TextStyle(
              fontSize: DimensionConstant.bodyText,
              color: Colors.white,
              decoration: TextDecoration.none
            ),)
          ],
        ),
      ),
    );
  }
}
