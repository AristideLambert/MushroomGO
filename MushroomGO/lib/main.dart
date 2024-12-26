import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mushroom_go/constant/navigation_constant.dart';
import 'package:mushroom_go/constant/theme_constant.dart';
import 'package:mushroom_go/provider/locale_provider.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:mushroom_go/screen/page/navigation/navigator_observer_page.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
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
      navigatorObservers: [NavigatorObserverPage()],
      onGenerateRoute: NavigationConstant.onGenerateRoute,
    );
  }
}