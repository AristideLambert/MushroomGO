import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/setting_constant.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:provider/provider.dart';
import 'package:mushroom_go/provider/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSettingPage extends StatefulWidget {
  const LanguageSettingPage({super.key});

  @override
  State<LanguageSettingPage> createState() => _LanguageSettingPageState();
}

class _LanguageSettingPageState extends State<LanguageSettingPage> {
  List<ButtonSetting> loadLanguage(){
    List<ButtonSetting> buttons = [];
    for (var language in SettingConstant.languages) {
      buttons.add(
          ButtonSetting(
            type: Type.selected,
            title: SettingUtils.getLanguage(context, language),
            onTap: () {
              Provider.of<LocaleProvider>(context, listen: false).setLocale(SettingUtils.stringToLocale(language));
            },
          )
      );
    }
    return buttons;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingLanguage),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(DimensionConstant.defaultPadding),
            child: ButtonSettingContainer(
                indexSelected: SettingUtils.getIndexLanguage(SettingConstant.languages, Provider.of<LocaleProvider>(context, listen: false).locale),
                buttons: loadLanguage()
            ),
          ),
        ),
      ),
    );
  }
}
