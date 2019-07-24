import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:ui';
import '../../../../utils/color.dart';

class RecommendTab extends StatefulWidget {
  RecommendTab({Key key}) : super(key: key);

  _RecommendTabState createState() => _RecommendTabState();
}

class _RecommendTabState extends State<RecommendTab> with AutomaticKeepAliveClientMixin {
  final List<String> _bannerImgs = [
    'https://bfs.biyao.com/group1/M00/FA/6E/rBACVF0MlweALHlBAAI3UCw4K1k934.jpg',
    'https://bfs.biyao.com/group1/M00/00/7D/rBACVF0V9FWAToviAADOPml0M8w079.jpg',
    'https://bfs.biyao.com/group1/M00/24/DE/rBACVF0nHsSAV3buAADhqVUE4wE375.jpg',
    'https://bfs.biyao.com/group1/M00/F2/C0/rBACYV0AQnGANFRZAAI9dDGaj9M926.jpg',
    'https://bfs.biyao.com/group1/M00/FA/A3/rBACW10K7ouAfA9OAAI7mZIWSyc997.jpg',
    'https://bfs.biyao.com/group1/M00/F7/BE/rBACW10HP1aAb7F3AAFt8tObYqc376.jpg'
  ];

  Widget _buildItem(BuildContext context, int index) {
    return new Image.network(
      '${this._bannerImgs[index]}',
      fit: BoxFit.cover,
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: window.physicalSize.width / 9,
          child: Swiper(
            outer: false,
            itemBuilder: this._buildItem,
            itemCount: this._bannerImgs.length,
            autoplay: true,
            pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              builder: new DotSwiperPaginationBuilder(
                color: Colors.white,
                activeColor: ColorUtil.getColor('primary'),
              ),
            ),
          ),
        ),
        Text('${window.physicalSize.width / 9}'),
      ],
    );
  }
}
