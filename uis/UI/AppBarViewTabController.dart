import 'dart:async';

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
  void initState() {
    super.initState();
  }

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

class SomePage extends StatefulWidget {
  final String content;
  SomePage({Key key, this.content});
  @override
  State<StatefulWidget> createState() => new TabPageState();
}

class TabPageState extends State<SomePage> {
  Timer _timer;
  int num = 0;
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        num += 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(width: 2, color: Colors.red)),
        child: Center(
          child: new Text('${widget.content}-${num}'),
        ));
  }
}
