import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
data: 显示的文本信息；
style: 文本样式，Flutter提供了一个TextStyle类，最常用的fontSize，fontWeight，color，backgroundColor和shadows等属性都是通过它设置的；
textAlign: 文字对齐方式，常用可选值有TextAlign的left，right，center和justify；
softWrap: 文字是否换行；
overflow: 当文字溢出的时候，以何种方式处理（默认直接截断）。可选值有TextOverflow的clip，fade，ellipsis和visible；
maxLines: 当文字超过最大行数还没显示完的时候，就会根据overflow属性决定如何截断处理。
 */
class TextPage extends StatelessWidget {
  final String title;
  TapGestureRecognizer tap;
  TextPage({Key key, this.title}){
    this.tap = new TapGestureRecognizer();
    this.tap.onTapUp=this.onClick;
  }
  void onClick(TapUpDetails details){
    print(details);
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(
            "Hello World",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.yellow),
          ),
          new Text(
            "Hello World salsjalsj时就按了开始就卡了健身卡老时间阿拉姜色卡拉胶索拉卡精神科拉深蓝色",
            style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.yellow),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text.rich(TextSpan(
              text: "这是富文本",
              style: TextStyle(color: Colors.blue, fontSize: 15),
              children: [
                new TextSpan(
                    text: "AAAAANBBBB",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                    recognizer: tap)
              ]))
        ],
      )),
    );
  }
}
