import 'package:flutter/material.dart';

/**
 * 单 子节点视图 类似 div View
 
  double width,  宽
  double height,高
  this.margin, 外边距
  this.padding,内边距
  Color color, 背景颜色
  this.alignment, Alignment 指定子控件如何排列
  BoxConstraints constraints  约束 [minWidth/maxWidth/minHeight/maxHeight]属性进行配置
  Decoration decoration,  BoxDecoration [边框，阴影，渐变，圆角]
    Failed assertion: line 319 pos 15: 'color == null || decoration == null'
    Container 的color 和 decoration 不能同时存在
  this.foregroundDecoration,
  this.transform,   [形变]
  this.child,
 */
class ContainerPage extends StatelessWidget {
  final String title;
  ContainerPage({this.title});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        new Container(
          width: 100,
          height: 100,
          color: Colors.grey[300],
          child: new Text("AA"),
        ),
        new Container(
          width: 100,
          height: 100,
          color: Colors.red[300],
          child: new Text("AA"),
          padding: EdgeInsets.only(top: 30, left: 10),
          // margin: EdgeInsets.all(20),
        ),
        new Container(
          width: 100,
          height: 100,
          color: Colors.blue[300],
          child: new Container(child: new Text("Dome"), color: Colors.red),
          // alignment: Alignment.center,
          // alignment: Alignment.bottomRight,
          alignment: Alignment(.0,0),
        ),
        new Container(
          color: Colors.blue[300],
          child: new Container(child: new Text("AA"), color: Colors.red),
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 10),
          constraints: BoxConstraints.tightFor(height: 100, width: 100),
        ),
        new Container(
            // color: Colors.grey,
            child: new Container(child: new Text("AA"), color: Colors.red),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            constraints: BoxConstraints.tightFor(height: 200, width: 200),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.red, width: 1, style: BorderStyle.solid),
                // gradient: LinearGradient(
                //     colors: [Colors.red, Colors.blue],
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomLeft),
                gradient: RadialGradient(
                    colors: [Colors.blue, Colors.yellow],
                    center: Alignment.center,
                    radius: 0.5),
                // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 2),
                    blurRadius: 6,
                    spreadRadius: 4,
                    color: Color.fromARGB(20, 0, 0, 0),
                  )
                ])),
        new Container(
          width: 100,
          height: 100,
          color: Colors.blue[300],
          child: new Container(child: new Text("AA"), color: Colors.red),
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(-45),
          // alignment: Alignment.bottomRight,
        ),
      ]),
    );
  }
}
