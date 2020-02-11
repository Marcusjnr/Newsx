import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/business_news_main_provider.dart';
import 'package:try_error/widgets/customwidgets.dart';

class BusinessMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<BusinessNewsMainProvider>(
      builder: (BuildContext context, BusinessNewsMainProvider businessNewsMainprovider, Widget child){
        return Expanded(
            child: businessNewsMainprovider.loading
                ? Center(child: CircularProgressIndicator(),)
                : RefreshIndicator(
              onRefresh: ()=> businessNewsMainprovider.getFeedsBusiness(),
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
                              itemCount: businessNewsMainprovider.topCardsBusiness.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return  customWidgets.cardWithTextBelow(
                                    businessNewsMainprovider.topCardsBusiness.response.results[index].fields.thumbnail,
                                    businessNewsMainprovider.topCardsBusiness.response.results[index].fields.headline
                                );
                              }
                          ),
                        ),
                        Container(
                          height: 140.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: businessNewsMainprovider.secondCardsBusiness.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return customWidgets.cardWithCircularImage(
                                    businessNewsMainprovider.secondCardsBusiness.response.results[index].fields.thumbnail,
                                    businessNewsMainprovider.secondCardsBusiness.response.results[index].type,
                                    businessNewsMainprovider.secondCardsBusiness.response.results[index].fields.headline,
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
                       itemCount: businessNewsMainprovider.thirdCardsBusiness.response.results.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemBuilder: (BuildContext context, int index){
                           return customWidgets.scrollableCards(
                               businessNewsMainprovider.thirdCardsBusiness.response.results[index].fields.thumbnail,
                               businessNewsMainprovider.thirdCardsBusiness.response.results[index].type,
                               businessNewsMainprovider.thirdCardsBusiness.response.results[index].fields.headline,
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
      }
      );
  }
}
