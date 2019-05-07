import 'package:flutter/material.dart';
import './utils/adapt.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*导入store*/
import "./inherited.dart";

/*pages*/
import "./views/featured.dart";
import "./views/newest.dart";
import "./views/picTabs.dart";
import './views/test.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:"my pictures apps",
      home:new MyHomePage(),
      theme: new ThemeData(
          appBarTheme: new AppBarTheme(
            color: Colors.white,
          )
      ),
    );
  }
}





class TabClass{
  const TabClass({this.title, this.choice});
  final String title;
  final Widget choice;

}

final List<TabClass> choices =  [
  TabClass(title:"精选", choice:new Featured()),
  TabClass(title:"最新", choice:new Newest()),
  TabClass(title:"分类", choice:new PicTabs()),
  TabClass(title:"测试", choice:new Test()),
];


class ChoiceCard extends StatelessWidget{
  const ChoiceCard({Key key,this.choice}) : super(key:key);
  final Widget choice;
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: choice
      );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new DefaultTabController(
          length: choices.length,
          child: new Scaffold(
              appBar: new AppBar(
                elevation: 0.3,
                leading: new Icon(Icons.search),
//                brightness:Brightness.light,
                iconTheme: new IconThemeData(
                  color: Colors.black,
                ),
                title: new Container(
                  padding: new EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
                  child: new TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 1.0,
                      labelColor: Colors.black,
                      tabs: choices.map((TabClass choice) {
                        return new Tab(
                          text:choice.title,
                        );
                      }).toList()
                  ),
                ),
                actions: <Widget>[
                  new Icon(Icons.account_circle)
                ],
              ),
              body: new TabBarView(children: choices.map((TabClass choice){
                return new ChoiceCard(choice:choice.choice);

              }).toList())
          ));
  }
}