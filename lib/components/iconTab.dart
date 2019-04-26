import 'package:flutter/material.dart';




class IconTab extends StatelessWidget{
//  IconTab(Key key, this.iconTitle):super(key:key);
  IconTab({this.iconTitle, this.icon});
  final String iconTitle;
  final Icon icon;

  @override
  Widget build(BuildContext context){
    return new GestureDetector(
        child: new InkWell(
            onTap: (){
              print("tap");
            },
            child: new Container(
                width: 75.0,
                child: new Container(
                  padding: new EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: new Column(
//                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      icon,
                      new Text(iconTitle)
//                    Center(child: new Text("头像")),
                    ],
                  ),),
                )

            ),

    );
  }
}