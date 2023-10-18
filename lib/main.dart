import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
import 'package:news_app/ui/screens/search/search_screen.dart';
import 'package:news_app/ui/screens/splash/splash_screen.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light ,
    routes: {
      HomeScreen.roteName :(context) => HomeScreen(),
      SplashScreen.roteName :(context) => SplashScreen(),
      SearchScreen.roteName :(context) => SearchScreen(),

    },
      initialRoute:SplashScreen.roteName ,
    );
  }


}
