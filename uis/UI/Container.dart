import 'package:flutter/material.dart';

/*
  单 子节点视图 类似 div View
 
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

布局行为
  一般情况下，Container会遵循如下顺序去尝试布局：
    对齐（alignment）；
    调节自身尺寸适合子节点；
    采用width、height以及constraints布局；
    扩展自身去适应父节点；
    调节自身到足够小。

  进一步说：
    如果没有子节点、没有设置width、height以及constraints，并且父节点没有设置unbounded的限制，Container会将自身调整到足够小。
    如果没有子节点、对齐方式（alignment），但是提供了width、height或者constraints，那么Container会根据自身以及父节点的限制，将自身调节到足够小。
    如果没有子节点、width、height、constraints以及alignment，但是父节点提供了bounded限制，那么Container会按照父节点的限制，将自身调整到足够大。
    如果有alignment，父节点提供了unbounded限制，那么Container将会调节自身尺寸来包住child；
    如果有alignment，并且父节点提供了bounded限制，那么Container会将自身调整的足够大（在父节点的范围内），然后将child根据alignment调整位置；
    含有child，但是没有width、height、constraints以及alignment，Container会将父节点的constraints传递给child，并且根据child调整自身。
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
