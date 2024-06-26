import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const PrimaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: PrimaryClr,
    colorScheme: const ColorScheme.light(),
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: PrimaryClr,
    colorScheme: const ColorScheme.dark(),
    brightness: Brightness.dark,
  );
}

TextStyle get headingstyle {
  return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : darkGreyClr);
}

TextStyle get subHeadingstyle {
  return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : darkGreyClr);
}

TextStyle get titlestyle {
  return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode ? Colors.white : darkGreyClr);
}

TextStyle get subTitleStyle {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : darkGreyClr);
}

TextStyle get bodystyle {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.white : darkGreyClr);
}

TextStyle get bodyTowstyle {
  return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode ? Colors.grey[200] : darkGreyClr);
}
