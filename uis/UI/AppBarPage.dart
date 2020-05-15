import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  final String title;
  AppBarPage({Key key, this.title});

  @override
  State<StatefulWidget> createState() => AppBarState();
}

/***
 * 
  leading 左侧控件 一般是返回键
  title  中间文字
  titleSpacing:控制 显示Text 控件 左右间距
  backgroundColor:背景颜色  MaterialApp.theme.primarySwatch
  brightness： 亮度显示
  centerTitle 文字是否中间显示
  actions:右侧 功能控件
  bottom  PreferredSizeWidget 在状态栏下一个控件 ：TabBar | PreferredSize
  automaticallyImplyLeading 是否自定显示返回键
  toolbarOpacity 透明度
  bottomOpacity
  elevation 控制应用栏下方阴影的大小
  primary true 导航栏上分是否用状态栏的高度填充
  flexibleSpace   一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果
      appBar:SliverAppBar();
 * 
 */
class AppBarState extends State<AppBarPage> {
  IconData leadicon = Icons.train;
  bool centerTitle = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //   leading: IconButton(
        //     icon: Icon(leadicon),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   // backgroundColor: Colors.blue,
        //   title: Text("AppBarsasasasasasasasaaaaqqqqsasas (1)"),
        //   titleSpacing: 20,
        //   centerTitle: centerTitle,
        //   toolbarOpacity: 0.5,
        //   bottomOpacity: 0.1,
        //   elevation: 10, //
        //   primary: true,
        // ),
        // appBar: PreferredSize(
        //     child: AppBar(
        //       title: new Text("改变appBar高度(2)"),
        //     ),
        //     preferredSize:const  Size.fromHeight(108)),
        appBar: AppBar(
          title: Text("自定义bottom (3)"),
          bottom: PreferredSize(
              child: new Container(
                color: Colors.red,
                // width: double.infinity,
                alignment: Alignment.center,
                height: 48.0,
                child: Text("A"),
              ),
              preferredSize: const Size.fromHeight(48)),
        ),
        body: new Container());
  }
}
