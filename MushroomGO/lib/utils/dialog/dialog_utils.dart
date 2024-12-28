import 'package:flutter/material.dart';
import 'package:mushroom_go/screen/widget/container/error_container.dart';
import 'package:mushroom_go/screen/widget/container/loading_container.dart';

class DialogUtils{
  DialogUtils._();

  static void showLoading(BuildContext context, String message){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingContainer(message: message);
      },
    );
  }

  static void showError(BuildContext context, String title, String message){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ErrorContainer(title: title, message: message);
      },
    );
  }
}