import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_list.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_app/ui/utils/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static const String roteName = "HomeRoute";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late Widget currentWidget;

  @override
  void initState() {
    super.initState();
    currentWidget = CategoriesTab(onCategoriesClick: setCategory);
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
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              toolbarHeight: MediaQuery.of(context).size.height * .1,
            ),
            drawer: Drawer(
              child: buildDrawer(),
            ),
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.splashBackground),
                    fit: BoxFit.cover),
              ),
              child: currentWidget,
            ),
          ),
        ),
    );
  }

  setCategory(CategoryDM newCategory) {
    currentWidget = NewsTab(categoryDM: newCategory);
    setState(() {});
  }

  buildDrawer() {

  }

}
