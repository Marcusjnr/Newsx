
import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class WorldNewsMainProvider extends ChangeNotifier{
  NewsModel topCards = new NewsModel();
  bool loading = true;

  getFeedsTopCard() async{
  
   setLoading(true);
   ApiProvider.getDataNews( ApiProvider.worldNewsLimited,"provider").then((worldNews){
     print("gotten the data");
     setTopCards(worldNews);
     setLoading(false);
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
}