
import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class WorldNewsMainProvider extends ChangeNotifier{
  NewsModel topCards = new NewsModel();
  NewsModel secondCards = new NewsModel();
  NewsModel thirdCards = new NewsModel();
  bool loading = true;

  getFeeds() async{
   setLoading(true);
   ApiProvider.getDataNews( ApiProvider.worldNewsLimited).then((worldNews){
     setTopCards(worldNews);
     ApiProvider.getDataNews(ApiProvider.worldNewsLimitedPage2).then((worldNewsPage2){
       setSecondCards(worldNewsPage2);
       ApiProvider.getDataNews(ApiProvider.worldNewsLimitedPage3).then((worldNewsPage3){
         setThirdCards(worldNewsPage3);
         setLoading(false);
       }).catchError((e){
         throw e;
       });

     }).catchError((e){
       throw e;
     });

   }).catchError((e){
       throw e;
   });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setTopCards(value) {
    topCards = value;
    notifyListeners();
  }

  void setSecondCards(value){
    secondCards = value;
    notifyListeners();
  }

  void setThirdCards(value){
    thirdCards = value;
    notifyListeners();
  }
}