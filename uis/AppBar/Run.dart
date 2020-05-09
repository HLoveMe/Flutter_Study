// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

// This app is a stateful, it tracks the user's current choice.
class AppBarDome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red), home: new MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Choice select = choices[0];
  void changeSelect(int index) {
    this._select(choices[index]);
  }

  void _select(Choice choice) {
    setState(() {
      this.select =choice;
    });
  }
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Main Page"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(choices[0].icon),
              onPressed: () {
                changeSelect(0);
              }),
          new IconButton(
              icon: new Icon(choices[1].icon),
              onPressed: () {
                changeSelect(1);
              }),
          new PopupMenuButton<Choice>(
              onSelected: _select,
              elevation:40,
              // child:new Text("ASAS"),
              // icon:new Icon(Icons.cake),
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice ch) {
                  return PopupMenuItem(child: new Text(ch.title), value: ch);
                }).toList();
              })
        ],
      ),
      body: new Card(
        // color:Colors.grey,
        child: new Center(
            child: new Column(mainAxisSize: MainAxisSize.min, children: [
          new Icon(
            select.icon,
            size: 128,
            color: textStyle.color,
          ),
          new Text(
            select.title,
            style: textStyle,
          )
        ])),
      ),
    );
  }
}
