import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _Box = GetStorage();
  final _key = 'isDarkMode';
  _savethemetomBox(bool isDarkMode) => _Box.write(_key, isDarkMode);

  bool _loadthemeFormBox() => _Box.read<bool>(_key) ?? false;

  ThemeMode get theme => _loadthemeFormBox() ? ThemeMode.dark : ThemeMode.light;
  switchTheme() {
    Get.changeThemeMode(_loadthemeFormBox() ? ThemeMode.light : ThemeMode.dark);
    _savethemetomBox(!_loadthemeFormBox());
  }
}
