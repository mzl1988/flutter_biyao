import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCategoryNav extends StatefulWidget {
  final categorys;

  HomeCategoryNav(this.categorys);

  _HomeCategoryNavState createState() => _HomeCategoryNavState();
}

class _HomeCategoryNavState extends State<HomeCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      decoration: BoxDecoration(color: Colors.white),
      child: Wrap(
        children: _items(),
      ),
    );
  }

  List<Widget> _items() {
    return widget.categorys.map<Widget>((f) {
      return Container(
        width: (MediaQuery.of(context).size.width - 20.0) * 0.2,
        margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              width: 40.0,
              height: 40.0,
              imageUrl: f['image'],
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(f['name'], style: TextStyle(fontSize: 12.0)),
          ],
        ),
      );
    }).toList();
  }
}
