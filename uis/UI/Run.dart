import 'package:flutter/material.dart';
import './Container.dart';
import './RowColmun.dart';
import './Position.dart';
import './TextDome.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // final List<String> uis = ["Container"];
  final List<String> uis = ["Container","Row/Column","Position","Text"];
  goSomeUI(String name, BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) {
        switch (name) {
          case "Container":
            return new ContainerPage(title: name);
          case "Row/Column":
            return new RowColumn(title:name);
            case "Position":
            return new StatckPosition(title: name,);
          case "Text":
          return new TextPage(title:name);
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("UIs")),
        body: new ListView(
            children: uis.map((String name) {
          return new ListTile(
              title: new Text(name),
              onTap: () {
                goSomeUI(name, context);
              });
        }).toList()));
  }
}
