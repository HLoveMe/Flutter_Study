// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 
Image 组件 

  ImageProvider(提供者)
    ExactAssetIamge
    MemoryImage
    AssBundleImageProvider
    AssetImage
    NetworkImage  没有本地缓存
    FileImage

 width / height 组件的高宽

 fit  设置图片填充
    属性名称	样式
    BoxFit.contain	全图居中显示但不充满，显示原比例
    BoxFit.cover	图片可能拉伸，也可能裁剪，但是充满容器
    BoxFit.fill	全图显示且填充满，图片可能会拉伸
    BoxFit.fitHeight	图片可能拉伸，可能裁剪，高度充满
    BoxFit.fitWidth	图片可能拉伸，可能裁剪，宽度充满
    BoxFit.scaleDown	效果和contain差不多， 但是只能缩小图片，不能放大图片

  color & colorBlendMode  颜色和图片混合
  alignment  图片的摆放方式
  repeat 用来设置图片重复显示

  matchTextDirection  调整图片显示方向  需要配合 Directionality 进行使用

  centerSlice 图片内部拉伸 [Image 的高宽  大于  图片的尺寸] 指定区域拉伸

  gaplessPlayback  当图片发生改变之后，重新加载图片过程中的样式
 */
class ImagePage extends StatefulWidget {
  final String title;
  TapGestureRecognizer tap;
  ImagePage({Key key, this.title});
  @override
  State<StatefulWidget> createState() => _ImagePage();
}

class _ImagePage extends State<ImagePage> {
  var imageUrl =
      "http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg";

  var imageUrl2 =
      "http://n.sinaimg.cn/sports/2_img/upload/4f160954/107/w1024h683/20181128/Yrxn-hpinrya6814381.jpg";
  ImageProvider networkImage;
  @override
  void initState() {
    super.initState();
    networkImage = new NetworkImage(imageUrl, scale: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(children: [
        new Text("本地图片"),
        Padding(
            padding: EdgeInsets.all(5),
            child: new Row(children: [
              new Image(image: new AssetImage("images/cat.jpg")),
              Image.asset("images/cat.jpg")
            ])),
        Text("加载图片过度效果"),
        new Row(children: [
          new FadeInImage.assetNetwork(
            placeholder: "images/loading.gif",
            image: imageUrl2,
            width: 100,
            height: 50,
            fadeOutDuration: const Duration(milliseconds: 1000),
            fadeInDuration: const Duration(milliseconds: 1000),
          ),
        ]),
        Text("网络占位图片CachedNetworkImage："),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: new Row(children: [
            // FadeInImage.memoryNetwork(placeholder:  kTransparentImage, image: null)
          ]),
        ),
        Text("repeat"),
        new Image.asset(
          "images/cat.jpg",
          width: double.infinity,
          height: 100,
          repeat: ImageRepeat.repeatX,
          alignment: Alignment(-1, 0),
        ),
        Text("圆角图片"),
        new Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          new Container(
            width: 120,
            height: 60,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          new ClipOval(
            child: Image.asset(
              'images/cat.jpg',
              width: 50,
              height: 50,
              fit: BoxFit.fitHeight,
            ),
          ),
          new ClipOval(
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.fitHeight,
            ),
          ),
          new ClipRRect(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20), right: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.fitHeight,
              ))
        ]),
        new Text('centerSlice图片内部拉伸：'),
        Image.asset(
          "images/cat.jpg",
          height: 200,
          width: double.infinity,
          centerSlice:
              new Rect.fromCircle(center: const Offset(40, 20), radius: 1),
        ),
        new Text('方向'),
        new Row(children: [
          new Image(image: new AssetImage("images/cat.jpg")),
          Directionality(
              child: Image.asset("images/cat.jpg", matchTextDirection: true),
              textDirection: TextDirection.rtl)
        ]),
        new Text('点击替换图片'),
        new Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Row(
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  setState(() {
                    networkImage = new NetworkImage(imageUrl2, scale: 8.5);
                  });
                },
                child: Text('点击更换图片'),
              ),
              new Image(
                gaplessPlayback: false,
                fit: BoxFit.contain,
                image: networkImage,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
