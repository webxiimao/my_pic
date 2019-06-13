import 'package:flutter/material.dart';
import "../utils/adapt.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import '../views/album/index.dart';

class IconTab extends StatelessWidget {
//  IconTab(Key key, this.iconTitle):super(key:key);
  IconTab({this.iconTitle, this.image});

  final String iconTitle;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
//        Navigator.pushNamed(context,"/album",arguments: {
//          "user":"hahah"
//        });
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) =>
            new Album(arguments: {
              "user":"xii"
            },))
        );
      },
      child: new Container(
//        width: ScreenUtil().setWidth(149),
//        padding: new EdgeInsets.fromLTRB(
//            0, ScreenUtil().setHeight(30), 0, ScreenUtil().setHeight(30)),
        child: new Column(
//                  mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: <Widget>[
            image,
            new Text(iconTitle)
//                    Center(child: new Text("头像")),
          ],
        ),
      ),
    );
  }
}
