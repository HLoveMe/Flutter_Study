import 'package:flutter/material.dart';

/*
Material 风格的按钮
  RaisedButton：凸起的按钮，其实就是 Material Design 风格的 Button
  FlatButton：扁平化的按钮
  OutlineButton：线框按钮
  IconButton：图标按钮
  ButtonBar：按钮组
  FloatingActionButton：浮动按钮
  DropdownButton：下拉框按钮
  PopupMenuButton 弹出框按钮
 */

/*
Button属性
  onPressed	点击事件监听，传 null 表示按钮禁用
  onHighlightChanged	水波纹高亮变化回调,按下返回true,抬起返回false
  textTheme	定义按钮主题
  textColor	按钮文字颜色
  disabledTextColor	无效按钮文字颜色
  color	按钮颜色
  disabledColor	无效按钮颜色
  focusColor	获取焦点 按钮颜色
  hoverColor	不知道啥玩应儿
  highlightColor	长按 按钮颜色
  splashColor	点击 水波纹 颜色
  colorBrightness	官网：用于此按钮的主题亮度。默认为主题的亮度
  elevation	阴影
  focusElevation
  hoverElevation
  highlightElevation
  disabledElevation
  padding	内边距
  shape	设置形状，如圆角，圆形等
  clipBehavior	剪裁
    Clip.antiAlias：剪辑具有抗锯齿功能
    Clip.antiAliasWithSaveLayer：在剪辑后立即剪辑具有抗锯齿和saveLayer
    Clip.hardEdge：剪辑，但不应用抗锯齿。

  Clip.none：不剪辑。
  focusNode	 
  materialTapTargetSize	 
  animationDuration	 动画
  child	 

OutlineButton 特性
  borderSide 线框    线颜色 ，如红色：BorderSide(color: Colors.red,),
  clipBehavior 相框风格，如：Clip.antiAlias

RaisedButton.icon 特性
  icon 图标
  label 通常是文字

IconButton 特性
  icon 图标
  color 图标颜色
  tooltip 长按文字提示

DropdownButton 特性    DropdownButton
  hint 提示语
  value 当前值
  iconSize 下拉框图片大小
  icon	右边图标  默认为下三角
  items 下拉框数据集合
  onChanged 监听

FloatingActionButton 特性
  child	子元素，一般为 Icon，不推荐使用文字
  tooltip	长按文字提示
  backgroundColor	背景颜色（默认使用主题颜色）
  mini	是否是 mini 类型默认 false
 */
class ButtonPage extends StatelessWidget {
  final String title;
  ButtonPage({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(title)),
      body: new Container(
        padding: EdgeInsets.all(10),
        child: new Column(children: [
          new Row(children: <Widget>[
            new RaisedButton(
              child: Text("普通按钮"),
              color: Colors.red,
              highlightColor: Colors.blue,
              disabledColor: Colors.yellow,
              onPressed: () {},
              padding: EdgeInsets.all(20),
              // elevation: 15,
              // clipBehavior:Clip.antiAlias
            ),
          ]),
          new Row(children: [
            new Container(
                margin: EdgeInsets.only(top: 30),
                width: 150,
                height: 100,
                alignment: Alignment.center,
                // color: Colors.yellow,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 2),
                ),
                child: RaisedButton(
                  child: new Text("居中按钮"),
                  onPressed: () {},
                )),
            new Container(
                margin: EdgeInsets.only(top: 30),
                width: 210,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 2),
                ),
                child: RaisedButton(
                    child: new Text("占满整个Container 去掉水波"),
                    onPressed: () {},
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent))
          ]),
          Row(
            children: <Widget>[
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.camera),
                  label: Padding(
                    padding: EdgeInsets.all(10),
                    child: new Text("A"),
                  )),
              new Container(
                  // color: Colors.red,
                  // width: 100,
                  // height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                      icon: Icon(Icons.call_received),
                      onPressed: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent))
            ],
          ),
          Row(
            children: <Widget>[
              new Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25), right: Radius.circular(25))),
                child: IconButton(
                  icon: Icon(Icons.call_received),
                  onPressed: () {
                    print("ASAS");
                  },
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("圆角1"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              RaisedButton(
                onPressed: () {
                  print("AAAA");
                },
                child: new Container(
                  width: 60,
                  height: 60,
                  color: Colors.red,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text("圆"),
                onPressed: () {},
                shape: CircleBorder(),
              ),
              ClipOval(
                  child: RaisedButton(
                child: Text("圆"),
                onPressed: () {},
                clipBehavior: Clip.antiAlias,
              )),
              new Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25), right: Radius.circular(25))),
                child: IconButton(
                  icon: Icon(Icons.call_received),
                  onPressed: () {},
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('扁平按钮'),
                onPressed: () {},
                color: Colors.blue[200],
              )
            ],
          ),
          Row(children: [
            GestureDetector(
              onTapUp: (Object any) {
                print("点击");
              },
              child: new Container(
                width: 120,
                height: 50,
                color: Colors.red,
                alignment: Alignment.center,
                child: new Text("简单自定义按钮"),
              ),
            )
          ])
        ]),
      ),
    );
  }
}
