import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/app_colors.dart';


abstract class AppTheme{
  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme:const AppBarTheme(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      centerTitle: true,
    ),
    drawerTheme:const DrawerThemeData(),
    textTheme: const TextTheme(
      //todo:this style to title of categoriesScreen
      labelLarge:  TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),

      //todo:this style to title of categoriesButton
      labelMedium: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),

      //todo:this style to title of articles
      labelSmall: TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),

      //todo:this style to date of articles
      displaySmall: TextStyle(
        color: AppColors.dateColor,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),

      //todo:this style to titles
      displayLarge: TextStyle(
        color: AppColors.accent,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
  );
  static ThemeData darkTheme =  ThemeData();
}