import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_error/providers/change_fragment.dart';
import 'package:try_error/providers/football_news_main_provider.dart';
import 'package:try_error/providers/science_news_main_provider.dart';
import 'package:try_error/providers/world_news_main_provider.dart';
import 'package:try_error/providers/business_news_main_provider.dart';
import 'package:try_error/providers/tech_news_main_provider.dart';
import 'package:try_error/screens/splash.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScreenChangeState()),
        ChangeNotifierProvider(create: (_) => WorldNewsMainProvider(),),
        ChangeNotifierProvider(create: (_) => BusinessNewsMainProvider(),),
        ChangeNotifierProvider(create: (_) => TechNewsMainProvider(),),
        ChangeNotifierProvider(create: (_) => ScienceNewsMainProvider(),),
        ChangeNotifierProvider(create: (_) => FootballNewsMainProvider(),)
      ],
      child: MaterialApp(
        title: "NewsX",
        theme: ThemeData(
          fontFamily: "lgc"
        ),
        home: Splash(),
      ),
    );
  }
}
