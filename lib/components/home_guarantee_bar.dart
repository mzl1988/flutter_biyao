import 'package:flutter/material.dart';
import '../utils/color.dart';

class HomeGuaranteeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '大牌品质',
            style: TextStyle(
                fontSize: 13.0, color: ColorUtil.getColor('primary54')),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
          ),
          Text(
            '工厂价格',
            style: TextStyle(
                fontSize: 13.0, color: ColorUtil.getColor('primary54')),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
          ),
          Text(
            '分期支付',
            style: TextStyle(
                fontSize: 13.0, color: ColorUtil.getColor('primary54')),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
          ),
          Text(
            '顺丰包邮',
            style: TextStyle(
                fontSize: 13.0, color: ColorUtil.getColor('primary54')),
          ),
          Text(
            '/',
            style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
          ),
          Text(
            '无忧退款',
            style: TextStyle(
                fontSize: 13.0, color: ColorUtil.getColor('primary54')),
          ),
        ],
      ),
    );
  }
}
