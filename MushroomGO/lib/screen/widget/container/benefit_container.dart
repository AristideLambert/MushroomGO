import 'package:flutter/material.dart';
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
        Icon(icon, size: 60,),
        SizedBox(width: 10,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextOutput(text: title, type: Type.largeTitle,),
            TextOutput(text: description)
          ],
        )
      ],
    );
  }
}
