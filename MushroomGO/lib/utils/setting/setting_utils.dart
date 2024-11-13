/*import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mushroomgo/constant/setting_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingUtils{
  SettingUtils._();

  static Future<Locale> getLanguageSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return stringToLocale(prefs.getString("language") ?? SettingConstant.languages.first);
  }
  static void setLanguageSharedPreferences(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("language", locale.languageCode);
  }
  static String getLanguage(BuildContext context, String language){
    switch(language){
      case "en": return AppLocalizations.of(context)!.settingLanguageEN;
      case "fr": return AppLocalizations.of(context)!.settingLanguageFR;
      default: return AppLocalizations.of(context)!.settingLanguageEN;
    }
  }
  static Locale stringToLocale(String language){
    switch(language){
      case "en": return const Locale("en");
      case "fr": return const Locale("fr");
      default: return const Locale("en");
    }
  }
  static int getIndexLanguage(List<String> languages, Locale locale){
    for(int i = 0; i < languages.length; i++){
      if(languages[i].toLowerCase() == locale.languageCode.toLowerCase()){
        return i;
      }
    }
    return 0;
  }
  static Future<ThemeMode> getDisplaySharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    return stringToThemeMode(prefs.getString("display") ?? SettingConstant.displays.first);
  }
  static void setDisplaySharedPreferences(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("display", themeModeToString(themeMode));
  }
  static String getDisplay(BuildContext context, String display){
    switch(display){
      case "system": return AppLocalizations.of(context)!.settingDisplaySystem;
      case "light": return AppLocalizations.of(context)!.settingDisplayLight;
      case "dark": return AppLocalizations.of(context)!.settingDisplayDark;
      default: return AppLocalizations.of(context)!.settingDisplaySystem;
    }
  }
  static ThemeMode stringToThemeMode(String display){
    switch(display){
      case "system": return ThemeMode.system;
      case "light": return ThemeMode.light;
      case "dark": return ThemeMode.dark;
      default: return ThemeMode.system;
    }
  }
  static String themeModeToString(ThemeMode themeMode){
    switch(themeMode){
      case ThemeMode.system: return "system";
      case ThemeMode.light: return "light";
      case ThemeMode.dark: return "dark";
      default: return "system";
    }
  }
  static int getIndexDisplay(List<String> displays, ThemeMode themeMode){
    for(int i = 0; i < displays.length; i++){
      if(displays[i].toLowerCase() == themeMode.name.toLowerCase()){
        return i;
      }
    }
    return 0;
  }
}*/