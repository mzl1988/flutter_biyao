import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCategoryPanel extends StatelessWidget {
  final category;

  HomeCategoryPanel(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                category['name'],
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Column(
          children: category['types'].map<Widget>((f) {
            return typePanel(f);
          }).toList(),
        )
      ],
    );
  }

  Widget typePanel(f) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(
                  f['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('更多'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          height: 0.55,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[100],
                width: 0.55,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          //垂直子Widget之间间距
          mainAxisSpacing: 10.0,
          //一行的 Widget 数量
          crossAxisCount: 3,
          //子Widget宽高比例
          childAspectRatio: 0.8,
          //GridView内边距
          padding: EdgeInsets.all(10.0),
          children: f['sunTypes'].map<Widget>((item) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  width: 60.0,
                  height: 60.0,
                  imageUrl: item['image'],
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  item['name'],
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
