
import 'package:flutter/foundation.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class BusinessNewsMainProvider extends ChangeNotifier{
  NewsModel topCardsBusiness = new NewsModel();
  NewsModel secondCardsBusiness = new NewsModel();
  NewsModel thirdCardsBusiness = new NewsModel();
  bool loading = true;

  getFeedsBusiness() async{
    setLoading(true);
    ApiProvider.getDataNews(ApiProvider.businessNewsLimited).then((businessNews1){
      setTopCardsBusiness(businessNews1);
      ApiProvider.getDataNews(ApiProvider.businessNewsLimited2).then((businessNews2){
          setSecondCardsBusiness(businessNews2);
          ApiProvider.getDataNews(ApiProvider.businessNewsLimited3).then((businessNews3){
              setThirdCardsBusiness(businessNews3);
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

  void setLoading(value){
    loading = value;
    notifyListeners();
  }

  void setTopCardsBusiness(value){
    topCardsBusiness = value;
    notifyListeners();
  }

  void setSecondCardsBusiness(value){
    secondCardsBusiness = value;
    notifyListeners();
  }

  void setThirdCardsBusiness(value){
    thirdCardsBusiness = value;
    notifyListeners();
  }
}