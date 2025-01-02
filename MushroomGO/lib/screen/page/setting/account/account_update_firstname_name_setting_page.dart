import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/models/person.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textfield/text_input.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/utils/dialog/dialog_utils.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/text/password_utils.dart';

class AccountUpdateFirstnameNameSettingPage extends StatefulWidget {
  const AccountUpdateFirstnameNameSettingPage({super.key});

  @override
  State<AccountUpdateFirstnameNameSettingPage> createState() => _AccountUpdateFirstnameNameSettingPageState();
}

class _AccountUpdateFirstnameNameSettingPageState extends State<AccountUpdateFirstnameNameSettingPage> {
  late final TextEditingController _controllerFirstname;
  late final TextEditingController _controllerName;
  late Person _person;
  late bool _isSame;

  Future<void> _loadData() async {
    _person = await FirebaseAuthUtils.getFullName(context) as Person;
    _controllerFirstname.text = _person.firstname;
    _controllerName.text = _person.name;
  }

  @override
  void initState() {
    super.initState();
    _controllerFirstname = TextEditingController();
    _controllerName = TextEditingController();
    _person = Person(firstname: "firstname", name: "name");
    _controllerFirstname.addListener(() {
      setState(() {
        _isSame = _controllerFirstname.text == _person.firstname && _controllerName.text == _person.name;
      });
    });
    _controllerName.addListener(() {
      setState(() {
        _isSame = _controllerFirstname.text == _person.firstname && _controllerName.text == _person.name;
      });
    });
    _isSame = true;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Update firstname & name")
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
                TextInput(controller: _controllerFirstname, textInputAction: TextInputAction.next, keyboardType: TextInputType.text, placeHolder: _person.firstname, clearText: true, title: "Firstname",),
                const SizedBox(height: DimensionConstant.defaultPadding,),
                TextInput(controller: _controllerName, textInputAction: TextInputAction.done, keyboardType: TextInputType.text, placeHolder: _person.name, clearText: true, title: "Name",)
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          child: ButtonStandard(title: "Update full name", enabled: !_isSame, onTap: () async {
            await FirebaseAuthUtils.updateFullName(context, _controllerFirstname.text, _controllerName.text);
            DialogUtils.showPopupInformation(context, "Update firstname & name", "Successful update", "OK", (){
              Navigator.of(context).pop();
            }, false);
          }),
        )
    );
  }
}