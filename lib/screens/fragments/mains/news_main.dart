import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/api/api_provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';
import 'package:try_error/providers/world_news_main_provider.dart';
import 'package:try_error/widgets/customwidgets.dart';

class NewsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<WorldNewsMainProvider>(
      builder: (BuildContext context, WorldNewsMainProvider worldNewsMainProvider, Widget child){
        return Expanded(
            child: worldNewsMainProvider.loading
                ? Center(child: CircularProgressIndicator(),)
                : RefreshIndicator(
              onRefresh: ()=> worldNewsMainProvider.getFeedsTopCard(),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: worldNewsMainProvider.topCards.response.results.length,
                        itemBuilder: (BuildContext context, int index){
                          return  customWidgets.cardWithTextBelow(
                              worldNewsMainProvider.topCards.response.results[index].fields.thumbnail,
                              worldNewsMainProvider.topCards.response.results[index].fields.headline
                          );
                        }
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}




