import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../utils/color.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  ScrollController _scrollController = ScrollController();
  AutoScrollController _controller = AutoScrollController();
  var _keys = {};
  List<dynamic> _categorys = [
    {'name': '美妆', 'index': 0},
    {'name': '个护', 'index': 1},
    {'name': '女装', 'index': 2},
    {'name': '男装', 'index': 3},
    {'name': '箱包', 'index': 4},
    {'name': '内衣配饰', 'index': 5},
    {'name': '鞋靴', 'index': 6},
    {'name': '家纺', 'index': 7},
    {'name': '眼镜', 'index': 8},
    {'name': '电器', 'index': 9},
    {'name': '数码', 'index': 10},
    {'name': '餐厨', 'index': 11},
    {'name': '运动', 'index': 12},
    {'name': '母婴', 'index': 13},
    {'name': '家装', 'index': 14},
    {'name': '家具', 'index': 15},
    {'name': '饮食', 'index': 16},
    {'name': '汽配', 'index': 17},
    {'name': '正餐', 'index': 18},
    {'name': '宠物', 'index': 19},
    {'name': '定制', 'index': 20},
    {'name': '健康保健', 'index': 21}
  ];

  dynamic _selectedCategory;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedCategory = _categorys[0];
    });
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
                int widgetIndex = widgetIndexs[0]['index'];
                if (widgetIndex != _selectedCategory['index']) {
                  _leftAnimateToIndex(widgetIndex);
                }
                return true;
              },
              child: ListView(
                controller: _controller,
                children: _categorys.map<Widget>((f) {
                  _keys[f['index']] = new GlobalKey();
                  return AutoScrollTag(
                    key: ValueKey(f['index']),
                    controller: _controller,
                    index: f['index'],
                    child: Container(
                      height: 160.0,
                      child: Text(f['name'] + ': ${f['index']}'),
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
    setState(() {
      _selectedCategory = _categorys[index];
    });
    _scrollController.animateTo(index * 60.0,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  _rightAnimateToIndex(f) {
    setState(() {
      _selectedCategory = f;
    });
    _controller.scrollToIndex(f['index'],
        duration: Duration(milliseconds: 200),
        preferPosition: AutoScrollPosition.begin);
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
          height: 60.0,
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
                    f['index'] == _selectedCategory['index'] ? 16.0 : null,
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
