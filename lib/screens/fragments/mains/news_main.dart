import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';
import 'package:try_error/providers/world_news_main_provider.dart';
import 'package:try_error/screens/activities/details.dart';
import 'package:try_error/utils/parse_html.dart';
import 'package:try_error/widgets/customwidgets.dart';
import 'package:uuid/uuid.dart';


class NewsMain extends StatelessWidget {
  static final uuid = Uuid();
  static final String imgTag = uuid.v4();
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<WorldNewsMainProvider>(
      builder: (BuildContext context,
          WorldNewsMainProvider worldNewsMainProvider, Widget child) {
        return Expanded(
            child: worldNewsMainProvider.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () => worldNewsMainProvider.getFeeds(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              customWidgets.seeMoreText("WORLD",context),
                              Container(
                                height: 200.0,
                                child: ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: worldNewsMainProvider
                                        .topCards.response.results.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                        Fields fields = worldNewsMainProvider.topCards.response.results[index].fields;
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRightWithFade,
                                              child: DetailsScreen(
                                                title: "World",
                                                imageUrl: fields.thumbnail,
                                                newsHeadline: fields.headline,
                                                body: ParseHtmlString.parseString(fields.body),
                                                heroImageId: imgTag,
                                              ),
                                            ),
                                          );
                                        },
                                        child: customWidgets.cardWithTextBelow(
                                          fields.thumbnail,
                                          fields.headline));
                                    }),
                              ),
                             
                           
                              Container(
                                height: 140.0,
                                child: ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: worldNewsMainProvider
                                        .secondCards.response.results.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                        Fields fields = worldNewsMainProvider.secondCards.response.results[index].fields;
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRightWithFade,
                                              child: DetailsScreen(
                                                title: "World",
                                                newsHeadline: fields.headline,
                                                imageUrl: fields.thumbnail,
                                                body: ParseHtmlString.parseString(fields.body),
                                                heroImageId: imgTag,
                                              ),
                                            ),
                                          );
                                        },
                                        child:
                                            customWidgets.cardWithCircularImage(
                                                fields.thumbnail,
                                                worldNewsMainProvider
                                                    .secondCards
                                                    .response
                                                    .results[index]
                                                    .type,
                                                fields.headline,
                                                "Data"),
                                      );
                                    }),
                              )
                            ],
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 15.0),
                                itemCount: worldNewsMainProvider
                                    .thirdCards.response.results.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  Fields fields = worldNewsMainProvider.thirdCards.response.results[index].fields;
                                  return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type:  PageTransitionType.leftToRightWithFade,
                                              child: DetailsScreen(
                                                title: "World",
                                                imageUrl: fields.thumbnail,
                                                newsHeadline: fields.headline,
                                                body: ParseHtmlString.parseString(fields.body),
                                                heroImageId: imgTag,
                                              ),
                                            ),
                                          );
                                        },
                                        child: customWidgets.scrollableCards(
                                      fields.thumbnail,
                                      worldNewsMainProvider.thirdCards.response
                                          .results[index].type,
                                      fields.headline,
                                      "Date"));
                                }),
                          )
                        ],
                      ),
                    ),
                  ));
      },
    );
  }


}
