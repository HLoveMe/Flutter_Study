import 'package:flutter/material.dart';

class DrawPage extends StatelessWidget {
  final String title;
  DrawPage({this.title});
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget getLead() {
    // return IconButton(icon: Icon(Icons.local_activity), onPressed: null);
    return Builder(builder: (BuildContext context) {
      return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          });
    });
  }

  List<Widget> getAcs(BuildContext _context) {
    return [
      Builder(builder: (BuildContext context) {
        return IconButton(
            icon: Icon(Icons.open_in_new),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            });
      }),
      IconButton(
          icon: Icon(Icons.backup),
          onPressed: () {
            // Scaffold.of(_context).openDrawer();
            _scaffoldKey.currentState.openDrawer();
          })
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(title),
        leading: getLead(),
        actions: this.getAcs(context),
      ),
      body: Container(
          child: Center(
        child: Text("body"),
      )),
      drawer: Drawer(
          child: Container(
              child: Center(
            child: Text("A"),
          )),
          semanticLabel: "Open",
          elevation: 10),
      drawerScrimColor: Colors.red, //拉出之后的背景颜色
      // backgroundColor: Colors.yellow,
      drawerEdgeDragWidth: 20, //边沿拉出 检查范围
    );
  }
}
