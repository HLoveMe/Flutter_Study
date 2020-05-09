import 'package:flutter/material.dart';
import './CartList.dart';
class MyAppDome1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Shopping List'),
        ),
        body: new Container(
          child: new CartList(
              products: [new Product(name: "AA"), new Product(name: "BB")]),
        ));
  }
}