import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:mushroom_go/utils/text/password_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    _controllerOldPassword.addListener((){
      setState(() {
        _isValid = PasswordUtils.checkValid(_controllerNewPassword.text) && _controllerOldPassword.text.isNotEmpty;
      });
    });
    _controllerNewPassword.addListener(() {
      setState(() {
        _isValid = PasswordUtils.checkValid(_controllerNewPassword.text) && _controllerOldPassword.text.isNotEmpty;
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
      FirebaseAuthUtils.verifyPasswordResetCodeAccount(context, _oobCode!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_oobCode == null ? AppLocalizations.of(context)!.accountUpdatePasswordSettingTitleUpdate : AppLocalizations.of(context)!.accountUpdatePasswordSettingTitleReset)
      ),
      body: Container(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Container(
          padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(DimensionConstant.radiusAccountSetting))
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if(_oobCode == null) ... [
                TextInput(
                  controller: _controllerOldPassword,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  placeHolder: "••••••••••••••",
                  password: true,
                  title: AppLocalizations.of(context)!.accountUpdatePasswordSettingTitleOldPassword,
                  autocorrect: false,
                  suggestions: false,
                ),
                const SizedBox(height: DimensionConstant.spaceAccountSetting,),
              ],
              TextInput(
                controller: _controllerNewPassword,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                placeHolder: "••••••••••••••",
                password: true,
                passwordPolicy:
                true,
                title: AppLocalizations.of(context)!.accountUpdatePasswordSettingTitleNewPassword,
                autocorrect: false,
                suggestions: false,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: ButtonStandard(
          title: _oobCode == null ? AppLocalizations.of(context)!.accountUpdatePasswordSettingButtonSave : AppLocalizations.of(context)!.accountUpdatePasswordSettingButtonReset,
          enabled: _isValid,
          onTap: () async {
            _oobCode == null ? await FirebaseAuthUtils.updatePasswordAccount(context, _controllerOldPassword.text, _controllerNewPassword.text) : await FirebaseAuthUtils.confirmPasswordResetAccount(context, _oobCode!, _controllerNewPassword.text);
          }
        ),
      )
    );
  }
}