import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class TechNewsMainProvider extends ChangeNotifier{
  NewsModel topCardsTech = new NewsModel();
  NewsModel secondCardsTech = new NewsModel();
  NewsModel thirdCardsTech = new NewsModel();
  bool loading = true;

  getTechFeeds() async{
    ApiProvider.getDataNews(ApiProvider.techNewsLimited).then((techNews){
      setTopCardsTech(techNews);
      ApiProvider.getDataNews(ApiProvider.techNewsLimited2).then((techNews2){
        setSecondCardTech(techNews2);
        ApiProvider.getDataNews(ApiProvider.techNewsLimited3).then((techNews3){
          setThirdCardsTech(techNews3);
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
    topCardsTech = value;
    notifyListeners();
  }

  void setSecondCardTech(value){
    secondCardsTech = value;
    notifyListeners();
  }

  void setThirdCardsTech(value){
    thirdCardsTech = value;
    notifyListeners();
  }

  void setLoading(value){
    loading = value;
    notifyListeners();
  }
} 