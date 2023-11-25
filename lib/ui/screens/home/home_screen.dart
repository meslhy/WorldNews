import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_list.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_app/ui/screens/home/tabs/settings_tab/settings_screen.dart';
import 'package:news_app/ui/screens/search/search_screen.dart';
import 'package:news_app/ui/utils/app_assets.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String roteName = "HomeRoute";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late Widget currentWidget;
   late Widget categoriesTab;

  @override
  void initState() {
    super.initState();
    categoriesTab = CategoriesTab(onCategoriesClick: setCategory);
    currentWidget = categoriesTab;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          if(currentWidget is! CategoriesTab)
            {
              currentWidget = CategoriesTab(onCategoriesClick: setCategory);
              setState(() {});
              return Future.value(false);
            }else{
            return Future.value(true);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("WorldNews"),
            toolbarHeight: MediaQuery.of(context).size.height * .1,
            actions: [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SearchScreen.roteName);
                },
                child:const Icon(
                    Icons.search_rounded,
                  size: 30,
                ),
              ),
              SizedBox(width: 20,),
            ],
          ),
          drawer: Drawer(
            child: buildDrawer(),
          ),
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.splashBackground),
                  fit: BoxFit.cover),
            ),
            child: currentWidget,
          ),
        ),
    );
  }

  setCategory(CategoryDM newCategory) {
    currentWidget = NewsTab(categoryDM: newCategory);
    setState(() {});
  }

  buildDrawer() {
    return Column(
      children: [
        DrawerHeader(
          decoration:const BoxDecoration(color: AppColors.primary ),
            child:Center(
                child: Text(
                  "WorldNews !" ,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.white),
                ),
            ),
        ),
        const SizedBox(height: 15,),
        buildDrawerRow(Icons.list , "Categories" , (){
          currentWidget = categoriesTab;
          Navigator.pop(context);
          setState(() {});
        }),
        const SizedBox(height: 15,),
        buildDrawerRow(Icons.settings , "Settings" , (){
          currentWidget = SettingsScreen();
          Navigator.pop(context);
          setState(() {});
        }),
      ],
    );
  }
   buildDrawerRow(IconData iconData, String title, Function onClick) {
     return InkWell(
       onTap: () {
         onClick();
       },
       child: Row(
         children: [
           const SizedBox(width: 20,),
           Icon(iconData ,size: 24),
           const SizedBox(width: 8,),
           Text(title , style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize:24 ,color: AppColors.accent),),
         ],
       ),
     );
   }

}
