import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/data/repos/news_repo/data_sources/onLine_data_source.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/screens/home/widgets/home_widgets.dart';
import 'package:news_app/ui/utils/app_colors.dart';
import 'package:news_app/ui/widgets/article_widget.dart';

class NewsList extends StatelessWidget {

  final String sourceId;
 const NewsList({super.key , required this.sourceId  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OnLineDataSource().getArticles(requestParameter: "sources",stringOfRequestParameter: sourceId),
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
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }
        },
    );
  }


}
