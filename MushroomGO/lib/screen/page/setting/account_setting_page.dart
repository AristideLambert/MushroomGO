import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/text_style_constant.dart';
import 'package:mushroom_go/theme/button_setting_theme.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountSettingPage extends StatefulWidget {
  const AccountSettingPage({super.key});

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.settingAccount)
      ),
      body: Container(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Column(
          children: [
            ButtonSettingContainer(
                buttons: [
                  ButtonSetting(
                    type: Type.standard,
                    title: AppLocalizations.of(context)!.settingAccountMail,
                    leftIcon: CupertinoIcons.at,
                  ),
                  ButtonSetting(
                    type: Type.standard,
                    title: AppLocalizations.of(context)!.settingAccountPassword,
                    leftIcon: CupertinoIcons.lock_fill,
                  ),
                  ButtonSetting(
                    type: Type.standard,
                    title: AppLocalizations.of(context)!.settingAccountDelete,
                    leftIcon: CupertinoIcons.delete_solid,
                  )
                ]
            ),
            const SizedBox(height: DimensionConstant.defaultPadding,),
            ButtonSettingContainer(
                buttons: [
                  ButtonSetting(
                    type: Type.button,
                    title: AppLocalizations.of(context)!.settingAccountLogout,
                    centerTitle: true,
                    theme: Theme.of(context).extension<ButtonSettingTheme>()!.copyWith(
                        titleButtonStyle: TextStyleConstant.titleButtonButtonSettingAccountSettingPage
                    ),
                    onTap: () {
                      print("Se déconnecter");
                    },
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}