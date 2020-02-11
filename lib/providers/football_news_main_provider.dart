import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class FootballNewsMainProvider extends ChangeNotifier{
  NewsModel topCardsFootball = new NewsModel();
  NewsModel secondCardsFootball = new NewsModel();
  NewsModel thirdCardsFootball = new NewsModel();
  bool loading = true;

  getFootballFeeds() async{
    ApiProvider.getDataNews(ApiProvider.footballNewsLimited).then((footballNews){
      setTopCardsFootball(footballNews);
      ApiProvider.getDataNews(ApiProvider.footballNewsLimited2).then((footballNews2){
        setSecondCardFootball(footballNews2);
        ApiProvider.getDataNews(ApiProvider.footballNewsLimited3).then((footballNews3){
          setThirdCardsFootball(footballNews3);
          setLoading(false);
        }).catchError((e){

        });
      }).catchError((e){
        throw e;
      });
    }).catchError((e){
      throw e;
    });
  }

  void setTopCardsFootball(value){
    topCardsFootball = value;
    notifyListeners();
  }

  void setSecondCardFootball(value){
    secondCardsFootball = value;
    notifyListeners();
  }

  void setThirdCardsFootball(value){
    thirdCardsFootball = value;
    notifyListeners();
  }

  void setLoading(value){
    loading = value;
    notifyListeners();
  }
}