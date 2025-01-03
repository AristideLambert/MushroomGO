import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/constant/setting_constant.dart';
import 'package:mushroom_go/provider/locale_provider.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:mushroom_go/screen/widget/container/profile/profile_container.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  final BuildContext mainContext;

  const SettingPage({super.key, required this.mainContext});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setting
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
            child: Column(
              children: [
                ProfileContainer(
                  pathImage: FirebaseAuth.instance.currentUser?.photoURL ?? SettingConstant.pathDefaultImageProfile,
                  name: FirebaseAuth.instance.currentUser?.displayName ?? "Aristide LAMBERT",
                  mail: FirebaseAuth.instance.currentUser?.email ?? "aristide.lambert@student.hepl.be",
                  onTap: () {
                    Navigator.of(widget.mainContext).pushNamed(
                        NavigationConstant.accountSettingPage
                    );
                  },
                ),
                const SizedBox(height: DimensionConstant.spaceSetting),
                ButtonSettingContainer(
                    title: AppLocalizations.of(context)!.settingContentDisplay,
                    buttons: [
                      ButtonSetting(
                        type: Type.standard,
                        title: AppLocalizations.of(context)!.settingDisplay,
                        data: SettingUtils.getDisplay(context, SettingUtils.themeModeToString(Provider.of<ThemeProvider>(context, listen: false).themeMode)),
                        onTap: () {
                          Navigator.of(widget.mainContext).pushNamed(
                              NavigationConstant.displaySettingPage
                          );
                        },
                      ),
                      ButtonSetting(
                        type: Type.standard,
                        title: AppLocalizations.of(context)!.settingLanguage,
                        data: SettingUtils.getLanguage(context, Provider.of<LocaleProvider>(context, listen: false).locale.languageCode),
                        onTap: () {
                          Navigator.of(widget.mainContext).pushNamed(
                              NavigationConstant.languageSettingPage
                          );
                        },
                      ),
                    ]
                ),
                const SizedBox(height: DimensionConstant.spaceSetting),
                ButtonSettingContainer(
                    title: AppLocalizations.of(context)!.settingAbout,
                    buttons: [
                      ButtonSetting(
                        type: Type.standard,
                        title: AppLocalizations.of(context)!.settingAboutPrivacyPolicy,
                        leftIcon: CupertinoIcons.shield_fill,
                      ),
                      ButtonSetting(
                        type: Type.standard,
                        title: AppLocalizations.of(context)!.settingAboutTermsAndConditions,
                        leftIcon: CupertinoIcons.doc_fill,
                      ),
                    ]
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
