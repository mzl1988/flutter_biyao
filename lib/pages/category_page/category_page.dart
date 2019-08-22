import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../components/home_category_panel.dart';
import '../../utils/color.dart';
import './category_data.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  Timer _timer;
  bool _isSelectedTimeOut = true;
  ScrollController _scrollController = ScrollController();
  AutoScrollController _controller = AutoScrollController();
  var _keys = {};
  List<dynamic> _categorys;

  dynamic _selectedCategory;

  @override
  void initState() {
    super.initState();
    setState(() {
      _categorys = categorys;
      _selectedCategory = _categorys[0];
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 12.0,
        title: _hearderBar,
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            child: ListView(
              physics: ClampingScrollPhysics(),
              controller: _scrollController,
              children: _leftListViewItems(),
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                List widgetIndexs = [];
                _keys.forEach((index, key) {
                  var itemRect = getRectFromKey(index, key);

                  if (itemRect != null &&
                      itemRect['offsetY'] > itemRect['height']) {
                    widgetIndexs.add(itemRect);
                  }
                });

                if (widgetIndexs.length > 0) {
                  int widgetIndex = widgetIndexs[0]['index'];
                  if ((widgetIndexs[0]['offsetY'] - widgetIndexs[0]['height']) >
                      400) {
                    widgetIndex -= 1;
                  }
                  if (widgetIndex != _selectedCategory['index']) {
                    _leftAnimateToIndex(widgetIndex);
                  }
                }

                return true;
              },
              child: ListView(
                controller: _controller,
                physics: ClampingScrollPhysics(),
                children: _categorys.map<Widget>((f) {
                  _keys[f['index']] = new GlobalKey();
                  return AutoScrollTag(
                    key: ValueKey(f['index']),
                    controller: _controller,
                    index: f['index'],
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: HomeCategoryPanel(f),
                      key: _keys[f['index']],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _leftAnimateToIndex(int index) {
    if (_selectedCategory['index'] != index && _isSelectedTimeOut) {
      setState(() {
        _selectedCategory = _categorys[index];
      });
      _scrollController.position.moveTo(index * 50.0 - 50.0);
    }
  }

  _rightAnimateToIndex(f) {
    setState(() {
      _isSelectedTimeOut = false;
      _selectedCategory = f;
    });
    _controller.scrollToIndex(f['index'],
        duration: Duration(milliseconds: 200),
        preferPosition: AutoScrollPosition.begin);

    _timer = Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _isSelectedTimeOut = true;
      });
    });
  }

  getRectFromKey(int index, GlobalKey globalKey) {
    RenderBox renderBox = globalKey?.currentContext?.findRenderObject();

    if (renderBox != null) {
      var offset = renderBox.localToGlobal(Offset(0.0, renderBox.size.height));
      return {
        'index': index,
        'height': renderBox.size.height,
        'offsetX': offset.dx,
        'offsetY': offset.dy
      };
    } else {
      return null;
    }
  }

  Widget _hearderBar = GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.search,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(width: 5.0),
          Expanded(
            child: Text(
              '请输入您想要的商品',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  List<Widget> _leftListViewItems() {
    return _categorys.map((f) {
      return GestureDetector(
        child: Container(
          color: f['index'] == _selectedCategory['index']
              ? Colors.white
              : Colors.transparent,
          alignment: Alignment.center,
          height: 50.0,
          child: Container(
            alignment: Alignment.center,
            width: 100.0,
            height: 25.0,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: f['index'] == _selectedCategory['index']
                      ? ColorUtil.getColor('primary')
                      : Colors.transparent,
                  width: 4.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: Text(
              f['name'],
              style: TextStyle(
                color: f['index'] == _selectedCategory['index']
                    ? ColorUtil.getColor('primary')
                    : null,
                fontSize:
                    f['index'] == _selectedCategory['index'] ? 14.0 : 12.0,
                fontWeight: f['index'] == _selectedCategory['index']
                    ? FontWeight.w600
                    : null,
              ),
            ),
          ),
        ),
        onTap: () {
          _rightAnimateToIndex(f);
        },
      );
    }).toList();
  }
}
