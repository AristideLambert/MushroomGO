import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/text/text_output.dart';

class BenefitContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const BenefitContainer({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: DimensionConstant.iconSizeBenefitContainer, color: ColorConstant.textPrimaryColor),
        SizedBox(width: DimensionConstant.spaceBenefitContainer),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextOutput(
              text: title,
              type: Type.largeTitle,
              fontColor: ColorConstant.textPrimaryColor,
            ),
            TextOutput(
              text: description,
              fontColor: ColorConstant.textPrimaryColor,
            )
          ],
        )
      ],
    );
  }
}