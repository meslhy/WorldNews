import 'package:flutter/material.dart';
import 'package:news_app/providers/settings_provider.dart';
import 'package:news_app/shared_locale/helper.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
    SettingsScreen({super.key});

   late SettingsProvider settingsProvider;

  @override
  Widget build(BuildContext context) {
    bool isAr = false ;
    settingsProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Language",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              DropdownButtonFormField(
                key: const Key("locale"),
                onChanged: (value){
                  isAr = value =="ar"? true : false;
                  if(isAr){
                    settingsProvider.setCurrentLocale("ar");
                    SharedPreference.putDataBool(key: "isAR", value: true);
                  }else {
                    settingsProvider.setCurrentLocale("en");
                    SharedPreference.putDataBool(key: "isAR", value: false);
                  }
                },
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary,width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary,width: 2)
                    ),
                    filled: true,
                    fillColor:AppColors.transparent,
                ),
                dropdownColor:AppColors.white,
                borderRadius: BorderRadius.circular(20),
                value: isAr ? "ar":"en",
                items:<String>[
                  "en",
                  "ar"
                ].map<DropdownMenuItem<String>>((value){
                  return DropdownMenuItem(
                    value: value,
                    child:Text(
                      value,
                      style: const TextStyle(fontSize: 20,color:AppColors.primary),
                    ) ,
                  );
                } ).toList(),

              ),
            ],
          ),
        ),

      ],
    );
  }
}
