import 'package:flutter/material.dart';
import 'package:news_app/shared_locale/helper.dart';


class SettingsProvider extends ChangeNotifier{
  String currentLocale = SharedPreference.getDataBool(key: "isAR")? "ar":"en";


  void setCurrentLocale(String newLocale){
    currentLocale = newLocale;
    notifyListeners();
  }
  bool isArabicLocale() => currentLocale == "ar" ;
}