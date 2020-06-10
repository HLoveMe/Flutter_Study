import 'dart:async';

import 'package:flutter/material.dart';

/**
 * Stack  | IndexedStack 定位布局容器
 * Positioned  定位元素
 * 
 * Stack的布局行为，根据child是positioned还是non-positioned来区分。
 *  对于positioned的子节点，它们的位置会根据所设置的top、bottom、right以及left属性来确定，这几个值都是相对于Stack的左上角；
 *  对于non-positioned的子节点，它们会根据Stack的aligment来设置位置。
 * 
 * 
 * Stack 
    alignment：对齐方式，默认是左上角（topStart）。
      AlignmentDirectional.topStart
      Alignment(0.1,0.1)  x:[-1,1] y:[-1,1]

    textDirection：文本的方向，绝大部分不需要处理。
    fit：定义如何设置non-positioned节点尺寸，默认为loose。
      其中StackFit有如下几种：
        loose：子节点宽松的取值，可以从min到max的尺寸；
        expand：子节点尽可能的占用空间，取max尺寸；
        passthrough：不改变子节点的约束条件。
    overflow：超过的部分是否裁剪掉（clipped）。
 */

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
