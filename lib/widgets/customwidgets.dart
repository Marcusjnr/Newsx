import 'package:flutter/material.dart';

class CustomWidgets {
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
              child: Container(
                child: Image.network(imageurl, fit: BoxFit.cover, color: Colors.black54, colorBlendMode: BlendMode.overlay,),
              ),
            ),
          ),
        ),
        Positioned(
          top: 60.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 160.0,
              child: Column(
                children: <Widget>[
                  Text("$text...",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,

                  ),
                  Text("This is date")],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget cardWithCircularImage() {
    return SizedBox(
      height: 120.0,
      width: 250.0,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              color: Colors.blue,
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("images/samplefood1.jpg")))),
                    Center(
                      child: Column(
                        children: <Widget>[
                          Text("Title"),
                          Text("News Headline"),
                          Text("Date")
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
    );

  }

  Widget scrollableCards() {
      return Card(
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 130.0,
                  width: 120.0,
                  child: Image.asset(
                    "images/samplefood1.jpg",
                    fit: BoxFit.fill,
                  ),
                )),
            Column(
              children: <Widget>[Text("Title"), Text("news"), Text("Date")],
            )
          ],
        ),
      );
    }
}
