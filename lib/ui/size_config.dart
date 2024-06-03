import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _medaiQueryData;
  static late double screenWidth;
  static late double screenhight;
  static late Orientation orientation;
  void init(BuildContext context) {
    _medaiQueryData = MediaQuery.of(context);
    screenWidth = _medaiQueryData.size.width;
    print('$screenWidth');
    screenhight = _medaiQueryData.size.height;
    orientation = _medaiQueryData.orientation;
  }
}
