import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:try_error/api/models/world_model/world_model.dart';
import 'package:try_error/providers/business_news_main_provider.dart';
import 'package:try_error/screens/activities/details.dart';
import 'package:try_error/utils/parse_html.dart';
import 'package:try_error/widgets/customwidgets.dart';

import 'news_main.dart';

class BusinessMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<BusinessNewsMainProvider>(builder: (BuildContext context,
        BusinessNewsMainProvider businessNewsMainprovider, Widget child) {
      return Expanded(
          child: businessNewsMainprovider.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => businessNewsMainprovider.getFeedsBusiness(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            customWidgets.seeMoreText("BUSINESS",context),

                            Container(
                              height: 200.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: businessNewsMainprovider
                                      .topCardsBusiness.response.results.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Fields fields = businessNewsMainprovider
                                        .topCardsBusiness
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
                                                title: "Business",
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
                                        child: customWidgets.cardWithTextBelow(
                                            fields.thumbnail, fields.headline));
                                  }),
                            ),
                            Container(
                              height: 140.0,
                              child: ListView.builder(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: businessNewsMainprovider
                                      .secondCardsBusiness
                                      .response
                                      .results
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Fields fields = businessNewsMainprovider
                                        .secondCardsBusiness
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
                                                title: "Business",
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
                                                businessNewsMainprovider
                                                    .secondCardsBusiness
                                                    .response
                                                    .results[index]
                                                    .type,
                                                fields.headline,
                                                "Date"));
                                  }),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              itemCount: businessNewsMainprovider
                                  .thirdCardsBusiness.response.results.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                Fields fields = businessNewsMainprovider
                                    .thirdCardsBusiness
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
                                            title: "World",
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
                                        businessNewsMainprovider
                                            .thirdCardsBusiness
                                            .response
                                            .results[index]
                                            .type,
                                        fields.headline,
                                        "Date"));
                              }),
                        )
                      ],
                    ),
                  ),
                ));
    });
  }
}
