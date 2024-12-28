import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/utils/font/mushroom_go_font_utils.dart';

class ErrorContainer extends StatelessWidget {
  final String title;
  final String message;
  const ErrorContainer({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(DimensionConstant.radiusBorderInputTextInput),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(
                fontSize: DimensionConstant.titleSmall,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none
            ),),
            SizedBox(height: DimensionConstant.defaultPadding,),
            Text(message, style: TextStyle(
                fontSize: DimensionConstant.bodyText,
                color: Colors.white,
                decoration: TextDecoration.none
            ),),
            SizedBox(height: DimensionConstant.defaultPadding,),
            ButtonStandard(title: "OK", onTap: (){
              Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }
}
