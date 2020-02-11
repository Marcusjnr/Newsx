import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class ScienceNewsMainProvider extends ChangeNotifier{
  NewsModel topCardsScience = new NewsModel();
  NewsModel secondCardsScience = new NewsModel();
  NewsModel thirdCardsScience = new NewsModel();
  bool loading = true;

  getScienceFeeds() async{
    ApiProvider.getDataNews(ApiProvider.scienceNewsLimited).then((scienceNews){
      setTopCardsTech(scienceNews);
      ApiProvider.getDataNews(ApiProvider.scienceNewsLimited2).then((scienceNews2){
        setSecondCardTech(scienceNews2);
        ApiProvider.getDataNews(ApiProvider.scienceNewsLimited3).then((scienceNews3){
          setThirdCardsTech(scienceNews3);
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

  void setTopCardsTech(value){
    topCardsScience = value;
    notifyListeners();
  }

  void setSecondCardTech(value){
    secondCardsScience = value;
    notifyListeners();
  }

  void setThirdCardsTech(value){
    thirdCardsScience = value;
    notifyListeners();
  }

  void setLoading(value){
    loading = value;
    notifyListeners();
  }
}