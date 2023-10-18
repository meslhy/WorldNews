import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/data/model/articles_responses/articles_responses.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';

abstract class ApiManager{


  static const String baseUrl = "newsapi.org";
  static const String apiKey = "ca8aec7f6dba4a078b911ccf7dd2095e";

  static Future<SourcesResponse> getSources(String categoryId) async {
    try {
      Uri url = Uri.parse("https://$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&&category=$categoryId");
      Response response = await get(url);
      Map json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if(response.statusCode >= 200 &&
          response.statusCode < 300 && sourcesResponse.sources?.isNotEmpty == true){
        return sourcesResponse;
      }
      throw Exception();
    }catch(_){
      rethrow;
    }
  }


  // Uri url = Uri.parse("https://$baseUrl/v2/everything?apiKey=$apiKey&sources=$sourceId");
  static Future<ArticlesResponses> getArticles({required String requestParameter, required String stringOfRequestParameter})async{
    try{
      Uri url = Uri.https(baseUrl, "/v2/everything", {
        "apiKey": apiKey,
        requestParameter: stringOfRequestParameter
      });
      Response response = await get(url);
      ArticlesResponses articlesResponse =
      ArticlesResponses.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300 &&
          articlesResponse.articles?.isNotEmpty == true){
        return articlesResponse;
      }else {
        print("Erorrrrrrrrrrrrrrrrrrrrrrrrr");
        throw Exception(articlesResponse.message);
      }
    }catch(_){
      rethrow;
    }
  }



}