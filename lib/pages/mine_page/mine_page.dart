import 'package:flutter/material.dart';
import '../../utils/color.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorUtil.getColor('primary'),
        title: Text('Mine'),
      ),
      body: Center(
        child: Container(
          child: Text('Mine'),
        ),
      ),
    );
  }
}
