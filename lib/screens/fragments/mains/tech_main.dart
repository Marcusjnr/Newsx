import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/tech_news_main_provider.dart';
import 'package:try_error/widgets/customwidgets.dart';

class TechMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomWidgets customWidgets = new CustomWidgets();
    return Consumer<TechNewsMainProvider>(
      builder: (BuildContext context, TechNewsMainProvider techNewsMainProvider, Widget child){
        return Expanded(
            child: techNewsMainProvider.loading
                ? Center(child: CircularProgressIndicator(),)
                : RefreshIndicator(
              onRefresh: ()=> techNewsMainProvider.getTechFeeds(),
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
                              itemCount: techNewsMainProvider.topCardsTech.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return  customWidgets.cardWithTextBelow(
                                    techNewsMainProvider.topCardsTech.response.results[index].fields.thumbnail,
                                    techNewsMainProvider.topCardsTech.response.results[index].fields.headline
                                );
                              }
                          ),
                        ),
                        Container(
                          height: 140.0,
                          child: ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              scrollDirection: Axis.horizontal,
                              itemCount: techNewsMainProvider.secondCardsTech.response.results.length,
                              itemBuilder: (BuildContext context, int index){
                                return customWidgets.cardWithCircularImage(
                                    techNewsMainProvider.secondCardsTech.response.results[index].fields.thumbnail,
                                    techNewsMainProvider.secondCardsTech.response.results[index].type,
                                    techNewsMainProvider.secondCardsTech.response.results[index].fields.headline,
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
                       itemCount: techNewsMainProvider.thirdCardsTech.response.results.length,
                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                         physics: ScrollPhysics(),
                         itemBuilder: (BuildContext context, int index){
                           return customWidgets.scrollableCards(
                               techNewsMainProvider.thirdCardsTech.response.results[index].fields.thumbnail,
                               techNewsMainProvider.thirdCardsTech.response.results[index].type,
                               techNewsMainProvider.thirdCardsTech.response.results[index].fields.headline,
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
