import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/data/model/api_manager.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/widgets/article_widget.dart';

class NewsList extends StatelessWidget {

  final String sourceId;
 const NewsList({super.key , required this.sourceId  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(sourceId),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return buildListView(snapshot.data!.articles!);
          }
          else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          else {
            return const Center(child: CircularProgressIndicator());
          }
        },
    );
  }

  Widget buildListView(List<Article> articles) => ListView.builder(
    itemCount: articles.length,
    itemBuilder: (context, index) => ArticleWidget(article: articles[index]) ,
  );
}
