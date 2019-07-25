import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../../../components/product_card.dart';
import '../../../../utils/color.dart';
import './product_data.dart';

class RecommendTab extends StatefulWidget {
  RecommendTab({Key key}) : super(key: key);

  _RecommendTabState createState() => _RecommendTabState();
}

class _RecommendTabState extends State<RecommendTab>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  List _productList = new List(); //列表要展示的数据
  ScrollController _scrollController = ScrollController(); //listview的控制器

  final List<String> _bannerImgs = [
    'https://bfs.biyao.com/group1/M00/FA/6E/rBACVF0MlweALHlBAAI3UCw4K1k934.jpg',
    'https://bfs.biyao.com/group1/M00/00/7D/rBACVF0V9FWAToviAADOPml0M8w079.jpg',
    'https://bfs.biyao.com/group1/M00/24/DE/rBACVF0nHsSAV3buAADhqVUE4wE375.jpg',
    'https://bfs.biyao.com/group1/M00/F2/C0/rBACYV0AQnGANFRZAAI9dDGaj9M926.jpg',
    'https://bfs.biyao.com/group1/M00/FA/A3/rBACW10K7ouAfA9OAAI7mZIWSyc997.jpg',
    'https://bfs.biyao.com/group1/M00/F7/BE/rBACW10HP1aAb7F3AAFt8tObYqc376.jpg'
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadProduct();
    _scrollController.addListener(() async {
      if (isLoading) {
        return;
      }
      double pixels = _scrollController.position.maxScrollExtent -
          _scrollController.position.pixels;
      if (pixels <= 100.0) {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(Duration(milliseconds: 1500), () {
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
    return ListView(
      controller: _scrollController,
      children: <Widget>[
        Container(
          height: 135.0,
          child: _swiper(),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _guarantee(),
          ),
        ),
        SizedBox(height: 10.0),
        _titleline(),
        Container(
          color: ColorUtil.getColor('bg'),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 1.0,
            runSpacing: 1.0,
            children: _productList.map((f) {
              return Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width * 0.5 - 0.5,
                // height: 00.0,
                child: ProductCard(f),
              );
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
              children: !isLoading
                  ? <Widget>[]
                  : <Widget>[
                      CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(ColorUtil.getColor('primary'))),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '加载中...',
                      ),
                    ],
            ),
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

  _swiper() {
    return Swiper(
      outer: false,
      itemBuilder: _buildItem,
      itemCount: _bannerImgs.length,
      autoplay: true,
      pagination: SwiperPagination(
        alignment: Alignment.bottomRight,
        builder: new DotSwiperPaginationBuilder(
          color: Colors.white,
          activeColor: ColorUtil.getColor('primary'),
        ),
      ),
    );
  }

  Widget _titleline() {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  '热销 · 好评',
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: ColorUtil.getColor('primary54'),
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(height: 5.0),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '用户购买热度实时推荐',
                style: TextStyle(color: ColorUtil.getColor('golden')),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _guarantee() {
    return [
      Text(
        '大牌品质',
        style:
            TextStyle(fontSize: 13.0, color: ColorUtil.getColor('primary54')),
      ),
      Text(
        '/',
        style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
      ),
      Text(
        '工厂价格',
        style:
            TextStyle(fontSize: 13.0, color: ColorUtil.getColor('primary54')),
      ),
      Text(
        '/',
        style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
      ),
      Text(
        '分期支付',
        style:
            TextStyle(fontSize: 13.0, color: ColorUtil.getColor('primary54')),
      ),
      Text(
        '/',
        style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
      ),
      Text(
        '顺丰包邮',
        style:
            TextStyle(fontSize: 13.0, color: ColorUtil.getColor('primary54')),
      ),
      Text(
        '/',
        style: TextStyle(fontSize: 13.0, color: Colors.grey[350]),
      ),
      Text(
        '无忧退款',
        style:
            TextStyle(fontSize: 13.0, color: ColorUtil.getColor('primary54')),
      ),
    ];
  }

  Widget _buildItem(BuildContext context, int index) {
    return new Image.network(
      '${this._bannerImgs[index]}',
      fit: BoxFit.cover,
    );
  }
}
