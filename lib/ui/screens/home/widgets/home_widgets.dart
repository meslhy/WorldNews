import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/ui/widgets/article_widget.dart';

Widget buildNewsListView(List<Article> articles) => ListView.builder(
  itemCount: articles.length,
  itemBuilder: (context, index) => ArticleWidget(article: articles[index]) ,
);