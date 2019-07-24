import 'package:flutter/material.dart';

const Map<String, Color> colorMap = const {
  'primary': Color.fromRGBO(127, 67, 149, 1.0), // #7f4395
};

class ColorUtil {
  static Color getColor(String name) {
    if (colorMap.containsKey(name)) {
      return colorMap[name];
    }
    return Color.fromRGBO(127, 67, 149, 1.0);
  }
}
