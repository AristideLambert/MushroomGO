import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/text/password_utils.dart';

class AccountDeleteSettingPage extends StatefulWidget {
  const AccountDeleteSettingPage({super.key});

  @override
  State<AccountDeleteSettingPage> createState() => _AccountDeleteSettingPageState();
}

class _AccountDeleteSettingPageState extends State<AccountDeleteSettingPage> {
  late final TextEditingController _controllerPassword;
  late bool _isValid;

  @override
  void initState() {
    super.initState();
    _controllerPassword = TextEditingController();
    _controllerPassword.addListener(() {
      setState(() {
        _isValid = _controllerPassword.text.isNotEmpty;
      });
    });
    _isValid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Delete account")
        ),
        body: Container(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          child: Container(
            padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
            decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
                borderRadius: const BorderRadius.all(Radius.circular(DimensionConstant.radiusBorderInputTextInput))
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextInput(controller: _controllerPassword, textInputAction: TextInputAction.done, keyboardType: TextInputType.visiblePassword, placeHolder: "••••••••••••••", password: true, passwordPolicy: true, title: "Password",)
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          child: ButtonStandard(title: "Delete account", enabled: _isValid, onTap: () async {
            DialogUtils.showPopup(context, "Delete account", "Êtes-vous sûr de vouloir supprimer votre compte ?", "Supprimer", (){
              FirebaseAuthUtils.deleteAccount(context, _controllerPassword.text);
            }, true, "Annuler", (){
              Navigator.of(context).pop();
            }, false);
          }),
        )
    );
  }
}