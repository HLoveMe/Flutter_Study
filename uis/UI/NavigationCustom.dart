import 'package:flutter/material.dart';

class CustomeNavigation extends StatelessWidget {
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

