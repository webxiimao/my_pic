import 'package:flutter/material.dart';
import './home.dart';

/*导入store*/
import "./inherited.dart";


import './router/router.dart';

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:"my pictures apps",
//      home:new MyHomePage(),/*如果指定了home属性那么路由表不能有"/"存在*/
      initialRoute: "/",
      theme: new ThemeData(
          appBarTheme: new AppBarTheme(
            color: Colors.white,
          )
      ),
//      onGenerateRoute: (RouteSettings setting ){
//        final String name = setting.name;
//        final Function pageContentBuilder = routes['name'];
//        print(name);
//        print(setting.arguments);
//
//        if(pageContentBuilder != null){
//          final Route route = MaterialPageRoute(
//            builder: (context){
//              return pageContentBuilder(context, arguments:setting.arguments);
//            }
//          );
//          return route;
//        }
//      },
      routes: routes(context),
    );
  }
}





