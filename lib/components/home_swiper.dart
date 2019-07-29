import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../utils/color.dart';

class HomeSwiper extends StatefulWidget {
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  final List<String> _bannerImgs = [
    'https://bfs.biyao.com/group1/M00/FA/6E/rBACVF0MlweALHlBAAI3UCw4K1k934.jpg',
    'https://bfs.biyao.com/group1/M00/00/7D/rBACVF0V9FWAToviAADOPml0M8w079.jpg',
    'https://bfs.biyao.com/group1/M00/24/DE/rBACVF0nHsSAV3buAADhqVUE4wE375.jpg',
    'https://bfs.biyao.com/group1/M00/F2/C0/rBACYV0AQnGANFRZAAI9dDGaj9M926.jpg',
    'https://bfs.biyao.com/group1/M00/FA/A3/rBACW10K7ouAfA9OAAI7mZIWSyc997.jpg',
    'https://bfs.biyao.com/group1/M00/F7/BE/rBACW10HP1aAb7F3AAFt8tObYqc376.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      child: _swiper(),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Image.network(
      '${this._bannerImgs[index]}',
      fit: BoxFit.cover,
    );
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
}
