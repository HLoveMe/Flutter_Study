import 'package:dome/UI/Drawer.dart';
import 'package:dome/UI/NavigationDomeNamePush.dart';
import 'package:dome/UI/NavigatorDome.dart';
import 'package:flutter/material.dart';
import './Container.dart';
import './RowColmun.dart';
import './Position.dart';
import './Position2.dart';
import './TextDome.dart';
import './ImagePage.dart';
import './Button.dart';
import './PaddingAlignCenter.dart';
import './AppBarPage.dart';
import './AppBar-View-Controller.dart';
import './AppBarViewTabController.dart';
import './Scaffold.dart';
import './Drawer.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Home(),
      routes:{
        "NavigationDome":(context)=>new NavigatorDome(),
        "NameA":(context)=>new NameA(),
        "NameB":(context)=>new NameB(),
        "NameC":(context)=>new NameC(),
      },
    );
  }
}

class Home extends StatelessWidget {
  // final List<String> uis = ["Container"];
  final List<String> uis = [
    "Container",
    "Row/Column",
    "Position",
    "Position2",
    "Text",
    "Image",
    "Button",
    "PaddingAlignCenter",
    "AppBarPage",
    "AppBar-View-TabController",
    "AppBar-View-DefaultTabController",
    "Scaffold",
    "Drawer",
    "NavigationDome"
  ];
  goSomeUI(String name, BuildContext context) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (BuildContext context) {
        switch (name) {
          case "Container":
            return new ContainerPage(title: name);
          case "Row/Column":
            return new RowColumn(title: name);
          case "Position":
            return new StatckPosition(
              title: name,
            );
          case "Position2":
            return new StatckPosition2(
              title: name,
            );
          case "Text":
            return new TextPage(title: name);
          case "Image":
            return new ImagePage(title: name);
          case "Button":
            return new ButtonPage(title: name);
          case "PaddingAlignCenter":
            return PaddingAlignCenter(title: name);
          case "AppBarPage":
            return new AppBarPage(title: name);
          case "AppBar-View-TabController":
            return AppBarViewController(title: name);
          case "AppBar-View-DefaultTabController":
            return AppBarViewDefaultTabController(
              title: name,
            );
          case "Scaffold":
            return ScaffoldPage(title:"ScaffoldPage",);
          case "Drawer":
            return DrawPage(title:"DrawPage");
          case "NavigationDome":
            return NavigatorDome(title:"NavigationDome");
        }
      },settings: RouteSettings(name: name)),
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
