import 'package:flutter/material.dart';

/*
 *
  该组件用作布局组件

  Row和Column组件其实和web/rn中的Flex布局
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
        主轴为起始位置 
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
        次轴为居中 
    MainAxisSize mainAxisSize = MainAxisSize.max,
        在主轴上的尺寸。[是包裹其内容，还是撑满其父容器]
    List<Widget> children = const <Widget>[],

    Row   主轴为横向

    Column 主轴为纵向
      次轴为居中 所以不会撑满父容器。设置CrossAxisAlignment.stretch
 */

class RowColumn extends StatelessWidget {
  final String title;
  RowColumn({this.title});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row / Column"),
      ),
      body: new Container(
        height: 200,
        decoration: new BoxDecoration(border: Border.all(color: Colors.red)),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Text("AAA"),
            new Container(
              // color: Colors.blue,
              child: new Center(child: new Text("Container")),
              // width: 40,
              height: 50,
              padding: EdgeInsets.only(left: 100),
              decoration: new BoxDecoration(
                  border: Border.all(
                color: Colors.red,
              )),
            )
          ],
        ),
      ),
    );
  }
}
