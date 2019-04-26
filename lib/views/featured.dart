/*精选页面*/
import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import "../components/iconTab.dart";

class Featured extends StatefulWidget{

  @override
  _FeaturedState createState() => new _FeaturedState();
}


class _FeaturedState extends State<Featured>{
  @override
  Widget build(BuildContext context) {
//    return new Text("精品页");
    return new Column(
      children: <Widget>[
        new Container(
          height:210,
          child: new Swiper(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        new Container(
            height: 150,
            child: new Row(
                children: <Widget>[
                  new IconTab()
                ],
              ),

        )
      ],
    );
  }
}