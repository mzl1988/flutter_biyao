import 'package:flutter/material.dart';
import '../../utils/color.dart';

import './category_tabs/recommend_tab/recommend_tab.dart';
import './category_tabs/beauty_makeup_tab/beauty_makeup_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<String> _category = [
    '推荐',
    '美妆',
    '个护',
    '女装',
    '男装',
    '箱包',
    '内衣配饰',
    '鞋靴',
    '家纺',
    '眼镜',
    '电器',
    '数码',
    '餐厨',
    '运动',
    '母婴',
    '家装',
    '家具',
    '饮食',
    '汽配',
    '正餐',
    '宠物',
    '定制',
    '健康保健'
  ];
  final List<Widget> _tabViews = [
    RecommendTab(),
    BeautyMakeupTab(),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...'),
    Text('开发中...')
  ];

  @override
  void initState() {
    super.initState();
    print(_category.length);
    _tabController = TabController(vsync: this, length: _category.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtil.getColor('bg'),
      appBar: AppBar(
        titleSpacing: 0.0,
        elevation: 0.0,
        title: _hearderBar,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            color: Colors.grey[400],
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[300],
                  width: 0.55,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: ColorUtil.getColor('primary'),
              unselectedLabelColor: Colors.black54,
              indicatorColor: ColorUtil.getColor('primary'),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: List.generate(this._category.length, (i) {
                return Tab(text: this._category[i]);
              }),
            ),
          ),
        ),

        // bottom: TabBar(
        //   controller: _tabController,
        //   isScrollable: true,
        //   labelColor: ColorUtil.getColor('primary'),
        //   unselectedLabelColor: Colors.black54,
        //   indicatorColor: ColorUtil.getColor('primary'),
        //   indicatorSize: TabBarIndicatorSize.label,
        //   tabs: List.generate(this._category.length, (i) {
        //     return Tab(text: this._category[i]);
        //   }),
        // ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(this._tabViews.length, (i) {
          return this._tabViews[i];
        }),
      ),
    );
  }

  Widget _hearderBar = GestureDetector(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
      margin: EdgeInsets.only(left: 12.0),
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
}
