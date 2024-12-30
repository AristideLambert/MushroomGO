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
      _popup(context);
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

  static Future _popup(BuildContext context){
    return Platform.isIOS ? _iosPopup(context) : _androidPopup(context);
  }

  static Future _iosPopup(BuildContext context){
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return IosPopup();
      }
    );
  }

  static Future _androidPopup(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AndroidPopup();
      }
    );
  }

}