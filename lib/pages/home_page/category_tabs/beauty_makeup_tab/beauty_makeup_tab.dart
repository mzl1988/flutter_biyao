import 'package:flutter/material.dart';
import '../../../../commons/custom_sliver_persistent_header.dart';
import '../../../../utils/color.dart';
import '../../../../components/home_category_nav.dart';
import '../../../../components/product_card.dart';
import './product_data.dart';

class BeautyMakeupTab extends StatefulWidget {
  BeautyMakeupTab({Key key}) : super(key: key);

  _BeautyMakeupTabState createState() => _BeautyMakeupTabState();
}

class _BeautyMakeupTabState extends State<BeautyMakeupTab>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  List _productList = new List(); //列表要展示的数据
  ScrollController _scrollController = ScrollController();
  final List _categorys = [
    {
      'name': '精华',
      'image':
          'https://bfs.biyao.com/group1/M00/01/F2/rBACYVkT4WeAP9lqAAApfW2-uz4116.jpg'
    },
    {
      'name': '面膜',
      'image':
          'https://bfs.biyao.com/group1/M00/F3/EF/rBACYV0Bs4SAL7sqAAB4kquPoHQ833.jpg'
    },
    {
      'name': '乳液面霜',
      'image':
          'https://bfs.biyao.com/group1/M00/32/90/rBACW1q8iVGAdHh_AACbOdzeLfo605.jpg'
    },
    {
      'name': '眼部护理',
      'image':
          'https://bfs.biyao.com/group1/M00/00/71/wKhkVFkC3peAM2cvAACd_tBznt4998.jpg'
    },
    {
      'name': '化妆水',
      'image':
          'https://bfs.biyao.com/group1/M00/45/05/rBACVFtVnBSAaBzBAAB8b9fuuaY994.jpg'
    },
    {
      'name': '洁面/卸妆',
      'image':
          'https://bfs.biyao.com/group1/M00/01/F3/rBACW1kT4WeALek9AAAbiu6Mgmw235.jpg'
    },
    {
      'name': '底妆',
      'image':
          'https://bfs.biyao.com/group1/M00/00/39/rBACVFkT4WaAIGDzAAAkXTUP5Xc656.jpg'
    },
    {
      'name': '唇妆',
      'image':
          'https://bfs.biyao.com/group1/M00/84/D7/rBACVFwkwBSAIFYBAABFE92n_Ro204.jpg'
    },
    {
      'name': '眼妆',
      'image':
          'https://bfs.biyao.com/group1/M00/7B/37/rBACYVwMmUGAVr7qAACaC7YGB64948.jpg'
    },
    {
      'name': '查看全部',
      'image': 'https://static.biyao.com/mnew/img/base/zwpic_5f672e7.png'
    }
  ];

  int tabIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadProduct();
    _scrollController.addListener(() async {
      if (isLoading || _productList.length > 100) {
        return;
      }
      double pixels = _scrollController.position.maxScrollExtent -
          _scrollController.position.pixels;
      if (pixels <= 150.0) {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(Duration(milliseconds: 1000), () {
          _loadProduct();
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              HomeCategoryNav(_categorys),
              Container(
                color: ColorUtil.getColor('bg'),
                height: 10.0,
              ),
            ],
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: CustomSliverPersistentHeader(
            minHeight: 40.0,
            maxHeight: 40.0,
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[100],
                    width: 0.55,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          '热门',
                          style: TextStyle(
                            color: tabIndex == 0
                                ? ColorUtil.getColor('primary')
                                : Colors.black54,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          tabIndex = 0;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          '销量',
                          style: TextStyle(
                            color: tabIndex == 1
                                ? ColorUtil.getColor('primary')
                                : Colors.black54,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          tabIndex = 1;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text(
                          '价格',
                          style: TextStyle(
                            color: tabIndex == 2
                                ? ColorUtil.getColor('primary')
                                : Colors.black54,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          tabIndex = 2;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: ColorUtil.getColor('bg'),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 1.0,
                  runSpacing: 1.0,
                  children: _productList.map((f) {
                    return ProductCard(f);
                  }).toList(),
                ),
              ),
              Container(
                height: 100.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _productList.length > 100
                        ? <Widget>[
                            Text(''),
                          ]
                        : <Widget>[
                            CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(
                                    ColorUtil.getColor('primary'))),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '加载中...',
                            ),
                          ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _loadProduct() {
    setState(() {
      _productList = [..._productList, ...ProductData.getProducts()];
      isLoading = false;
    });
  }
}
