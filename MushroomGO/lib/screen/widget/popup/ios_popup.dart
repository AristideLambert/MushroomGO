import 'package:flutter/cupertino.dart';
import 'package:mushroom_go/constant/color_constant.dart';

class IosPopup extends StatelessWidget {
  final String title;
  final String content;
  final String titlePositive;
  final Function()? onTapPositive;
  final bool isDestructiveActionPositive;
  final String? titleNegative;
  final Function()? onTapNegative;
  final bool isDestructiveActionNegative;

  const IosPopup({
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
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        if(titleNegative != null) ... [
          CupertinoDialogAction(
            isDestructiveAction: isDestructiveActionNegative,
            onPressed: onTapNegative,
            child: Text(
              titleNegative!,
              style: TextStyle(
                color: isDestructiveActionNegative ? ColorConstant.destructiveButtonIosPopup : ColorConstant.buttonIosPopup
              )
            )
          )
        ],
        CupertinoDialogAction(
          isDestructiveAction: isDestructiveActionPositive,
          onPressed: onTapPositive,
          child: Text(
            titlePositive,
            style: TextStyle(
              color: isDestructiveActionPositive ? ColorConstant.destructiveButtonIosPopup : ColorConstant.buttonIosPopup
            )
          )
        )
      ],
    );
  }
}