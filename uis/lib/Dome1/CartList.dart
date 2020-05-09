import 'package:flutter/material.dart';

class CartList extends StatefulWidget {
  final List<Product> products;
  CartList({this.products});
  @override
  State<StatefulWidget> createState() {
    return new CartListState();
  }
}

class CartListState extends State<CartList> {
  final Set<Product> products = new Set();
  void _changeState(Product pro, bool inCart) {
    setState(() {
      if (inCart) {
        products.remove(pro);
      } else {
        products.add(pro);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(10),
      children: widget.products.map((Product pro) {
        return new GoodItem(
          good: pro,
          inCart: this.products.contains(pro),
          call: _changeState,
        );
      }).toList(),
    );
  }
}

class Product {
  final String name;
  const Product({this.name});
}

typedef VoidChangeGoodState(Product pro, bool inCart);

class GoodItem extends StatelessWidget {
  final Product good;
  final bool inCart;
  final VoidChangeGoodState call;
  GoodItem({Key key,this.good, this.inCart, this.call});

  Color getColor(BuildContext context){
    return inCart ? Colors.red : Theme.of(context).primaryColor;
  }
  TextStyle getStyle(BuildContext context){
    if(!inCart)return null;
    return new TextStyle(
      color: Colors.red,
      decoration: TextDecoration.underline,
      fontSize: 20
    );
  }
  @override
  Widget build(BuildContext context) {
    // return new Text("AA");
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor:getColor(context),
        child: Text(good.name),
      ),
      title: new Text(good.name,style: getStyle(context)),
      onTap: (){
        call(good,inCart);
      },
    );
    // return new Row(
    //   children: [
    //     new Title(color: null, child: new Text(good.name)),
    //     new Expanded(
    //         child: new Container(
    //       padding: EdgeInsets.all(8),
    //       child: new Center(child: new RaisedButton(onPressed: null)),
    //     ))
    //   ],
    // );
  }
}
