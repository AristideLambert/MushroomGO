import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class AndroidPopup extends StatelessWidget {
  final String title;
  final String content;
  final String titlePositive;
  final Function()? onTapPositive;
  final bool isDestructiveActionPositive;
  final String? titleNegative;
  final Function()? onTapNegative;
  final bool isDestructiveActionNegative;

  const AndroidPopup({
    super.key,
    required this.title,
    required this.content,
    required this.titlePositive,
    this.onTapPositive,
    this.isDestructiveActionPositive = false,
    this.titleNegative,
    this.onTapNegative,
    this.isDestructiveActionNegative = false
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if(titleNegative != null) ... [
          TextButton(
            onPressed: onTapNegative,
            child: Text(
              titleNegative!,
              style: TextStyle(
                color: isDestructiveActionNegative ? ColorConstant.destructiveButtonAndroidPopup : ColorConstant.buttonAndroidPopup
              )
            )
          ),
        ],
        TextButton(
          onPressed: onTapPositive,
          child: Text(
            titlePositive,
            style: TextStyle(
              color: isDestructiveActionPositive ? ColorConstant.destructiveButtonAndroidPopup : ColorConstant.buttonAndroidPopup
            )
          )
        )
      ],
    );
  }
}
