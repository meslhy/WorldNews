import 'package:flutter/material.dart';
import 'package:news_app/data/model/api_manager.dart';
import 'package:news_app/data/model/category_dm/category_dm.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_list.dart';
import 'package:news_app/ui/utils/app_colors.dart';

class NewsTab extends StatefulWidget {

  final CategoryDM categoryDM;

  const NewsTab({super.key ,required this.categoryDM});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> with TickerProviderStateMixin{
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.categoryDM.id),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
              return buildTads(snapshot.data!.sources!);
            }
          else if(snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        } ,
    );
  }

  Widget buildTads(List<Source> sources) => DefaultTabController(
    length: sources.length,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              currentTabIndex = index ;
              setState(() {});
            },
            isScrollable: true,
            indicatorColor: AppColors.transparent,
            tabs: sources.map((source)=>buildTabWidget(
                        source.name??"",
                        currentTabIndex == sources.indexOf(source) ) ).toList(),
          ),
          Expanded(
            child: TabBarView(
                children: sources.map((singleSource) =>
                    NewsList(sourceId: singleSource.id! )).toList()
            ),
          ),
        ],
      ),
    ) ,
  );

  Widget buildTabWidget(String name, bool isSelected) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: AppColors.primary, width: 1)),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 18, color: isSelected ? AppColors.white : AppColors.primary),
      ));
}
