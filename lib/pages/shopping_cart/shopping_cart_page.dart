import 'package:flutter/material.dart';
import '../../utils/color.dart';

class ShoppingCartPage extends StatefulWidget {
  ShoppingCartPage({Key key}) : super(key: key);

  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorUtil.getColor('primary'),
          title: Text('Cart'),
        ),
        body: Center(
          child: Container(
            child: Text('Cart'),
          ),
        ),
      );
  }
}
