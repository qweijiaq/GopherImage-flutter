import 'package:flutter/material.dart';

class AppTheme {
  // 亮色主题
  static ThemeData light = ThemeData(
    primaryColor: Colors.deepOrangeAccent,
    colorScheme: ColorScheme.light(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.amber,
    ).copyWith(secondary: Colors.deepPurple.shade900),
  );

  // 暗色主题
  static ThemeData dark = ThemeData(
    primaryColor: Colors.deepOrangeAccent,
    colorScheme: ColorScheme.dark(
      primary: Colors.cyan,
      secondary: Colors.amber,
    ).copyWith(secondary: Colors.deepPurple.shade900),
  );
}
