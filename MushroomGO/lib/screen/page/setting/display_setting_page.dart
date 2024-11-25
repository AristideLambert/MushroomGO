import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/constant/setting_constant.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting.dart';
import 'package:mushroom_go/screen/widget/button/setting/button_setting_container.dart';
import 'package:provider/provider.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplaySettingPage extends StatefulWidget {
  const DisplaySettingPage({super.key});

  @override
  State<DisplaySettingPage> createState() => _DisplaySettingPageState();
}

class _DisplaySettingPageState extends State<DisplaySettingPage> {
  List<ButtonSetting> loadDisplay(){
    List<ButtonSetting> buttons = [];
    for (var display in SettingConstant.displays) {
      buttons.add(
          ButtonSetting(
            type: Type.selected,
            title: SettingUtils.getDisplay(context, display),
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setTheme(SettingUtils.stringToThemeMode(display));
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
        title: Text(AppLocalizations.of(context)!.settingDisplay),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(DimensionConstant.defaultPadding),
            child: ButtonSettingContainer(
                indexSelected: SettingUtils.getIndexDisplay(SettingConstant.displays, Provider.of<ThemeProvider>(context, listen: false).themeMode),
                buttons: loadDisplay()
            ),
          ),
        ),
      ),
    );
  }
}
