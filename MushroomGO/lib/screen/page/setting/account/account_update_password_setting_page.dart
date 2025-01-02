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

class AccountUpdatePasswordSettingPage extends StatefulWidget {
  const AccountUpdatePasswordSettingPage({super.key});

  @override
  State<AccountUpdatePasswordSettingPage> createState() => _AccountUpdatePasswordSettingPageState();
}

class _AccountUpdatePasswordSettingPageState extends State<AccountUpdatePasswordSettingPage> {
  late final TextEditingController _controllerOldPassword;
  late final TextEditingController _controllerNewPassword;
  late bool _isValid;
  late bool _checkOobCode;
  String? _oobCode;

  @override
  void initState() {
    super.initState();
    _controllerOldPassword = TextEditingController();
    _controllerNewPassword = TextEditingController();
    _controllerNewPassword.addListener(() {
      setState(() {
        _isValid = PasswordUtils.checkValid(_controllerNewPassword.text);
      });
    });
    _isValid = false;
    _checkOobCode = false;
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _oobCode = ModalRoute.of(context)!.settings.arguments as String?;
    if(_oobCode != null && !_checkOobCode){
      _checkOobCode = true;
      FirebaseAuthUtils.verifyPasswordResetCode(context, _oobCode!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_oobCode == null ? "Update password" : "Reset password")
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
              if(_oobCode == null) ... [
                TextInput(controller: _controllerOldPassword, textInputAction: TextInputAction.next, keyboardType: TextInputType.visiblePassword, placeHolder: "••••••••••••••", password: true, title: "Old password",),
                const SizedBox(height: 20,),
              ],
              TextInput(controller: _controllerNewPassword, textInputAction: TextInputAction.done, keyboardType: TextInputType.visiblePassword, placeHolder: "••••••••••••••", password: true, passwordPolicy: true, title: "New password",)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: ButtonStandard(title: _oobCode == null ? "Update password" : "Reset password", enabled: _isValid, onTap: () async {
          _oobCode == null ? await FirebaseAuthUtils.updatePassword(context, _controllerOldPassword.text, _controllerNewPassword.text) : await FirebaseAuthUtils.confirmPasswordReset(context, _oobCode!, _controllerNewPassword.text);

          DialogUtils.showPopupInformation(context, "Update password", "Successful update", "OK", (){
            Navigator.of(context).pop();
          }, false);
        }),
      )
    );
  }
}