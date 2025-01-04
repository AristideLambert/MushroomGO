import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/screen/widget/button/standard/button_standard.dart';
import 'package:mushroom_go/screen/widget/textField/text_input.dart';
import 'package:mushroom_go/utils/firebase/firebase_auth_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(AppLocalizations.of(context)!.accountDeleteSettingTitle)
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
              TextInput(
                controller: _controllerPassword,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                placeHolder: "••••••••••••••",
                password: true,
                title: AppLocalizations.of(context)!.accountDeleteSettingTitlePassword,
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
          title: AppLocalizations.of(context)!.accountDeleteSettingButton,
          enabled: _isValid,
          onTap: () async {
            await FirebaseAuthUtils.deleteAccount(context, _controllerPassword.text);
          }
        ),
      )
    );
  }
}