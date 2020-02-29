import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';
import 'package:try_error/providers/football_news_main_provider.dart';
import 'package:try_error/screens/activities/details.dart';
import 'package:try_error/utils/parse_html.dart';
import 'package:try_error/widgets/customwidgets.dart';

import 'news_main.dart';

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
                        customWidgets.seeMoreText("FOOTBALL",context),
                        Container(
                          height: 200.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: footballNewsMainProvider.topCardsFootball.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                Fields fields = footballNewsMainProvider
                                        .topCardsFootball
                                        .response
                                        .results[index]
                                        .fields;
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.leftToRightWithFade,
                                              child: DetailsScreen(
                                                title: "Football",
                                                imageUrl: fields.thumbnail,
                                                newsHeadline: fields.headline,
                                                body: ParseHtmlString.parseString(
                                                        fields.body),
                                                heroImageId: NewsMain.imgTag
                                              ),
                                            ),
                                          );
                                        },
                                        child: customWidgets.cardWithTextBelow(
                                            fields.thumbnail, fields.headline));
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
                                         Fields fields = footballNewsMainProvider
                                        .secondCardsFootball
                                        .response
                                        .results[index]
                                        .fields;
                                    return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.leftToRightWithFade,
                                              child: DetailsScreen(
                                                title: "Football",
                                                imageUrl: fields.thumbnail,
                                                newsHeadline: fields.headline,
                                                body:
                                                    ParseHtmlString.parseString(
                                                        fields.body),
                                                heroImageId: NewsMain.imgTag
                                              ),
                                            ),
                                          );
                                        },
                                        child:
                                            customWidgets.cardWithCircularImage(
                                                fields.thumbnail,
                                                footballNewsMainProvider
                                                    .secondCardsFootball
                                                    .response
                                                    .results[index]
                                                    .type,
                                                fields.headline,
                                                "Date"));
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
                                         Fields fields = footballNewsMainProvider
                                        .thirdCardsFootball
                                        .response
                                        .results[index]
                                        .fields;
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.leftToRightWithFade,
                                          child: DetailsScreen(
                                            title: "Football",
                                            imageUrl: fields.thumbnail,
                                            newsHeadline: fields.headline,
                                            body: ParseHtmlString.parseString(
                                                fields.body),
                                            heroImageId: NewsMain.imgTag
                                          ),
                                        ),
                                      );
                                    },
                                    child: customWidgets.scrollableCards(
                                        fields.thumbnail,
                                        footballNewsMainProvider
                                            .thirdCardsFootball
                                            .response
                                            .results[index]
                                            .type,
                                        fields.headline,
                                        "Date"));
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
