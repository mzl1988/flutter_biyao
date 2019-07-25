import 'package:flutter/material.dart';

const Map<String, Color> colorMap = const {
  'primary': Color.fromRGBO(127, 67, 149, 1.0), // #7f4395
  'primary54': Color.fromRGBO(150, 135, 164, 1.0), // #9687A4
  'bg': Color.fromRGBO(244, 244, 244, 1.0), // #F4F4F4
  'golden': Color.fromRGBO(191,158,107, 1.0), // #BF9E6B
  'warning': Color.fromRGBO(247,167,1, 1.0), // #F7A701,
  'danger': Color.fromRGBO(255,54,55, 1.0), // #ff3637
};

class ColorUtil {
  static Color getColor(String name) {
    if (colorMap.containsKey(name)) {
      return colorMap[name];
    }
    return Color.fromRGBO(127, 67, 149, 1.0);
  }
}
