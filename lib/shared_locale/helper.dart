import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference
{
  static late  SharedPreferences sharedPreferences;


  static init()
  async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required String user
  })
  async{
    return await sharedPreferences.setString(key, user);
  }

  static Future<bool> putDataBool({
    required String key,
    required bool value
  })
  async{
    return await sharedPreferences.setBool(key, value);
  }

   static String getData(
      {
        required String key
      }
      )
  {
    return  sharedPreferences.getString(key)??"";
  }

  static bool getDataBool(
      {
        required String key
      }
      )
  {
    return  sharedPreferences.getBool(key) ?? false;
  }



}