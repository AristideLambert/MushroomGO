import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushroom_go/constant/theme_constant.dart';
import 'package:mushroom_go/provider/locale_provider.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  LocaleProvider localeProvider = LocaleProvider(locale: await SettingUtils.getLanguageSharedPreferences());
  ThemeProvider themeProvider = ThemeProvider(themeMode: await SettingUtils.getDisplaySharedPreferences());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => localeProvider),
        ChangeNotifierProvider(create: (_) => themeProvider)
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      title: 'Mushroom GO',
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.lightTheme,
      darkTheme: ThemeConstant.darkTheme,
      themeMode: themeProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale,
      home: const MainPage(),
    );
  }
}