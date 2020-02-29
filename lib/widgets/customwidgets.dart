import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/see_more_provider.dart';
import 'package:try_error/providers/world_news_main_provider.dart';
import 'package:try_error/screens/activities/see_more.dart';
import 'package:try_error/utils/decide_card_color.dart';
import 'package:try_error/utils/hex_color.dart';

class CustomWidgets {
  DecideCardColor _decideCardColor = new DecideCardColor();
  Provider provider;

  List<Color> cardColor;

  Color decideColor() {
    addColor();
    var randomColor = (cardColor..shuffle()).first;
    return randomColor;
  }

  void addColor() {
    cardColor.add(HexColor("0000FF"));
    cardColor.add(HexColor("800080"));
    cardColor.add(HexColor("CD5C5C"));
    cardColor.add(HexColor("E9967A"));
    cardColor.add(HexColor("FFA07A"));
    cardColor.add(HexColor("008080"));
  }

  Widget circularImage(double width, double height, String imageurl) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(imageurl))));
  }

  Widget cardWithTextBelow(String imageurl, String text) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 170.0,
          height: 200.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Card(
              elevation: 2.0,
              child: CachedNetworkImage(
                imageUrl: imageurl,
                fit: BoxFit.cover,
                color: Colors.black54,
                colorBlendMode: BlendMode.overlay,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
        Positioned(
          top: 100.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 160.0,
              child: Column(
                children: <Widget>[
                  Text(
                    "$text...",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 98.0),
                    child: Text(
                      "Time",
                      style: TextStyle(
                          fontFamily: "Quicksand_Regular",
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget cardWithCircularImage(
      String imageUrl, String newsType, String headline, String date) {
    return Container(
      margin: EdgeInsets.only(top: 18.0, bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: SizedBox(
          height: 120.0,
          width: 275.0,
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: Colors.blue,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 8.0, right: 8.0),
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(imageUrl)))),
                        Container(
                          width: 190.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(newsType,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontFamily: "lgc")),
                              Text(
                                headline,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontFamily: "lgc",
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(date,
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: "lgc"))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget scrollableCards(
      String imageUrl, String type, String headline, String date) {
    return Padding(
        padding: const EdgeInsets.only(top: 9.0),
        child: Container(
          child: Card(
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox(
                      height: 130.0,
                      width: 120.0,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        color: Colors.black54,
                        colorBlendMode: BlendMode.overlay,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )),
                Container(
                  width: 12.0,
                ),
                Container(
                  width: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        type,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        headline,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text("Date")
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget seeMoreText(String whichNews, BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: SeeMore(),
                  ),
                );
                Provider.of<SeeMoreProvider>(context, listen: false)
                    .setWhichNews(whichNews);
                Provider.of<SeeMoreProvider>(context, listen: false).getFeeds();
              },
              child: Container(
                  child: Text(
                "See More",
                style: TextStyle(color: Colors.black),
              )),
            )
          ],
        ),
      ),
    );
  }

  // Widget newsLayout(BuildContext context, String whichLayoutNews){

  //           if(whichLayoutNews == "world"){
  //               provider = Provider.of<WorldNewsMainProvider>(context, listen: false);
  //           }
  //           return Expanded(
  //           child: Provider.of<WorldNewsMainProvider>(context, listen: false).loading
  //               ? Center(
  //                   child: CircularProgressIndicator(),
  //                 )
  //               : RefreshIndicator(
  //                   onRefresh: () => worldNewsMainProvider.getFeeds(),
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(top: 20.0),
  //                     child: ListView(
  //                       shrinkWrap: true,
  //                       children: <Widget>[
  //                         Column(
  //                           children: <Widget>[
  //                             customWidgets.seeMoreText("world",context),
  //                             Container(
  //                               height: 200.0,
  //                               child: ListView.builder(
  //                                   padding:
  //                                       EdgeInsets.symmetric(horizontal: 15),
  //                                   scrollDirection: Axis.horizontal,
  //                                   itemCount: worldNewsMainProvider
  //                                       .topCards.response.results.length,
  //                                   itemBuilder:
  //                                       (BuildContext context, int index) {
  //                                       Fields fields = worldNewsMainProvider.topCards.response.results[index].fields;
  //                                     return InkWell(
  //                                       onTap: () {
  //                                         Navigator.push(
  //                                           context,
  //                                           PageTransition(
  //                                             type: PageTransitionType
  //                                                 .leftToRightWithFade,
  //                                             child: DetailsScreen(
  //                                               title: "World",
  //                                               imageUrl: fields.thumbnail,
  //                                               newsHeadline: fields.headline,
  //                                               body: ParseHtmlString.parseString(fields.body),
  //                                               heroImageId: imgTag,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                       child: customWidgets.cardWithTextBelow(
  //                                         fields.thumbnail,
  //                                         fields.headline));
  //                                   }),
  //                             ),
                             
                           
  //                             Container(
  //                               height: 140.0,
  //                               child: ListView.builder(
  //                                   padding:
  //                                       EdgeInsets.symmetric(horizontal: 15),
  //                                   scrollDirection: Axis.horizontal,
  //                                   itemCount: worldNewsMainProvider
  //                                       .secondCards.response.results.length,
  //                                   itemBuilder:
  //                                       (BuildContext context, int index) {
  //                                       Fields fields = worldNewsMainProvider.secondCards.response.results[index].fields;
  //                                     return InkWell(
  //                                       onTap: () {
  //                                         Navigator.push(
  //                                           context,
  //                                           PageTransition(
  //                                             type: PageTransitionType
  //                                                 .leftToRightWithFade,
  //                                             child: DetailsScreen(
  //                                               title: "World",
  //                                               newsHeadline: fields.headline,
  //                                               imageUrl: fields.thumbnail,
  //                                               body: ParseHtmlString.parseString(fields.body),
  //                                               heroImageId: imgTag,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                       child:
  //                                           customWidgets.cardWithCircularImage(
  //                                               fields.thumbnail,
  //                                               worldNewsMainProvider
  //                                                   .secondCards
  //                                                   .response
  //                                                   .results[index]
  //                                                   .type,
  //                                               fields.headline,
  //                                               "Data"),
  //                                     );
  //                                   }),
  //                             )
  //                           ],
  //                         ),

  //                         Container(
  //                           width: MediaQuery.of(context).size.width,
  //                           child: ListView.builder(
  //                               padding: EdgeInsets.symmetric(horizontal: 15.0),
  //                               itemCount: worldNewsMainProvider
  //                                   .thirdCards.response.results.length,
  //                               scrollDirection: Axis.vertical,
  //                               shrinkWrap: true,
  //                               physics: ScrollPhysics(),
  //                               itemBuilder: (BuildContext context, int index) {
  //                                 Fields fields = worldNewsMainProvider.thirdCards.response.results[index].fields;
  //                                 return InkWell(
  //                                       onTap: () {
  //                                         Navigator.push(
  //                                           context,
  //                                           PageTransition(
  //                                             type:  PageTransitionType.leftToRightWithFade,
  //                                             child: DetailsScreen(
  //                                               title: "World",
  //                                               imageUrl: fields.thumbnail,
  //                                               newsHeadline: fields.headline,
  //                                               body: ParseHtmlString.parseString(fields.body),
  //                                               heroImageId: imgTag,
  //                                             ),
  //                                           ),
  //                                         );
  //                                       },
  //                                       child: customWidgets.scrollableCards(
  //                                     fields.thumbnail,
  //                                     worldNewsMainProvider.thirdCards.response
  //                                         .results[index].type,
  //                                     fields.headline,
  //                                     "Date"));
  //                               }),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ));
  // }


}
