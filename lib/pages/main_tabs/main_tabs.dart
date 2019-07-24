import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../home_page/home_page.dart';
import '../category_page/category_page.dart';
import '../shopping_cart/shopping_cart_page.dart';
import '../mine_page/mine_page.dart';

class MainTabs extends StatefulWidget {
  MainTabs({Key key}) : super(key: key);

  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    CategoryPage(),
    ShoppingCartPage(),
    MinePage()
  ];
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('我的'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: this._currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorUtil.getColor('primary'),
        unselectedItemColor: Colors.grey,
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: this._items,
      ),
    );
  }
}
