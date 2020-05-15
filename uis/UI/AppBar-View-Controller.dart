import 'package:flutter/material.dart';

class AppBarViewController extends StatefulWidget {
  final String title;
  AppBarViewController({Key key, this.title});

  @override
  State<StatefulWidget> createState() => AppBarState();
}
/**
 
 TabBar(Tab) + TabBarView + DefaultTabController 一起使用

TabController
 */
class AppBarState extends State<AppBarViewController> {
  IconData leadicon = Icons.train;
  bool centerTitle = true;

  @override
  Widget build(BuildContext context) {
    // DefaultTabController
    
    return new Scaffold(
        appBar:new AppBar(
          title:Text(widget.title)
        ),
        body: new Container()
    );
  }
}
