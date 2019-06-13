import 'package:flutter/material.dart';
import 'package:my_pictrues/home.dart';
import 'package:my_pictrues/views/album/index.dart';


routes(BuildContext context){
  return <String,WidgetBuilder>{
    '/': (BuildContext context) => new MyHomePage(),
    '/album':(BuildContext context, { arguments }) => new Album( arguments: arguments ),
  };
}



//
//final Map<String, Function> routes = {
////    '/': (BuildContext context) => new MyHomePage(),
//    '/album':(BuildContext context, { arguments }) => new Album( arguments: arguments ),
//};