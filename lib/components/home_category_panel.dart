import 'package:flutter/material.dart';

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
                Icons.home,
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
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text(f['name']),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('更多'),
                  Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
