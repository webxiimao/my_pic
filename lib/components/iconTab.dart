import 'package:flutter/material.dart';


class IconTab extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new GestureDetector(
        child: new InkWell(
          onTap: (){
            print("tap");
          },
          child: new Container(
            width: 50,
            child: new Column(
              children: <Widget>[
                new Icon(Icons.access_alarm),
                new Text("头像"),
              ],
            ),
          )
        )

    );
  }
}