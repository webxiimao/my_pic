/*精选页面*/
import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import "../components/iconTab.dart";

class Featured extends StatefulWidget{

  @override
  _FeaturedState createState() => new _FeaturedState();
}

class IconTabField{
  IconTabField({this.iconTitle, this.icon});
  final String iconTitle;
  final Icon icon;
}

final List<IconTabField> icontab = [
  IconTabField(iconTitle:"头像",icon:new Icon(Icons.accessibility)),
  IconTabField(iconTitle:"美颜",icon:new Icon(Icons.vibration)),
  IconTabField(iconTitle:"少女",icon:new Icon(Icons.data_usage)),
  IconTabField(iconTitle:"可爱",icon:new Icon(Icons.accessible_forward)),

];

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
            child: new Wrap(
//              direction: Axis.vertical,
              alignment: WrapAlignment.start,
//              runAlignment: WrapAlignment.spaceAround,
//              crossAxisAlignment:WrapCrossAlignment.center,
//              verticalDirection:VerticalDirection.up,
//              spacing:40.0,
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                mainAxisSize: MainAxisSize.max,
//              spacing: 8.0, // gap between adjacent chips
//              runSpacing: 4.0, // gap between lines
              children: icontab.map((IconTabField icont){
                  return new IconTab(iconTitle: icont.iconTitle,icon: icont.icon);
                }).toList(),
              ),

        )
      ],
    );
  }
}