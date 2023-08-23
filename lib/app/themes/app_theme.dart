import 'package:flutter/material.dart';

class AppTheme {
  // 亮色主题
  static ThemeData light = ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    colorScheme: ColorScheme.light(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.amber,
    ).copyWith(secondary: Colors.deepPurple.shade900),
  );

  // 暗色主题
  static ThemeData dark = ThemeData(
    primaryColor: Colors.deepPurpleAccent,
    colorScheme: ColorScheme.dark(
      primary: Colors.deepPurpleAccent,
      secondary: Colors.deepPurpleAccent,
    ).copyWith(secondary: Colors.deepPurple.shade900),
  );
}
