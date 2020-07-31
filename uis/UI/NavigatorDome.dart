import 'package:flutter/material.dart';

/**
 * 路由：
 *    PageRoute  页面 (继承ModalRoute)  opaque=true
 *    PopupRoute popup弹窗(继承ModalRoute) opaque=false
 *    ModalRoute modal模态页面  opaque=false
 * 
 * 导航：
 *  pop
 *  push
 *  popUntil  pop直到某一个路由
 * 
 *  pushReplacementNamed 向前进 并替换当前路由
 *  popAndPushNamed 线后退 在压入栈
 * 
 *  pushAndRemoveUntil/pushNamedAndRemoveUntil 向前进 并且删除之前的路由直到某个理由
 *    Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false); 
 *    删除路由栈中所有路由
 *  
 * removeRoute  在路由栈中移除，某个路由
 * removeRouteBelow  待验证
 * 
 * replace   替换路由  使用A 替换B
 * replaceRouteBelow  待验证
 * 
 * 
 * 自定义路由  待验证
 * 
 * 嵌套路由   待验证
 */
class NavigatorDome extends StatefulWidget {
  final String title;
  NavigatorDome({this.title});
  @override
  State<StatefulWidget> createState() => NavigationState();
}

class NavigationState extends State<NavigatorDome> {
  final GlobalKey<ScaffoldState> s_key = new GlobalKey<ScaffoldState>();
  _toParams(BuildContext context) {
    /**
     *  Setting 
     *    arguments 用于传参
     *    name 用于指定路由名称 可用于跳转
    */

    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new TwoPage(param1: "参数1 123"),
          settings: RouteSettings(arguments: "参数2 456", name: "zzh")),
    );
  }

  _getParams(BuildContext context) async {
    var result = await Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => TherePage(param1: "返回传参数")));
    if (result != null && result is String) {
      this.s_key.currentState
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("$result")));
    }
    // Scaffold.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text("$result")));
  }

  _goRouter(BuildContext context) {
    /**
     * 
     return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Home(),
      routes:{
        "NavigationDome":(context)=>new NavigatorDome(),
        "NameA":(context)=>new NameA(),
        "NameB":(context)=>new NameB(),
        "NameC":(context)=>new NameC(),
      },
    );
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      // home: Home(),
      routes:{
        "/":(context)=>new Home(),
        "/NavigationDome":(context)=>new NavigatorDome(),
        "/NameA":(context)=>new NameA(),
        "/NameB":(context)=>new NameB(),
        "/NameC":(context)=>new NameC(),
      },
    );
     * 
     */
    Navigator.of(context).pushNamed("NameA");
  }

  _modal1(BuildContext context) {
    //继承Modal的页面
    Navigator.of(context).push(ModalPage111());
  }

  _modal2(BuildContext context) {
    //普通页面继承 PageRoute
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => ModalPage222()));

    // Navigator.of(context).push(PageRouteBuilder(
    //     opaque: false,
    //     pageBuilder: (BuildContext context, Animation animation,
    //             Animation secondaryAnimation) =>
    //         FadeTransition(
    //             //使用渐隐渐入过渡,
    //             opacity: animation,
    //             child: ModalPage222())));
  }

  @override
  Widget build(BuildContext context) {
    // Columns
    return new Scaffold(
      key: this.s_key,
      appBar: new AppBar(
        title: new Text("NavigatorDome"),
      ),
      body: new Container(
        height: double.infinity,
        child: ListView(children: [
          new ListTile(
            title: Text("传递参数"),
            onTap: () => this._toParams(context),
          ),
          new ListTile(
              title: Text("得到返回参数"), onTap: () => this._getParams(context)),
          new ListTile(
              title: Text("多级路由跳转"), onTap: () => this._goRouter(context)),
          new ListTile(
              title: Text("modal 界面1"), onTap: () => this._modal1(context)),
          new ListTile(
              title: Text("modal 界面2"), onTap: () => this._modal2(context))
        ]),
      ),
    );
  }
}

class TwoPage extends StatelessWidget {
  final String param1;
  TwoPage({Key key, this.param1});
  @override
  Widget build(BuildContext context) {
    final String param2 = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Two NavigatorDome"),
      ),
      body: Container(
          child: Center(
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            new RaisedButton(onPressed: null, child: Text(this.param1)),
            new RaisedButton(onPressed: null, child: Text(param2)),
          ]))),
    );
  }
}

class TherePage extends StatelessWidget {
  final String param1;
  TherePage({Key key, this.param1});
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("There NavigatorDome"),
      ),
      body: Container(
          child: Center(
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            new RaisedButton(
                onPressed: () => {Navigator.pop(context, "返回参数 789")},
                child: Text(this.param1))
          ]))),
    );
  }
}

class ModalPage111 extends ModalRoute {
  @override
  Color get barrierColor => Colors.yellow.withOpacity(0.5);

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: Center(child: Text("Modal test")),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}

class ModalPage222 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.65),
      body: Container(
        // color: Colors.brown,
        padding: EdgeInsets.only(bottom: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            child: Text('返回'),
            onPressed: () => {Navigator.of(context).pop('')},
          ),
        ),
      ),
    );
  }
}
