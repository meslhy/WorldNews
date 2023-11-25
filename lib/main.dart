import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/providers/settings_provider.dart';
import 'package:news_app/shared_locale/helper.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_app/ui/screens/search/search_screen.dart';
import 'package:news_app/ui/screens/splash/splash_screen.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  runApp( ChangeNotifierProvider(
    create: (context) => SettingsProvider(),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider settingsProvider;

   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of(context);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light ,
    locale: Locale(settingsProvider.currentLocale),
    routes: {
      HomeScreen.roteName :(context) => HomeScreen(),
      SplashScreen.roteName :(context) => SplashScreen(),
      SearchScreen.roteName :(context) => SearchScreen(),

    },
      initialRoute:SplashScreen.roteName ,
    );
  }


}
