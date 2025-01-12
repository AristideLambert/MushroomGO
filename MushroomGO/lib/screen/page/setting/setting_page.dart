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
  late User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  Future<void> _navigate(String routeName, {Object? arguments}) async {
    await Navigator.of(widget.mainContext).pushNamed(routeName, arguments: arguments);
    setState(() {
      _user = FirebaseAuth.instance.currentUser;
    });
  }

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
                  pathImage: _user?.photoURL ?? SettingConstant.pathDefaultImageProfile,
                  name: _user?.displayName ?? "Aristide LAMBERT",
                  mail: _user?.email ?? "aristide.lambert@student.hepl.be",
                  onTap: () => _navigate(_user == null ? NavigationConstant.loginPage : NavigationConstant.accountSettingPage, arguments: _user == null ? true : null),
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
