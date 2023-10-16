import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/home_screen.dart';
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

    return MaterialApp(
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light ,
    routes: {
      HomeScreen.roteName :(context) => HomeScreen(),
      SplashScreen.roteName :(context) => SplashScreen(),

    },
      initialRoute:SplashScreen.roteName ,
    );
  }


}
