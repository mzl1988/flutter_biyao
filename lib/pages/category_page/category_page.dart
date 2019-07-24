import 'package:flutter/material.dart';
import '../../utils/color.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtil.getColor('primary'),
        title: Text('Category'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text('${this._count}'),
            ),
            RaisedButton(
              child: Text('count++'),
              onPressed: () {
                setState(() {
                  this._count++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
