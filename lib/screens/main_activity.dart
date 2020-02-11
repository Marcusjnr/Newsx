
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/change_fragment.dart';
import 'package:try_error/screens/fragments/mains/science_main.dart';
import 'package:try_error/screens/fragments/mains/football_main.dart';
import 'package:try_error/screens/fragments/mains/news_main.dart';
import 'package:try_error/screens/fragments/mains/business_main.dart';
import 'package:try_error/screens/fragments/mains/tech_main.dart';

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenChangeState>(
      builder: (BuildContext context, ScreenChangeState screenChangeState, Widget child){
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("News", style: TextStyle(color: Colors.black),),
            centerTitle: true,
          ),
          body: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 9.0, top: 10.0, right: 2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Text("World", 
                            style: TextStyle(
                              color: _decideColor(screenChangeState.currentIndex, 0), 
                              fontSize: 20.0,
                              fontWeight: _decideFontWeight(screenChangeState.currentIndex, 0)
                              )
                            ),
                            onTap: (){
                              screenChangeState.currentIndex = 0;
                            },
                          ),
                          InkWell(
                            child: Text("Business", style: TextStyle(
                              color: _decideColor(screenChangeState.currentIndex, 1), 
                              fontSize: 20.0,
                              fontWeight: _decideFontWeight(screenChangeState.currentIndex, 1)
                              )
                            ),
                            onTap: (){
                              screenChangeState.currentIndex = 1;
                            },
                          ),
                          InkWell(
                            child: Text("Tech", style: TextStyle(
                              color: _decideColor(screenChangeState.currentIndex, 2), 
                              fontSize: 20.0,
                              fontWeight: _decideFontWeight(screenChangeState.currentIndex, 2)
                              )
                            ),
                            onTap: (){
                              screenChangeState.currentIndex = 2;
                            },
                          ),
                          InkWell(
                            child: Text("Science", style: TextStyle(
                              color: _decideColor(screenChangeState.currentIndex, 3), 
                              fontSize: 20.0,
                              fontWeight: _decideFontWeight(screenChangeState.currentIndex, 3)
                              )
                            ),
                            onTap: (){
                              screenChangeState.currentIndex = 3;
                            },
                          ),
                          InkWell(
                            child: Text("Football", style: TextStyle(
                              color: _decideColor(screenChangeState.currentIndex, 4), 
                              fontSize: 20.0,
                              fontWeight: _decideFontWeight(screenChangeState.currentIndex, 4)
                              )
                            ),
                            onTap: (){
                              screenChangeState.currentIndex = 4;
                            },
                          ),
                        ],
                      )
                  ),
                  Container(
                    child: _screens[screenChangeState.currentIndex],
                  )
                ],
              )
          ),
        );
      }
    );
  }

  final List<Widget> _screens = [
    NewsMain(),
    BusinessMain(),
    TechMain(),
    ScienceMain(),
    FootballMain()
  ];

   Color _decideColor(int currentIndex, int indexClicked){
    if(currentIndex == indexClicked){
      return Colors.black;
    }else{
      return Colors.grey;
    }
  }

  FontWeight _decideFontWeight(int currentIndex, int indexClicked){
    if(currentIndex == indexClicked){
      return FontWeight.bold;
    }else{
      return FontWeight.normal;
    }
  }
}
