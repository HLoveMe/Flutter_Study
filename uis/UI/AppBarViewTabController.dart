import 'package:flutter/material.dart';

class AppBarViewDefaultTabController extends StatefulWidget {
  final String title;
  AppBarViewDefaultTabController({Key key, this.title});

  @override
  State<StatefulWidget> createState() => AppBarState();
}

/**
 
 TabBar(Tab) + TabBarView + DefaultTabController 一起使用

 */
class AppBarState extends State<AppBarViewDefaultTabController> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 4,
        child: new Scaffold(
            appBar: new AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                  tabs: [
                    new Tab(
                      icon: Icon(Icons.directions_car),
                      text: "第一页",
                    ),
                    new Tab(
                      icon: Icon(Icons.directions_bike),
                      text: "第二页",
                    ),
                    new Tab(
                      icon: Icon(Icons.directions_bus),
                      text: "第三页",
                    ),
                    new Tab(
                      icon: Icon(Icons.directions_walk),
                      text: "第四页",
                    )
                  ],
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 5,
                  indicatorColor: Colors.red),
            ),
            body: new TabBarView(
              children: ["A", "B", "C", "D"].map((String name) {
                return new SomePage(content: name);
              }).toList(),
            )));
  }
}

class SomePage extends StatelessWidget {
  final String content;
  SomePage({Key key, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(content),
      alignment: Alignment.center,
    );
  }
}
