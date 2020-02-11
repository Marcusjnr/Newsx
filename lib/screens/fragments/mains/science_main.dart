import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/science_news_main_provider.dart';
import 'package:try_error/widgets/customwidgets.dart';

class ScienceMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<ScienceNewsMainProvider>(
      builder: (BuildContext context, ScienceNewsMainProvider scienceNewsMainProvider, Widget child){
        return Expanded(
            child: scienceNewsMainProvider.loading
                ? Center(child: CircularProgressIndicator(),)
                : RefreshIndicator(
              onRefresh: ()=> scienceNewsMainProvider.getScienceFeeds(),
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
                              itemCount: scienceNewsMainProvider.topCardsScience.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return  customWidgets.cardWithTextBelow(
                                    scienceNewsMainProvider.topCardsScience.response.results[index].fields.thumbnail,
                                    scienceNewsMainProvider.topCardsScience.response.results[index].fields.headline
                                );
                              }
                          ),
                        ),
                        Container(
                          height: 140.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: scienceNewsMainProvider.secondCardsScience.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return customWidgets.cardWithCircularImage(
                                    scienceNewsMainProvider.secondCardsScience.response.results[index].fields.thumbnail,
                                    scienceNewsMainProvider.secondCardsScience.response.results[index].type,
                                    scienceNewsMainProvider.secondCardsScience.response.results[index].fields.headline,
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
                       itemCount: scienceNewsMainProvider.thirdCardsScience.response.results.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemBuilder: (BuildContext context, int index){
                           return customWidgets.scrollableCards(
                               scienceNewsMainProvider.thirdCardsScience.response.results[index].fields.thumbnail,
                               scienceNewsMainProvider.thirdCardsScience.response.results[index].type,
                               scienceNewsMainProvider.thirdCardsScience.response.results[index].fields.headline,
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
