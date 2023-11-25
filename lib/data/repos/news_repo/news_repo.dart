import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
import 'package:news_app/data/repos/news_repo/data_sources/offLine_data_source.dart';
import 'package:news_app/data/repos/news_repo/data_sources/onLine_data_source.dart';

class NewsRepo{

  OffLineDataSource offLineDataSource;
  OnLineDataSource onLineDataSource;


  NewsRepo(this.onLineDataSource , this.offLineDataSource);

  Future<SourcesResponse> getSources(String categoryID)async{
    ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile ){
      SourcesResponse sourcesResponse =await onLineDataSource.getSources(categoryID);
      offLineDataSource.saveSources(sourcesResponse);
      return sourcesResponse;
    }else{
     return await offLineDataSource.getSources(categoryID)!;
    }
  }
}