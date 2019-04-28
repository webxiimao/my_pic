/*精选页面*/
import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import "../components/iconTab.dart";
import '../utils/adapt.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => new _FeaturedState();
}

class Img {
  static tabNavImg(String image) {
    return new Image.asset(
      image,
      width: ScreenUtil().setWidth(100),
    );
  }
}

class IconTabField {
  IconTabField({this.iconTitle, this.image});

  final String iconTitle;

//  final Icon icon;
  final Image image;
}

/*
*   - assets/tabnavicon/food-avocado.png
    - assets/tabnavicon/food-bread.png
    - assets/tabnavicon/food-chips.png
    - assets/tabnavicon/food-cookie.png
    - assets/tabnavicon/food-doughnut.png
    - assets/tabnavicon/food-pecan.png
    - assets/tabnavicon/food-pizza.png
    - assets/tabnavicon/food-popcorn.png
    - assets/tabnavicon/food-pudding.png
    - assets/tabnavicon/food-strawberry.png
* */

final List<IconTabField> icontab = [
  IconTabField(
      iconTitle: "LivePhoto",
      image: Img.tabNavImg("assets/tabnavicon/food-avocado.png")),
  IconTabField(
      iconTitle: "头像",
      image: Img.tabNavImg("assets/tabnavicon/food-bread.png")),
  IconTabField(
      iconTitle: "表情",
      image: Img.tabNavImg("assets/tabnavicon/food-chips.png")),
  IconTabField(
      iconTitle: "限免专区",
      image: Img.tabNavImg("assets/tabnavicon/food-cookie.png")),
  IconTabField(
      iconTitle: "手机彩铃",
      image: Img.tabNavImg("assets/tabnavicon/food-doughnut.png")),
  IconTabField(
      iconTitle: "每日精选",
      image: Img.tabNavImg("assets/tabnavicon/food-pecan.png")),
  IconTabField(
      iconTitle: "主题套图",
      image: Img.tabNavImg("assets/tabnavicon/food-pizza.png")),
  IconTabField(
      iconTitle: "天生一对",
      image: Img.tabNavImg("assets/tabnavicon/food-popcorn.png")),
  IconTabField(
      iconTitle: "锁屏",
      image: Img.tabNavImg("assets/tabnavicon/food-pudding.png")),
  IconTabField(
      iconTitle: "主屏",
      image: Img.tabNavImg("assets/tabnavicon/food-strawberry.png")),
];

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
//    return new Text("精品页");
    return new Container(
        color: Colors.grey,
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.white,
              height: ScreenUtil().setHeight(420),
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
              height: ScreenUtil().setHeight(400),
              color: Colors.white,
//              width: ScreenUtil().setWidth(750),
//            height: 150,
//              child: new Wrap(
////              direction: Axis.vertical,
//                alignment: WrapAlignment.start,
////              runAlignment: WrapAlignment.spaceAround,
////              crossAxisAlignment:WrapCrossAlignment.center,
////              verticalDirection:VerticalDirection.up,
////              spacing:40.0,
////              mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                mainAxisSize: MainAxisSize.max,
////              spacing: 8.0, // gap between adjacent chips
////              runSpacing: 4.0, // gap between lines
//                children: icontab.map((IconTabField icont) {
//                  return new IconTab(
//                      iconTitle: icont.iconTitle, image: icont.image);
//                }).toList(),
//              ),
              child:  new GridView.count(
//                      childAspectRatio: 2 / 3,
                      crossAxisCount: 5,
                      children: icontab.map((IconTabField icont) {
                        return new IconTab(
                            iconTitle: icont.iconTitle, image: icont.image);
                      }).toList(),
                    ),

            )
          ],
        ));
  }
}
