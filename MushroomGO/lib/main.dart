import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/theme_constant.dart';
import 'package:mushroom_go/provider/theme_provider.dart';
import 'package:mushroom_go/screen/page/main_page.dart';
import 'package:mushroom_go/utils/setting/setting_utils.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = ThemeProvider(themeMode: await SettingUtils.getDisplaySharedPreferences());
  runApp(
    MultiProvider(
      providers: [
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
    return MaterialApp(
      title: 'Mushroom GO',
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.lightTheme,
      darkTheme: ThemeConstant.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const MainPage(),
    );
  }
}