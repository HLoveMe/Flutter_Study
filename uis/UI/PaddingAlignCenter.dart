import 'package:flutter/material.dart';

/*
Padding的布局分为两种情况：
  * 当child为空的时候，会产生一个宽为left+right，高为top+bottom的区域；
  * 当child不为空的时候，Padding会将布局约束传递给child，根据设置的padding属性，缩小child的布局尺寸。
    然后Padding将自己调整到child设置了padding属性的尺寸，在child周围创建空白区域。

Align 的布局行为分为两种情况：
  * 当widthFactor和heightFactor==null，
    当其有限制条件的时候，Align会根据限制条件尽量的扩展自己的尺寸，
    当没有限制条件的时候，会调整到child的尺寸；
  * 当widthFactor或者heightFactor != null，
    Aligin会根据factor属性，扩展自己的尺寸，
    例如设置widthFactor为2.0的时候，那么，Align的宽度将会是child的两倍。
 */
class PaddingAlignCenter extends StatelessWidget {
  final String title;
  PaddingAlignCenter({Key key, this.title});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(title),
      ),
      body: new Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          child: new Column(
            children: <Widget>[
              Container(
                  color: Colors.yellow,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: new Container(
                          child: Text("A"),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red))))),
              Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.red,
                        child: Text("909090"),
                      ))),
              Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  alignment: Alignment.topLeft,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: Align(
                        //默认居中
                        alignment: Alignment.centerRight,
                        child: Text(
                          "SASA",
                          style: TextStyle(
                              color: Colors.red,
                              backgroundColor: Colors.yellow),
                        ),
                        widthFactor: 4,
                        heightFactor: 4,
                      ))),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                width: 200,
                height: 200,
                child: Center(
                  child: Text("shjkahsjka",
                      style: TextStyle(
                          color: Colors.red, backgroundColor: Colors.yellow)),
                ),
              )
            ],
          )),
    );
  }
}
