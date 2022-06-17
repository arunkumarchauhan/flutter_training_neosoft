import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier{
ThemeMode _themeMode=ThemeMode.light;
get themeMode=>_themeMode;
toggleTheme(bool isDark){

  _themeMode=isDark?ThemeMode.dark:ThemeMode.light;
  notifyListeners();
}

}