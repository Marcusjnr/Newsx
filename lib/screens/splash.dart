import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/football_news_main_provider.dart';
import 'package:try_error/providers/science_news_main_provider.dart';
import 'package:try_error/providers/tech_news_main_provider.dart';
import 'package:try_error/providers/world_news_main_provider.dart';
import 'package:try_error/providers/business_news_main_provider.dart';
import 'package:try_error/screens/main_activity.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var timeout = const Duration(seconds: 2);
  var ms = const Duration(milliseconds: 1);

  bool gone = false;

  startTimeout() {
    return new Timer(Duration(seconds: 2), handleTimeout);
  }


  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigator.pushReplacement(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: MainActivity(),
      ),
    );
    Provider.of<WorldNewsMainProvider>(context, listen: false).getFeeds();
    Provider.of<BusinessNewsMainProvider>(context, listen: false).getFeedsBusiness();
    Provider.of<TechNewsMainProvider>(context, listen: false).getTechFeeds();
    Provider.of<ScienceNewsMainProvider>(context, listen: false).getScienceFeeds();
    Provider.of<FootballNewsMainProvider>(context, listen: false).getFootballFeeds();
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
//        mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.access_time,
              color: Colors.orange,
              size: 70,
            ),
            SizedBox(height: 20,),
            Text(
              "Newsx",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
