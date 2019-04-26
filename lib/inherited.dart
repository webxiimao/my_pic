import "package:flutter/material.dart";



class _AppInherited extends InheritedWidget{
  _AppInherited({
    Key key,
    @required Widget child,
    @required this.data
  }):super(key:key, child:child);

  final AppInheritedWidgetState data;
  @override
  bool updateShouldNotify(_AppInherited oldWidget){
    return true;
  }

}



class AppInheritedWidget extends StatefulWidget{
  AppInheritedWidget({
    Key key,
    this.child
  }) : super(key:key);

  final Widget child;

  @override
  AppInheritedWidgetState createState() => new AppInheritedWidgetState();
  
  static AppInheritedWidgetState of([BuildContext context, bool rebuild = true]){
    return (rebuild?context.inheritFromWidgetOfExactType(_AppInherited) as _AppInherited:context.ancestorWidgetOfExactType(_AppInherited) as _AppInherited).data;
  }


}



class AppInheritedWidgetState extends State<AppInheritedWidget>{

  @override
  Widget build(BuildContext context){
    return new _AppInherited(
      child:widget.child,
      data:this,
    );
  }


}