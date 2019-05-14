import "package:flutter/material.dart";
import '../../services/http.dart';
import '../../utils/utils.dart';

class PicTabs extends StatefulWidget {
  @override
  _PicTabsState createState() => new _PicTabsState();
}

List imgList = [];

class ImgList {
  ImgList({this.local_cover_img,this.cover_img, this.tag, this.title});

  final String cover_img;
  final String local_cover_img;
  final String title;
  final String tag;

//  final int total;

  factory ImgList.fromJson(Map<String, dynamic> json) {
    return ImgList(
      cover_img: json['cover_img'] as String,
      title: json['title'] as String,
      tag: json['tag'] as String,
      local_cover_img: json['local_cover_img'] as String,
    );
  }
}

class _PicTabsState extends State<PicTabs> {
  @override
  void initState() {
    super.initState();
    _getTabsData();
  }

  void _getTabsData() async {
    var result =
        await HttpUtils.request("/girls/getTags",data: {"a":1}, method: HttpUtils.GET);
    List list = [];
    if (result['status']) {
      list = result['data']['list'];
    }
    if (mounted) {
      setState(() {
        imgList = list.map((json) => ImgList.fromJson(json)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildListItem(BuildContext context, ImgList item) {
      return new Container(
        decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(width: 1, color: Colors.black12)),
        ),
        padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
        margin: new EdgeInsets.only(left: 10),
        height: 100,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Image.network(
                    item.local_cover_img!=null?"${Utils.getBaseUrl()}${item.local_cover_img}":item.cover_img ,
                    fit: BoxFit.fill,
                  ),
//                  new Image.network(
//                    "http://t1.hxzdhn.com/uploads/tu/201903/9999/rn870a9e70c8.jpg",
//                    fit: BoxFit.fill,
//                  ),
                  new Expanded(
                    child: new Container(
                      padding: new EdgeInsets.all(10),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                              child: new Align(
                            child: new Text(
                                item.tag,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                            ),
                            alignment: Alignment.centerLeft,
                          )),
                          new Expanded(
                              child: new Align(
                            alignment: Alignment.centerLeft,
                            child: new Text(
                              item.title,
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black38),
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            new IconButton(
                icon: new Icon(Icons.keyboard_arrow_right), onPressed: null),
          ],
        ),
      );
    }

    ;

    return new CustomScrollView(
//      shrinkWrap: true,
      slivers: <Widget>[
        new SliverList(
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            return _buildListItem(context, imgList[index]);
          }, childCount: imgList.length),
        )
      ],
//      controller: _scrollcontroller,
//      physics: ,
//        controller:ScrollController()
    );
  }
}
