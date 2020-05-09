import 'package:flutter/material.dart';
import './Container.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  // final List<String> uis = ["Container"];
  final List<String> uis = ["Container"];
  goSomeUI(String name, BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) {
        switch (name) {
          case "Container":
            return new ContainerPage(title: name);
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
