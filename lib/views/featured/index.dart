/*精选页面*/
import "package:flutter/material.dart";
import "package:flutter_swiper/flutter_swiper.dart";
import '../../utils/adapt.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';
import 'dart:typed_data';
import '../../services/http.dart';

import '../../utils/utils.dart';

/*components*/
import "../../components/iconTab.dart";
import "../../components/sectionTab.dart";

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);



class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => new _FeaturedState();
}

class Img {
  static tabNavImg(String image) {
    return new Image.asset(
      image,
      width: ScreenUtil().setWidth(60),
    );
  }
}

class IconTabField {
  IconTabField({this.iconTitle, this.image});

  final String iconTitle;

//  final Icon icon;
  final Image image;
}


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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.child, this.minHeight, this.maxHeight});

  @required
  final Widget child;
  @required
  final double minHeight;
  @required
  final double maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return new SizedBox.expand(child: child);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => max(maxHeight, minHeight);

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return maxHeight != oldDelegate.maxExtent ||
        minHeight != oldDelegate.minExtent;
  }
}

final List<Image> hotPictrues = [
  new Image.network(
    "http://via.placeholder.com/350x150",
    fit: BoxFit.fill,
  ),
  new Image.network(
    "http://via.placeholder.com/350x150",
    fit: BoxFit.fill,
  ),
];

class PicToDetail extends StatefulWidget {
  PicToDetail({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _PicToDetailState createState() => new _PicToDetailState();
}

class _PicToDetailState extends State<PicToDetail> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: new GestureDetector(
        onTap: () {
          print("hot pictures click!");
        },
        child: widget.child,
      ),
    );
  }
}

class PicUpgradeList{
  final String img_url;
  final String local_img_url;
  PicUpgradeList({this.img_url, this.local_img_url});

  factory PicUpgradeList.fromJson(Map<String, dynamic> json){
    return PicUpgradeList(
      img_url: json['img_url'],
      local_img_url: json['local_img_url']
    );
  }
}

class _FeaturedState extends State<Featured> {

  /*data*/
  List pictrueUpgrade = [];
  bool isLoadingPic = false;
  ScrollController _scrollController = new ScrollController();

  /*init*/
  @override
  void initState(){
    _initListener();
    _getAllImgs();
    super.initState();
  }

  void _initListener(){
    _scrollController.addListener((){
        if(_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 400 && !isLoadingPic){
          _getAllImgs();
        }
    });
  }

  void _getAllImgs() async{
    setState(() {
      isLoadingPic = true;
    });
    var result =
    await HttpUtils.request(
        "/girls/getAllImgs",
        method: HttpUtils.GET,
        data: {
            "pageIndex" : (pictrueUpgrade.length / 12 + 1).toStringAsFixed(0),
            "pageSize" : 15,
        }
    );
    List list = [];
    if (result['status']) {
      list = result['data']['list'];
    }
    if (mounted) {
      setState(() {
        pictrueUpgrade.addAll(list.map((json) => PicUpgradeList.fromJson(json)).toList());
        isLoadingPic = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.grey,
        child: new CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            new SliverToBoxAdapter(
              child: new Container(
                height: ScreenUtil().setHeight(420),
                color: Colors.white,
                child: new Swiper(
                  autoplay:true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      "http://via.placeholder.com/350x150",
                      fit: BoxFit.fill,
                    );
                  },
                ),
              ),
            ),
            new SliverPadding(
              padding:
                  new EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(15)),
              sliver: SliverToBoxAdapter(
                  child: Container(
                padding: new EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(15),
                    0, ScreenUtil().setHeight(15)),
                color: Colors.white,
                height: ScreenUtil().setHeight(240),
                child: GridView.count(
                  physics: new NeverScrollableScrollPhysics(),
                  crossAxisCount: 5,
                  children: icontab.map((IconTabField icont) {
                    return new IconTab(
                        iconTitle: icont.iconTitle, image: icont.image);
                  }).toList(),
                ),
              )),
            ),
            new SectionTab(
              title: "热门专区",
              handleMoreClick: () {
                print("click more");
              },
              child: new Row(
                children: hotPictrues.map((Image img) {
                  return new Expanded(
                      child: new PicToDetail(
                    child: img,
                  ));
                }).toList(),
              ),
            ),
            new SectionTab(
              title: "原创专区",
              handleMoreClick: () {
                print("click more");
              },
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 3,
                    child: new PicToDetail(
                      child: new Image.asset(
                        "assets/img/vertical.jpg",
                      ),
                    ),
                  ),
                  new Expanded(
                      flex: 4,
                      child: new SizedBox(
                        height: 230,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  new Container(
                                    height: ScreenUtil().setHeight(75),
                                    child: new Row(
                                      children: <Widget>[
                                        new Container(
                                          padding: new EdgeInsets.only(
                                              right: ScreenUtil().setWidth(20)),
                                          child: new Column(
                                            children: <Widget>[
                                              new Text(
                                                "雁冰icey",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14),
                                              ),
                                              new Text(
                                                "江苏 摄影师",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        ),
                                        new Image.asset(
                                          "assets/tabnavicon/food-bread.png",
                                          width: ScreenUtil().setWidth(75),
                                        )
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  new Text("熟悉的陌生了，陌生的走远了"),
                                ],
                              ),
                              flex: 1,
                            ),
                            new Expanded(
                              child: new Center(
                                  child: new Row(
                                children: <Widget>[
                                  new Expanded(
                                      child: new PicToDetail(
                                    child: Center(
                                      child: new Image.asset(
                                        "assets/img/vertical.jpg",
                                      ),
                                    ),
                                  )),
                                  new Expanded(
                                      child: new PicToDetail(
                                        child: new Image.asset(
                                          "assets/img/vertical.jpg",
                                        ),
                                  )),
                                  new Expanded(
                                      child: new PicToDetail(
                                        child: new Image.asset(
                                          "assets/img/vertical.jpg",
                                        ),
                                  )),
                                ],
                              )),
                              flex: 1,
                            ),
//
                          ],
                        ),
                      ))
                ],
              ),
            ),
            new SectionTab(
                title: "每日更新",
//                child: new Container(
//                height: 500,
//                  child: new GridView.count(
//                      shrinkWrap: true,
//                      /*收缩包装*/
//                      physics: new NeverScrollableScrollPhysics(),
//                      crossAxisCount: 3,
//                      children: pictrueUpgrade.map((item){
//                        return new FadeInImage.memoryNetwork(
//                          placeholder:kTransparentImage,
//                          image: item.img_url,
//                        );
//                      }).toList(),
//                      crossAxisSpacing: 5.0,
//                      mainAxisSpacing: 5.0,
////                      childAspectRatio: 3 / 4
//                  ),
                  child: new StaggeredGridView.countBuilder(
                    primary: false,
                    shrinkWrap:true,
                    crossAxisCount: 4,
                    itemCount: pictrueUpgrade.length,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    itemBuilder: (context, index) =>  new _Tile(index, pictrueUpgrade[index]),
                    staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
                  ),
                ),
//            )

          ],
        ));
  }
}


class _Tile extends StatelessWidget{
  final int index;
  final PicUpgradeList img;
  _Tile(this.index, this.img);

  @override
  Widget build(BuildContext context) {
    return new FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: img.local_img_url !=null ? "${Utils.getBaseUrl()}${img.local_img_url}":img.img_url );
//    return new Image.network(img.img_url);
  }
}
