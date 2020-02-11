import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
              onRefresh: ()=> worldNewsMainProvider.getFeeds(),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
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
                        ),
                        Container(
                          height: 140.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: worldNewsMainProvider.secondCards.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return customWidgets.cardWithCircularImage(
                                    worldNewsMainProvider.secondCards.response.results[index].fields.thumbnail,
                                    worldNewsMainProvider.secondCards.response.results[index].type,
                                    worldNewsMainProvider.secondCards.response.results[index].fields.headline,
                                    "Data"
                                );
                              }
                          ),
                        )
                      ],
                    ),

                   Container(
                     width: MediaQuery.of(context).size.width,
                     child: ListView.builder(
                       padding: EdgeInsets.symmetric(horizontal: 15.0),
                       itemCount: worldNewsMainProvider.thirdCards.response.results.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemBuilder: (BuildContext context, int index){
                           return customWidgets.scrollableCards(
                               worldNewsMainProvider.thirdCards.response.results[index].fields.thumbnail,
                               worldNewsMainProvider.thirdCards.response.results[index].type,
                               worldNewsMainProvider.thirdCards.response.results[index].fields.headline,
                               "Date"
                           );
                         }
                     ),
                   )
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}




