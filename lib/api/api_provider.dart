import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:try_error/api/models/world_model/world_model.dart';

class ApiProvider {

 static String worldNewsLimited =
     "https://content.guardianapis.com/world?page-size=5&show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";
 static String worldNews =
     "https://content.guardianapis.com/world?show-fields=thumbnail,body,headline&api-key=48f91886-eceb-4e4d-83fc-829b5d5a5043";


 static Future<NewsModel> getDataNews(String url, String from) async {
    Dio dio = new Dio();
    Response response = await dio.get(url);

    NewsModel worldNewsModel;
    if(response.statusCode == 200){
      worldNewsModel = NewsModel.fromJson(response.data);
      print(from + " " + worldNewsModel.response.results.toString());

    }else{
      throw("Error ${response.statusCode}");
    }

    return worldNewsModel;
  }

}
