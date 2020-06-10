import 'dart:async';

import 'package:flutter/material.dart';

class StatckPosition2 extends StatefulWidget {
  final String title;
  StatckPosition2({Key key, this.title});
  @override
  State<StatefulWidget> createState() => PositionState2();
}

class PositionState2 extends State<StatckPosition2> {
  double x = 0;
  double y = 110;
  bool isRun = false;
  Timer timer;

  void run() {
    if (isRun == false) {
      timer = Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
        setState(() {
          x += 3;
          y += 3;
        });
      });
      isRun = true;
    } else {
      timer.cancel();
      timer = null;
      isRun = false;
    }
  }

  @override
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
          constraints: BoxConstraints(minWidth: double.infinity),
          height: 400,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
          child: new Stack(
            // alignment: AlignmentDirectional.center,
            alignment: Alignment(-1, -1),
            children: <Widget>[
              Text("A"),
              new Positioned(
                child: new Container(color: Colors.red, width: 30, height: 30),
                left: x,
                top: y,
              ),
              Positioned(
                child:
                    new Container(color: Colors.yellow, width: 40, height: 40),
                left: 0,
                bottom: 0,
              ),
            ],
          ),
        ));
  }
}
