import 'package:flutter/material.dart';

class NameA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("NameA")),
        body: Container(
          child: Center(
              child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "NameB"),
                  child: Text("Go to NameB"))),
        ));
  }
}

class NameB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("NameB")),
        body: Container(
          child: Center(
              child: RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "NameC"),
                  child: Text("Go to NameC"))),
        ));
  }
}

class NameC extends StatelessWidget {
  bool predicate(Route route){
    final MaterialPageRoute  _router = route as MaterialPageRoute;
    // print(_router);
    print(_router.settings.name);
    if(_router.settings.name == "NavigationDome"){
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("NameC")),
        body: Container(
          child: Center(
              child: RaisedButton(
                  onPressed: () =>{
                    //回到某一个路由  中间路由已经pop
                    Navigator.popUntil(context,this.predicate)
                  },
                  child: Text("Go to Navigation"))),
        ));
  }
}
