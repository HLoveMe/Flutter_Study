import 'package:flutter/material.dart';

/*
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.endDrawer,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomPadding,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
 */
class ScaffoldPage extends StatelessWidget {
  final String title;
  ScaffoldPage({this.title});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: Container(
          child: Center(
        child: Text("body"),
      )),
      floatingActionButton: IconButton(
          icon: Icon(
            Icons.camera,
            color: Colors.red,
          ),
          onPressed: null),
      // floatingActionButtonLocation
      // floatingActionButtonAnimator
      persistentFooterButtons: [Text("1"), Text("2")],
      drawer: Drawer(
          child: Container(
              child: Center(
            child: Text("A"),
          )),
          semanticLabel: "Open",
          elevation: 10),
      endDrawer: Drawer(
          child: Container(
              child: Center(
            child: Text("A"),
          )),
          semanticLabel: "Open",
          elevation: 10),
      drawerScrimColor: Colors.red,
      backgroundColor: Colors.yellow,
      drawerEdgeDragWidth: 100,

      bottomNavigationBar: Container(
        height: 44,
        child: Text("AA"),
        color: Colors.blue,
      ),
      bottomSheet: Text("bottomSheet"),
      //         this.resizeToAvoidBottomPadding,
      // this.resizeToAvoidBottomInset,
      // extendBody:true,
      // extendBodyBehindAppBar:true
    );
  }
}
