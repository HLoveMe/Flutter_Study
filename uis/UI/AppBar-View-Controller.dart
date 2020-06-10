import 'dart:async';

import 'package:flutter/material.dart';

class AppBarViewController extends StatefulWidget {
  final String title;
  AppBarViewController({Key key, this.title});

  @override
  State<StatefulWidget> createState() => AppBarState();
}

/**
 
 TabBarView TabController

 */
class AppBarState extends State<AppBarViewController>
    with SingleTickerProviderStateMixin {
  IconData leadicon = Icons.train;
  bool centerTitle = true;
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // DefaultTabController

    return new Scaffold(
        appBar: new AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  var lastIndex = _controller.index + 1;
                  if (lastIndex >= _controller.length) {
                    lastIndex = 0;
                  }
                  _controller.animateTo(lastIndex);
                })
          ],
          bottom: PreferredSize(
              child: new Container(
                color: Colors.red,
                height: 48,
                alignment: Alignment.center,
                child: TabPageSelector(
                    controller: _controller,
                    color: Colors.yellow,
                    indicatorSize: 14,
                    selectedColor: Colors.blue),
              ),
              preferredSize: new Size.fromHeight(48)),
        ),
        body: new TabBarView(
            children: ["A", "B", "C", "D"].map((String name) {
              return new TabPage(title: name,);
            }).toList(),
            controller: _controller));
  }
}

class TabPage extends StatefulWidget {
  final String title;
  TabPage({Key key, this.title});
  @override
  State<StatefulWidget> createState() => new TabPageState();
}

class TabPageState extends State<TabPage> {
  Timer _timer;
  int num = 0;
  @override
  void initState() {
    _timer = new Timer(Duration(seconds: 1), () {
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
          child: new Text('${widget.title}-${this.num}'),
        ));
  }
}
