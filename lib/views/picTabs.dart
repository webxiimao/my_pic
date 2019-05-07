import "package:flutter/material.dart";

class PicTabs extends StatefulWidget{



  @override
  _PicTabsState createState() => new _PicTabsState();
}


class ImgList{
  ImgList({this.img, this.title, this.total});
  final String img;
  final String title;
  final int total;

}

List<ImgList> imgList = [];

final List<ImgList> imgData = [
  ImgList(img:"assets/img/256.png", title:"头像", total:250),
  ImgList(img:"assets/img/256.png", title:"表情", total:250),
  ImgList(img:"assets/img/256.png", title:"风景建筑", total:250),
  ImgList(img:"assets/img/256.png", title:"文字控", total:250),
  ImgList(img:"assets/img/256.png", title:"明星写照", total:250),
  ImgList(img:"assets/img/256.png", title:"卡通动漫", total:250),
  ImgList(img:"assets/img/256.png", title:"清新可爱", total:250),
  ImgList(img:"assets/img/256.png", title:"影视精选", total:250),
];


class _PicTabsState extends State<PicTabs>{

  @override
  void initState(){
    super.initState();
    _getTabsData();
  }

  void _getTabsData() async{
    setState(() {
      imgList.addAll(imgData);
    });
  }


  @override
  Widget build(BuildContext context){

    Widget _buildListItem(BuildContext context, ImgList item){
      return new Container(
          decoration: new BoxDecoration(
              border: new Border(bottom: new BorderSide(
                width: 1,
                color: Colors.black12
              )),
          ),
        padding: new EdgeInsets.fromLTRB(0,10,0,10),
        margin: new EdgeInsets.only(left: 10),
        height: 100,
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Row(
              children: <Widget>[
                new Image.asset(item.img),
                new Container(
                  padding: new EdgeInsets.all(10),
                  child: new Column(
//                mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Expanded(child: new Center(child: new Text(item.title),)),
                      new Expanded(child: new Center(child: new Text("${item.total}张图片"),))
                    ],
                  ),
                ),
              ],
            ),),
            new IconButton(icon: new Icon(Icons.keyboard_arrow_right), onPressed: null),
          ],
        ),
      );
    };

    return new CustomScrollView(
//      shrinkWrap: true,
      slivers: <Widget>[
        new SliverList(
            delegate: new SliverChildBuilderDelegate((BuildContext context, int index){
              return _buildListItem(context, imgList[index]);
            },
            childCount: imgList.length ),
        )
      ],
//      controller: _scrollcontroller,
//      physics: ,
//        controller:ScrollController()
    );
  }
}


