import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/football_news_main_provider.dart';
import 'package:try_error/widgets/customwidgets.dart';

class FootballMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<FootballNewsMainProvider>(
      builder: (BuildContext context, FootballNewsMainProvider footballNewsMainProvider, Widget child){
        return Expanded(
            child: footballNewsMainProvider.loading
                ? Center(child: CircularProgressIndicator(),)
                : RefreshIndicator(
              onRefresh: ()=> footballNewsMainProvider.getFootballFeeds(),
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
                              itemCount: footballNewsMainProvider.topCardsFootball.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return  customWidgets.cardWithTextBelow(
                                    footballNewsMainProvider.topCardsFootball.response.results[index].fields.thumbnail,
                                    footballNewsMainProvider.topCardsFootball.response.results[index].fields.headline
                                );
                              }
                          ),
                        ),
                        Container(
                          height: 140.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: footballNewsMainProvider.secondCardsFootball.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return customWidgets.cardWithCircularImage(
                                    footballNewsMainProvider.secondCardsFootball.response.results[index].fields.thumbnail,
                                    footballNewsMainProvider.secondCardsFootball.response.results[index].type,
                                    footballNewsMainProvider.secondCardsFootball.response.results[index].fields.headline,
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
                       itemCount: footballNewsMainProvider.thirdCardsFootball.response.results.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemBuilder: (BuildContext context, int index){
                           return customWidgets.scrollableCards(
                               footballNewsMainProvider.thirdCardsFootball.response.results[index].fields.thumbnail,
                               footballNewsMainProvider.thirdCardsFootball.response.results[index].type,
                               footballNewsMainProvider.thirdCardsFootball.response.results[index].fields.headline,
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
