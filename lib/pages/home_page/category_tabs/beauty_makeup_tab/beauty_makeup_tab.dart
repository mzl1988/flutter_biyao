import 'package:flutter/material.dart';

class BeautyMakeupTab extends StatefulWidget {
  BeautyMakeupTab({Key key}) : super(key: key);

  _BeautyMakeupTabState createState() => _BeautyMakeupTabState();
}

class _BeautyMakeupTabState extends State<BeautyMakeupTab> with AutomaticKeepAliveClientMixin {
  int _count = 0;

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('${this._count}'),
        RaisedButton(
          child: Text('count++'),
          onPressed: () {
            setState(() {
              this._count++;
            });
          },
        ),
      ],
    );
  }
}
