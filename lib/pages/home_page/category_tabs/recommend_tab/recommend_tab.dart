import 'package:flutter/material.dart';
import '../../../../components/home_swiper.dart';
import '../../../../components/product_card.dart';
import '../../../../components/home_guarantee_bar.dart';
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
  ScrollController _scrollController = ScrollController();

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
          child: HomeSwiper(),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              HomeGuaranteeBar(),
              SizedBox(height: 10.0),
              _titleline,
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
        ),
      ],
    );
  }

  _loadProduct() {
    setState(() {
      _productList = [..._productList, ...ProductData.getProducts()];
      isLoading = false;
    });
  }

  Widget _titleline = Container(
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
