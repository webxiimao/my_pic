import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTab extends StatelessWidget{
  SectionTab({Key key, this.title, this.child, this.handleMoreClick}) : super(key:key);
  @required final String title;
  @required final Widget child;
  final Function handleMoreClick;

  @override
  Widget build(BuildContext context){
    return SliverPadding(
      padding: new EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(15)),
      sliver: new SliverToBoxAdapter(
        child: new Container(
          color: Colors.white,
          padding: new EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20)),
          child: new SizedBox(
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
                          new Text(
                            title,
                            style: new TextStyle(
                              fontWeight:FontWeight.bold,
                            ),

                          )
                        ],
                      ),
                    ),
                    new IconButton(icon: Icon(Icons.more_horiz), onPressed: handleMoreClick!=null ? handleMoreClick : null)
                  ],
                ),
                child,
              ],
            ),
          )
        ),
      ),

    );
  }
}