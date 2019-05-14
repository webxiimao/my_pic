import "package:flutter/material.dart";

class Newest extends StatefulWidget{


  @override
  _NewestState createState() => new _NewestState();
}


class _NewestState extends State<Newest>{
  @override
  Widget build(BuildContext context){
    return new Center(
      child: new Text("这是最新页面"),
    );
  }
}