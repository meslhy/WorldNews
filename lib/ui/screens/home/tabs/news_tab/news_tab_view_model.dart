import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repos/news_repo/data_sources/offLine_data_source.dart';
import 'package:news_app/data/repos/news_repo/data_sources/onLine_data_source.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
import 'package:news_app/data/repos/news_repo/news_repo.dart';

class NewsTabViewModel extends Cubit<NewsTabInitialState>{

  bool isLoading = false ;
  NewsRepo newsRepo = NewsRepo(OnLineDataSource(),OffLineDataSource());

  NewsTabViewModel() : super(NewsTabLoadingState());

  void  getSources(String categoryId) async{

    isLoading = true ;
    //notifyListeners();
    emit(NewsTabLoadingState());
    try{
      SourcesResponse? sourcesResponse = await newsRepo.getSources(categoryId);
      if(sourcesResponse.sources?.isNotEmpty == true ){
        isLoading = false ;
        //notifyListeners();
        emit(NewsTabSuccessState(sourcesResponse.sources!));
      }else{
        throw "something error";
      }
    }catch(e){
      isLoading = false;
      //notifyListeners();
      emit(NewsTabErrorState(e.toString()));
    }


  }
}

abstract class NewsTabInitialState{}
class NewsTabLoadingState extends NewsTabInitialState{}
class NewsTabSuccessState extends NewsTabInitialState {
  List<Source> sources ;
  NewsTabSuccessState(this.sources);
}
class NewsTabErrorState extends NewsTabInitialState {
  String errorMessage;
  NewsTabErrorState(this.errorMessage);
}