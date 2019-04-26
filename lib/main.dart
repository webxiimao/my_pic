import 'package:flutter/material.dart';

/*导入store*/
import "./inherited.dart";

/*pages*/
import "./views/featured.dart";
import "./views/newest.dart";
import "./views/picTabs.dart";

void main() => runApp(new MyApp());

class TabClass{
  const TabClass({this.title, this.choice});
  final String title;
  final Widget choice;

}

final List<TabClass> choices =  [
  TabClass(title:"精选", choice:new Featured()),
  TabClass(title:"最新", choice:new Newest()),
  TabClass(title:"分类", choice:new PicTabs())
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


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new AppInheritedWidget(
        child: new DefaultTabController(
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
                  padding: new EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
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
          ),),
      ),
      theme: new ThemeData(
          appBarTheme: new AppBarTheme(
            color: Colors.white,
          )
      ),
    );
  }
}