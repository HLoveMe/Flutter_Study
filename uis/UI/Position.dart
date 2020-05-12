import 'dart:async';

import 'package:flutter/material.dart';

class StatckPosition extends StatefulWidget {
  final String title;
  StatckPosition({Key key, this.title});
  @override
  State<StatefulWidget> createState() => PositionState();
}

class PositionState extends State<StatckPosition> {
  double x = 0;
  double y = 110;
  bool isRun = false;
  Timer timer;
  @override
  void run() {
    if (isRun == false) {
      timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
        setState(() {
          x+=3;
          y+=3;
        });
      });
      isRun=true;
    }else{
      timer.cancel();
      timer=null;
      isRun=false;
    }
  }


  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('绝对定位${widget.title}'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.directions_run),
              onPressed: () {
                this.run();
              })
        ],
      ),
      body: new Container(
        constraints: BoxConstraints(
            minHeight: double.infinity, minWidth: double.infinity),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
        child: new Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            new Positioned(
              child: new Container(color: Colors.red, width: 30, height: 30),
              left: x,
              top: y,
            ),
            Positioned(
              child: new Container(color: Colors.yellow,width: 40,height: 40),
              left: 0,
              bottom: 0,
              ),
          ],
        ),
      ),
    );
  }
}
