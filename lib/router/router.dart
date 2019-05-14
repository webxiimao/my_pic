import 'package:flutter/material.dart';
import 'package:my_pictrues/home.dart';


routes(BuildContext context){
  return <String,WidgetBuilder>{
    '/': (BuildContext context) => new MyHomePage(),
  };
}