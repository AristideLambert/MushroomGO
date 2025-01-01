import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/popup/android_popup.dart';
import 'package:mushroom_go/screen/widget/popup/error_container.dart';
import 'package:mushroom_go/screen/widget/popup/information_container.dart';
import 'package:mushroom_go/screen/widget/popup/ios_popup.dart';
import 'package:mushroom_go/screen/widget/popup/loading_container.dart';

class DialogUtils{
  DialogUtils._();

  static void showLoading(BuildContext context, String message){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return LoadingContainer(message: message);
        },
      );
    });
  }

  static void showError(BuildContext context, String title, String message, Function()? onTap){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      /*showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorContainer(title: title, message: message, onTap: onTap);
        },
      );*/
      //_popup(context);
    });
  }

  static void showInformation(BuildContext context, String title, String message, Function()? onTap){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationContainer(title: title, message: message, onTap: onTap);
        },
      );
    });
  }

  static Future _popup(BuildContext context, String title, String content, String titlePositive, Function()? onTapPositive, bool isDestructiveActionPositive, String titleNegative, Function()? onTapNegative, bool isDestructiveActionNegative){
    return Platform.isIOS ? _iosPopup(context, title, content, titlePositive, onTapPositive, isDestructiveActionPositive, titleNegative, onTapNegative, isDestructiveActionNegative) : _androidPopup(context, title, content, titlePositive, onTapPositive, isDestructiveActionPositive, titleNegative, onTapNegative, isDestructiveActionNegative);
  }

  static Future _popupInformation(BuildContext context, String title, String content, String titlePositive, Function()? onTapPositive, bool isDestructiveActionPositive){
    return Platform.isIOS ? _iosPopup(context, title, content, titlePositive, onTapPositive, isDestructiveActionPositive, null, null, false) : _androidPopup(context, title, content, titlePositive, onTapPositive, isDestructiveActionPositive, null, null, false);
  }

  static Future _iosPopup(BuildContext context, String title, String content, String titlePositive, Function()? onTapPositive, bool isDestructiveActionPositive, String? titleNegative, Function()? onTapNegative, bool isDestructiveActionNegative){

    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return IosPopup(
          title: title,
          content: content,
          titlePositive: titlePositive,
          onTapPositive: onTapPositive,
          isDestructiveActionPositive: isDestructiveActionPositive,
          titleNegative: titleNegative,
          onTapNegative: onTapNegative,
          isDestructiveActionNegative: isDestructiveActionNegative
        );
      }
    );
  }

  static Future _androidPopup(BuildContext context, String title, String content, String titlePositive, Function()? onTapPositive, bool isDestructiveActionPositive, String? titleNegative, Function()? onTapNegative, bool isDestructiveActionNegative){
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AndroidPopup(
            title: title,
            content: content,
            titlePositive: titlePositive,
            onTapPositive: onTapPositive,
            isDestructiveActionPositive: isDestructiveActionPositive,
            titleNegative: titleNegative,
            onTapNegative: onTapNegative,
            isDestructiveActionNegative: isDestructiveActionNegative
        );
      }
    );
  }
}