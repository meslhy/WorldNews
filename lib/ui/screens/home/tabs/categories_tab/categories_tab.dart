import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/data/repos/news_repo/data_sources/onLine_data_source.dart';
import 'package:news_app/ui/screens/home/tabs/categories_tab/categories_widget.dart';
import 'package:news_app/ui/screens/home/widgets/home_widgets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/utils/app_theme.dart';

class CategoriesTab extends StatefulWidget {
  final Function(CategoryDM) onCategoriesClick;
   CategoriesTab({super.key , required this.onCategoriesClick});


  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
   OnLineDataSource ds = OnLineDataSource();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ds.getArticles(requestParameter: "q", stringOfRequestParameter: "sport+business+technology");
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
             width: MediaQuery.of(context).size.width * .3,
             child: Text(
                "Pick your category of interest",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16,color: AppColors.primary),
               maxLines: 2,
               softWrap: true,
          ),
           ),
          const SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height *.05,
            child: Row(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: (){
                          widget.onCategoriesClick(CategoryDM.categories[index]);
                          },
                        child: CategoriesWidget(categoryDM:CategoryDM.categories[index]),
                  ),
                    separatorBuilder: ( context,  index) =>const SizedBox(width: 5,),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
              child:  FutureBuilder(
                future: ds.getArticles(requestParameter: "q", stringOfRequestParameter: "sport+business+technology"),
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return buildNewsListView(snapshot.data!.articles!);
                  }
                  else if(snapshot.hasError) {
                    return  Center(
                      child: Text(
                        "Not Found This Source",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primary,
                        ),
                      ),
                    );
                  }
                  else {
                    return  Lottie.asset("assets/icons/not_found.json");
                  }
                },
              ),
          )
        ],
      ),
    );
  }
}
