import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTab extends StatelessWidget{
  SectionTab({Key key, this.title, this.child, this.more}) : super(key:key);
  @required final String title;
  @required final Widget child;
  final Function more;

  @override
  Widget build(BuildContext context){
    return Center(
      child: new Container(
          color: Colors.white,
          child: new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                      child:new Row(
                        children: <Widget>[
                          new Container(
                            margin:new EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), 0),
                            width: ScreenUtil().setWidth(10),
                            height: ScreenUtil().setHeight(20),
                            color: Colors.black,
                          ),
                          new Text(title)
                        ],
                      ), 
                  ),
                  new IconButton(icon: Icon(Icons.more_horiz), onPressed: null)
                ],
              ),
              child,
            ],
          ),
        ),

    );
  }
}