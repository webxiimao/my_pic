import 'package:flutter/material.dart';


class IconTab extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
        child: new Center(
            child: new Container(
              width: 70.0,
              height: 70.0,
              child: new InkWell(
                onTap: (){
                  print("tap");
                },
                child: new Container(
                  padding: new EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: new Column(
//                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new Icon(
                        Icons.access_alarm,
                      ),
                      new Text("头像")
//                    Center(child: new Text("头像")),
                    ],
                  ),),
                )
              )
            ),

    );
  }
}