import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/data/repos/news_repo/data_sources/onLine_data_source.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/widgets/article_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String roteName = "SearchRoute";
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController changTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: MediaQuery.of(context).size.height * .06,
          child: TextFormField(
            controller: changTextController,
            onChanged: (text){
              changTextController.text = text;
              print(changTextController.text);
              setState(() {});
            },
            decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: AppColors.primary,width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: AppColors.primary,width: 2)
              ),
              filled: true,
              fillColor:AppColors.white,
              suffix: const Icon(
                  Icons.search_rounded ,
                  color: AppColors.primary),
              prefixIcon: IconButton(
                  onPressed: (){
                    changTextController.text = "";
                    setState(() {});
                  },
                  icon: Icon(Icons.clear_outlined , color: AppColors.primary, size: 30),
              ),
              hintText: "Search Article",
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.greyPrimary),
              border: InputBorder.none,
            ),
            cursorColor: AppColors.primary,
            cursorHeight: 20,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.primary , fontSize: 20),

          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * .11,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: OnLineDataSource().getArticles(requestParameter: "q",stringOfRequestParameter: changTextController.text??"" ),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return buildListView(snapshot.data!.articles!);
            }
            else if(snapshot.hasError) {
              return  Center(
                child: Text(
                  "write anything to search...",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: AppColors.primary,
                  ),
                ),
              );
            }
            else {
              return const Center(child: CircularProgressIndicator(color: AppColors.primary,));
            }
          },
        ),
      ),
    );
  }

  Widget buildListView(List<Article> articles) => ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) => ArticleWidget(article: articles[index]) ,
  );
}
