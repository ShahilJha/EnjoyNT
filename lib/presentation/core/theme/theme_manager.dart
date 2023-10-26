import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

//TODO: implement switch to dark theme mode
//REF: https://www.youtube.com/watch?v=6YuQEVN6j-g&t=415s
//REF: https://www.youtube.com/watch?v=66dj7wqXfeA
@singleton
class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  toggletheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
