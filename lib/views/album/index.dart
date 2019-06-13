import 'package:flutter/material.dart';

class Album extends StatefulWidget{
  Album({this.arguments});
  final Map arguments;
  @override
  _AlbumState createState() => new _AlbumState();

}

class _AlbumState extends State<Album>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello ${widget.arguments['user']}'),
        ),
      ),
    );
  }
}