import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class ApiProvider {

 static String worldNewsLimited =
     "https://content.guardianapis.com/world?page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
 static String worldNewsLimitedPage2 =
      "https://content.guardianapis.com/world?page=2&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
 static String worldNewsLimitedPage3 =
     "https://content.guardianapis.com/world?page=3&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String businessNewsLimited = 
    "https://content.guardianapis.com/business?page=1&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String businessNewsLimited2 =
    "https://content.guardianapis.com/business?page=2&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String businessNewsLimited3 = 
    "https://content.guardianapis.com/business?page=3&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String techNewsLimited = 
  "https://content.guardianapis.com/technology?page=1&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String techNewsLimited2 =
  "https://content.guardianapis.com/technology?page=2&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String techNewsLimited3 = 
  "https://content.guardianapis.com/technology?page=3&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String scienceNewsLimited = 
  "https://content.guardianapis.com/technology?page=1&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String scienceNewsLimited2 = 
  "https://content.guardianapis.com/technology?page=2&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String scienceNewsLimited3 =
  "https://content.guardianapis.com/technology?page=3&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String footballNewsLimited =
  "https://content.guardianapis.com/football?page=1&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String footballNewsLimited2 = 
    "https://content.guardianapis.com/football?page=2&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
static String footballNewsLimited3 = 
    "https://content.guardianapis.com/football?page=3&page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
 static String worldNews =
     "https://content.guardianapis.com/world?show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";


 static Future<NewsModel> getDataNews(String url) async {
    Dio dio = new Dio();
    Response response = await dio.get(url);

    NewsModel worldNewsModel;
    if(response.statusCode == 200){
      worldNewsModel = NewsModel.fromJson(response.data);
      print(worldNewsModel.response.results.toString());

    }else{
      throw("Error ${response.statusCode}");
    }

    return worldNewsModel;
  }

}
