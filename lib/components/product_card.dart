import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../utils/color.dart';

class ProductCard extends StatefulWidget {
  final product;

  ProductCard(this.product);

  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.5 - 0.5,
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: widget.product['image'],
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '￥',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: ColorUtil.getColor('warning'),
                      ),
                    ),
                    Text(
                      widget.product['priceStr'],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: ColorUtil.getColor('warning'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: _labels(widget.product['labels']),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(widget.product['subtitle'],
                    style: TextStyle(
                      fontSize: 13.0,
                      color: ColorUtil.getColor('golden'),
                    )),
                Text(widget.product['mainTitle'],
                    style: TextStyle(
                      fontSize: 13.0,
                    )),
                Text(widget.product['thirdContent'],
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey[500],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _labels(list) {
    return list.map<Widget>((f) {
      return Container(
        height: 18.0,
        color: f['color'] == 'danger' ? null : ColorUtil.getColor('primary'),
        padding: f['color'] == 'danger'
            ? EdgeInsets.fromLTRB(2.0, 1.0, 2.0, 1.0)
            : EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
        margin: EdgeInsets.only(right: 5.0),
        decoration: f['color'] != 'danger'
            ? null
            : BoxDecoration(
                border: Border.all(
                  width: 0.55,
                  style: BorderStyle.solid,
                  color: ColorUtil.getColor(f['color']),
                ),
              ),
        child: Text(f['content'],
            style: TextStyle(
              color: f['color'] == 'danger'
                  ? ColorUtil.getColor('danger')
                  : Colors.white,
              fontSize: 10.0,
            )),
      );
    }).toList();
  }
}
